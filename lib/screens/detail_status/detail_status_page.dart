import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:covid19/model/object/covid_detail.dart';
import 'package:covid19/res/colors.dart';
import 'package:covid19/res/string.dart';
import 'package:covid19/screens/detail_status/detail_status_contract.dart';
import 'package:covid19/screens/detail_status/detail_status_presenter.dart';
import 'package:covid19/screens/detail_status/view/panel_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailStatusPage extends StatefulWidget {
  String status;

  DetailStatusPage(this.status);

  @override
  _DetailStatusPageState createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage>
    implements DetailStatusView {
  List<CovidDetail> data = List();
  List<CovidDetail> filterData = List();
  String _mapStyle;
  GoogleMapController mapController;
  DetailStatusPresenter presenter;

  BitmapDescriptor customIcon;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    presenter = DetailStatusPresenter(this);
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    if (widget.status == Strings.comfirmed) {
      presenter?.getConfirmed();
    } else if (widget.status == Strings.recovered) {
      presenter.getRecovered();
    } else {
      presenter?.getDeaths();
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker();
    ScreenUtil.instance =
        ScreenUtil(width: 360, height: 640, allowFontScaling: true)
          ..init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(ColorsRes.colorPrimary),
        body: SlidingUpPanel(
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height / 2,
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  mapController.setMapStyle(_mapStyle);
                  setState(() {});
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(30.568041, 114.1603011),
                  zoom: 4.0,
                ),
                markers: _markers,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(ScreenUtil().setSp(15)),
                  child: Image.asset("assets/img/ic_back_circle.png"),
                ),
              ),
            ],
          ),
          color: Color(ColorsRes.colorAccent),
          panelBuilder: (sc) =>
              PanelView().show(sc, context, widget.status, filterData, onSearch: (_value) {
            presenter?.searchCountry(_value, data);
            return;
          }, onClick: (CovidDetail data) {
                mapController.animateCamera(CameraUpdate.newLatLng(LatLng(data.lat, data.long)));
                return;
              }
            ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil().setSp(10)),
              topRight: Radius.circular(ScreenUtil().setSp(10))),
        ),
      ),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  createMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset(
        (widget.status == Strings.comfirmed
            ? 'assets/img/img_confirmed_marker.png'
            : (widget.status == Strings.recovered
                ? 'assets/img/img_recovered_marker.png'
                : 'assets/img/img_deaths_marker.png')),
        60);
    customIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  @override
  void dismissLoading() {}

  @override
  void getError(int code, String message) {}

  @override
  void getSuccess(List<CovidDetail> response) {
    data.addAll(response);
    filterData.addAll(response);
    response.forEach((s) {
      _markers.add(Marker(
        markerId: MarkerId("${s.lat}${s.long}"),
        position: LatLng(s.lat, s.long),
        infoWindow: InfoWindow(
            title:
                "${s.provinceState != null ? s.provinceState : ""} ${s.countryRegion != null ? s.countryRegion : ""}",
            snippet:
                "Total confirmed ${s?.confirmed}, Total Recovered ${s?.recovered}"),
        icon: customIcon,
      ));
    });
    setState(() {});
  }

  @override
  void loading() {}

  @override
  void resultSearch(List<CovidDetail> data) {
    filterData.clear();
    filterData.addAll(data);
    setState(() {});
  }
}
