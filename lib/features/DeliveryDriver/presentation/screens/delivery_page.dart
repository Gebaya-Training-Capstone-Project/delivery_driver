// lib/features/auth/presentation/pages/home_page.dart
import 'package:delivery_driver/core/router.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = screenHeight-110;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eshi - Delivery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Container(

            height: availableHeight,
            // clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    //MAP
                    Container(
                      height: 400,
                      width: double.infinity,
                      child: Map(),
                    ),
                    //Restaurant
                    Center(child: Container(
                        height: 400,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, 0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [
                              const Color(0xFF0FB621),
                              const Color(0xFF0FC422),
                              const Color(0xFF8DDD5A),
                              const Color(0xFFD50B27),
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 15,
                              right: 15,
                              top: 80,
                              child: Opacity(
                                opacity: 1,
                                child: Container(
                                  height: 300,
                                  width: double.infinity,
                                  //clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.50, -0.00),
                                      end: Alignment(0.50, 1.00),
                                      colors: [
                                        const Color(0xFFC7C196),
                                        const Color(0xE0615E49),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 0.40,
                                        offset: Offset(0, 4),
                                        spreadRadius: 13,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    //Restaurant
                                    children: [
                                      //Description
                                      Positioned(
                                        left: 153,
                                        top: 88,
                                        child: SizedBox(
                                          width: 195,
                                          height: 91,
                                          child: Text(
                                            'A juicy grilled chicken breast served on a toasted bun with fresh lettuce, tomato, and creamy mayo. Perfectly seasoned and packed with flavor.',
                                            style: TextStyle(
                                              color: const Color(0xFF1A1A1A),
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w800,
                                              height: 1.23,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Name
                                      Positioned(
                                        left: 60,
                                        top: 22,
                                        child: SizedBox(
                                          width: 157,
                                          height: 25,
                                          child: Text(
                                            'Restaurant Name',
                                            style: TextStyle(
                                              color: const Color(0xFF1A1A1A),
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w800,
                                              height: 1.07,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //OrderId
                                      Positioned(
                                        left: 52,
                                        top: 111,
                                        child: SizedBox(
                                          width: 88,
                                          height: 25,
                                          child: Text(
                                            'Order ID',
                                            style: TextStyle(
                                              color: const Color(0xFF1A1A1A),
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w800,
                                              height: 1.07,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Pickup
                                      Positioned(
                                        left: 229,
                                        top: 56,
                                        child: Text(
                                          'Pickup Location',
                                          style: TextStyle(
                                            color: const Color(0xFF1A1A1A),
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 1.07,
                                          ),
                                        ),
                                      ),
                                      //PhoneNumber
                                      Positioned(
                                        left: 229,
                                        top: 25,
                                        child: Text(
                                          '+2519562336',
                                          style: TextStyle(
                                            color: const Color(0xFF1A1A1A),
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w800,
                                            height: 1.07,
                                          ),
                                        ),
                                      ),
                                      //Slider
                                      Positioned(
                                        left: 84,
                                        bottom: 40,
                                        child: Container(
                                          width: 200,
                                          child: Slideto(),
                                        ),
                                      ),
                                      //Time
                                      Positioned(
                                        left: 33,
                                        top: 136,
                                        child: Container(
                                          width: 63,
                                          height: 56,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                100,
                                              ),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                right: -10,
                                                top: 20,
                                                child: SizedBox(
                                                  width: 88,
                                                  height: 50,
                                                  child: Text(
                                                    '15',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: const Color(
                                                        0xFFF06A0B,
                                                      ),
                                                      fontSize: 32,
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w800,
                                                      height: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    ),
                  ],
                ),

                //Customer
                Positioned(
                  left: 10,
                  right: 10,
                  top: 330,
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      height: 142,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.50, -0.00),
                          end: Alignment(0.50, 1.00),
                          colors: [
                            const Color(0xFF00A808),
                            const Color(0xFF0FB621),
                            const Color(0xF279C60D),
                            const Color(0xFF00A808),
                          ],
                          stops: [0.0, 0.20, 0.50, 1.0], ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      //Customer
                      child: Stack(
                        children: [
                          //Name
                          Positioned(
                            left: 60,
                            top: 15,
                            child: SizedBox(
                              width: 157,
                              height: 25,
                              child: Text(
                                'Customer Name',
                                style: TextStyle(
                                  color: const Color(0xFF1A1A1A),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  height: 1.07,
                                ),
                              ),
                            ),
                          ),
                          //Phone
                          Positioned(
                            left: 229,
                            top: 18,
                            child: Text(
                              '+2519562336',
                              style: TextStyle(
                                color: const Color(0xFF1A1A1A),
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 1.07,
                              ),
                            ),
                          ),
                          //DropOff
                          Positioned(
                            left: 229,
                            top: 49,
                            child: Text(
                              'DropOff Location',
                              style: TextStyle(
                                color: const Color(0xFF1A1A1A),
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 1.07,
                              ),
                            ),
                          ),
                          //Payment
                          Positioned(
                            left: 60,
                            top: 57,
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                color: const Color(0xFF1A1A1A),
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 1.07,
                              ),
                            ),
                          ),
                          //Slider
                          Positioned(
                            left: 84,
                            top: 84,
                            child: Container(
                              width: 200,
                              child: Slideto(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF0F8A14),
          boxShadow: [BoxShadow(blurRadius: 10, color: Color(0x0C1FEFFF))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/icons/order.png',
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              onPressed: () {context.go('/request');},
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),

              onPressed: () {context.go('/home');},
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/account.png',
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              onPressed: () {context.go('/account');},
            ),
          ],
        ),
      ),
    );
  }
}
class Slideto extends StatefulWidget {
  final VoidCallback? onSlide;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;

  const Slideto({
    Key? key,
    this.onSlide,
    this.onAccept,
    this.onCancel,
  }) : super(key: key);

  @override
  _SlidetoState createState() => _SlidetoState();
}

class _SlidetoState extends State<Slideto> {
  double _dragPosition = 0.0;
  final double _maxDrag = 160.0;
  String _label = 'Slide to Accept';
  bool _accepted = false;

  void _onDragUpdate(DragUpdateDetails details) {
    if (_accepted) return;

    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0.0, _maxDrag);

      if (_dragPosition < _maxDrag) {
        _label = 'Accepting';
        widget.onSlide?.call();
      }
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragPosition >= _maxDrag) {
      setState(() {
        _label = 'Accepted';
        _accepted = true;
      });
      widget.onAccept?.call();
    } else {
      setState(() {
        _dragPosition = 0.0;
        _label = 'Slide to Accept';
      });
      widget.onCancel?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          color: _accepted ? const Color(0xFF00A908) : const Color(0xFFA59E9E),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Center(
              child: Text(
                _label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 0),
              left: _dragPosition,
              top: 2,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _accepted
                        ? 'assets/icons/AcceptedIcon.png' // Change icon when accepted
                        : 'assets/icons/SlideSelector.png', // Default icon
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> with OSMMixinObserver {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );
    controller.addObserver(this);
  }

  @override
  void dispose() {
    controller.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: controller,
      osmOption: OSMOption(
        zoomOption: ZoomOption(
          initZoom: 12,
          minZoomLevel: 8,
          maxZoomLevel: 18,
          stepZoom: 1.0,
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: Icon(Icons.person_pin_circle, color: Colors.red, size: 60),
          ),
          directionArrowMarker: MarkerIcon(
            icon: Icon(Icons.navigation, color: Colors.blue, size: 60),
          ),
        ),
        showDefaultInfoWindow: true,
        enableRotationByGesture: true,
        showZoomController: true,
      ),
    );
  }

  // Observer methods
  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      print("Map is ready");
    }
  }

  @override
  Future<void> mapRestored() async {
    print("Map restored");
  }

  @override
  void onSingleTap(GeoPoint position) {
    print("Single tap at: ${position.latitude}, ${position.longitude}");
  }

  @override
  void onLongTap(GeoPoint position) {
    print("Long tap at: ${position.latitude}, ${position.longitude}");
  }

  @override
  void onRegionChanged(Region region) {
    print("Region changed");
  }

  @override
  void onRoadTap(RoadInfo road) {
    print("Tapped road with ${road.distance} km");
  }

  @override
  void onLocationChanged(GeoPoint userLocation) {
    print("User location: ${userLocation.latitude}, ${userLocation.longitude}");
  }
}
