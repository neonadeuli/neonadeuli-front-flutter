import 'package:geolocator/geolocator.dart';
import 'package:h3_flutter/h3_flutter.dart';

class CurrentLocationStatus {
  static bool _requireLocationPermission = true;
  static bool _requireSubLocationChangeEvent = true;
  static final H3 _h3 = const H3Factory().load();
  static const int _h3Resolution = 13;

  static Future<Position?> getCurrentPosition() async {
    try {
      if (_requireLocationPermission) {
        await _verifyLocationPermission();
        _requireLocationPermission = false;
      }

      if (_requireSubLocationChangeEvent) {
        _subLocationChangeEvent();
        _requireSubLocationChangeEvent = false;
      }

      return await Geolocator.getLastKnownPosition();
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future _verifyLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('위치 정보 서비스를 사용할 수 없습니다.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('위치 정보 권한이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          '위치 정보 권한을 획득할 수 없습니다.\n설정을 통해 어플의 위치 정보 권한을 허용해 주세요.');
    }
  }

  static void _subLocationChangeEvent() {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
    )).listen(positionChangeEvent);
  }

  // TODO: 추후 H3 인덱스 변화 감지를 통한 통신 코드로 변경할 것
  static void positionChangeEvent(Position position) async {
    BigInt index = _h3.geoToH3(
        GeoCoord(lon: position.longitude, lat: position.latitude),
        _h3Resolution);

    print('originalGeo(lon: ${position.longitude}, lat: ${position.latitude})');
    print('h3 $_h3Resolution res index: $index');
    print('h3 middle geo = ${_h3.h3ToGeo(index)}');
    print('=====================');
  }
}
