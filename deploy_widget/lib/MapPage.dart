import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'DataList.dart';
import 'Meeting/Meeting_list.dart';
import 'Meeting/Meeting_making.dart';

class google_maping extends StatefulWidget {
  @override
  _GoogleMapingState createState() => _GoogleMapingState();
}

class _GoogleMapingState extends State<google_maping> {
  GoogleMapController? _mapController;
  int selectedIndex = 0;
  static final LatLng Main = LatLng(
    37.33636,
    127.2524,
  );
  static final LatLng EdormLatLng = LatLng(
    37.33639,
    127.2524,
  );
  static final LatLng engineering = LatLng(
    37.33743,
    127.2513,
  );
  static final LatLng  back = LatLng(
    37.33491,
    127.2534,
  );


  LatLng? _currentPosition;
  bool _isMyLocationEnabled = false;
  BitmapDescriptor? _customMarkerIconsoccer;
  BitmapDescriptor? _customMarkerIconbasketball;
  BitmapDescriptor? _customMarkerIcontennis;


  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  void _loadCustomMarker() async {
    _customMarkerIconbasketball= await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(1200, 1200)),
      'lib/images/basketball.png',
    );
    _customMarkerIconsoccer = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(1200, 1200)),
      'lib/images/soccer.png',
    );
    _customMarkerIcontennis = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(1200, 1200)),
      'lib/images/tennis.png',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: Main,
                    zoom: 16,
                  ),
                  myLocationEnabled: _isMyLocationEnabled,
                  myLocationButtonEnabled: false,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  markers: _createMarkers(),
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '위치 주소를 입력해주세요.',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              // 검색 로직을 여기에 추가
                            },
                          ),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataList.boardMenu.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = index; // 사용자가 선택한 인덱스로 상태 업데이트
                              });
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.grey))),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.circle, size: 14, color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(
                                  DataList.items[index],
                                  style: const TextStyle(fontSize: 14, color: Colors.black),
                                ),
                                const SizedBox(width: 3),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      final Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                      _mapController?.animateCamera(CameraUpdate.newLatLng(
                        LatLng(currentPosition.latitude, currentPosition.longitude),
                      ));
                      setState(() {
                        _isMyLocationEnabled = true;
                      });
                    },
                    child: Icon(Icons.my_location, color: Colors.black),
                    shape: CircleBorder(),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      // 새로운 기능 추가
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppointmentPage()),
                      );
                    },
                    child: Icon(Icons.create_outlined, color: Colors.white),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            );
          }

          return Center(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('customMarker'),
        position: EdormLatLng,
        icon: _customMarkerIconbasketball!,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseListPage()),
          );
        },
      ),
      Marker(
        markerId: MarkerId('customMarker'),
        position: engineering,
        icon: _customMarkerIconsoccer!,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseListPage()),
          );
        },
      ),
      Marker(
        markerId: MarkerId('customMarker'),
        position: back,
        icon: _customMarkerIcontennis!,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseListPage()),
          );
        },
      ),
    };
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    return '위치 권한이 허가 되었습니다.';
  }
}


