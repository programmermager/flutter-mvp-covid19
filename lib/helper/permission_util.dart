import 'package:permission/permission.dart';

class PermissionUtil {
  Future<bool> requestPermission() async {
    var permissionNames = await Permission.requestPermissions([PermissionName.Location, PermissionName.Camera]);

    if (permissionNames[0].permissionStatus == PermissionStatus.allow &&
        permissionNames[1].permissionStatus == PermissionStatus.allow) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkPermissions() async{
    var permissions = await Permission.getPermissionsStatus([PermissionName.Location, PermissionName.Camera]);
    if (permissions[0].permissionStatus == PermissionStatus.allow &&
        permissions[1].permissionStatus == PermissionStatus.allow) {
      return true;
    } else {
      return false;
    }
  }
}
