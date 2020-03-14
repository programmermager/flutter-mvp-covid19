import 'package:flutter/material.dart';

import 'color_loader.dart';
import 'dot_type.dart';

class LoadingLoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Container(
        height: (MediaQuery.of(context).size.height / 4) - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Please wait, verify your phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                BounceLoader(
                  dotOneColor: Colors.blueAccent,
                  dotTwoColor: Colors.blueAccent,
                  dotThreeColor: Colors.blueAccent,
                  dotType: DotType.circle,
                  dotIcon: Icon(Icons.adjust),
                  duration: Duration(seconds: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressDialog{
  Future<void> loading(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Container(
            height: (MediaQuery.of(context).size.height / 4) - 50,
            child: BounceLoader(
              dotOneColor: Colors.redAccent,
              dotTwoColor: Colors.blueAccent,
              dotThreeColor: Colors.green,
              dotType: DotType.circle,
              dotIcon: Icon(Icons.adjust),
              duration: Duration(seconds: 1),
            ),
          ),
        );
      },
    );
  }
}

class CustomDialog{
  Future<void> deleteItem(BuildContext context, String title, String content, {Function onYesClicked}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Quicksand', fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Wrap(
                    spacing: 20,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("No",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.red,
                        child: Text("Yes",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),),
                        onPressed: () {
                          onYesClicked();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> confirmAction(BuildContext context, String title, String content, bool cancelable, {Function onYesClicked, Function onNoClicked}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: cancelable,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Quicksand', fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Wrap(
                    spacing: 20,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("No",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),),
                        onPressed: () {
                          onNoClicked();
                        },
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Text("Yes",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),),
                        onPressed: () {
                          onYesClicked();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> forceDialog(BuildContext context, String image, String title, String content, String btn, bool cancelable, {Function onYesClicked}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: cancelable,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Image.asset(image),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Quicksand', fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Wrap(
                    spacing: 20,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Text(btn, style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),),
                        onPressed: () {
                          onYesClicked();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
