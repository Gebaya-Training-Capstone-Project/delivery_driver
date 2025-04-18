// lib/features/auth/presentation/pages/home_page.dart
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:delivery_driver/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


enum ButtonState { idle, calling, completed, error }
class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Eshi - request'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow, // Set your desired background color here
        child: DeliveryRequestList(), // Your custom widget
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

class CallButton extends StatefulWidget {
  const CallButton({super.key});

  @override
  _CallButtonState createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  ButtonState _currentState = ButtonState.idle;

  // Update the button state
  void _updateState(ButtonState newState) {
    setState(() {
      _currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    String buttonText;
    Color buttonColor;

    // Handle different states
    switch (_currentState) {
      case ButtonState.idle:
        buttonText = 'Call';
        buttonColor = Color(0xFF00A808); // Green
        break;
      case ButtonState.calling:
        buttonText = 'Calling...';
        buttonColor = Colors.blue; // Change color while calling
        break;
      case ButtonState.completed:
        buttonText = 'Call Ended';
        buttonColor = Color(0xEA0606FF); // Success color
        break;
      case ButtonState.error:
        buttonText = 'Error';
        buttonColor = Colors.red; // Error color
        break;
    }

    return GestureDetector(
      onTap: () {
        if (_currentState == ButtonState.idle) {
          _updateState(ButtonState.calling);
          // Simulate a call process, after some time switch to completed or error
          Future.delayed(Duration(seconds: 3), () {
            // Simulate success or failure
            bool isSuccessful = true; // Or false for error
            if (isSuccessful) {
              _updateState(ButtonState.completed);
            } else {
              _updateState(ButtonState.error);
            }
          });
        }
      },
      child: Container(
        width: 61,
        height: 31,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x331C4EFE),
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 9),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 2,
          ),
        ),
      ),
    );
  }
}
/*class SlideButton extends StatefulWidget{
  const SlideButton({super.key});

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton>{

}*/
class Deliveryrequest extends StatelessWidget {
  const Deliveryrequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: 366,
            height: 260,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, -0.00),
                end: Alignment(0.50, 1.00),
                colors: [const Color(0xFFC7C196), const Color(0xE0615E49)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 0.20,
                  offset: Offset(0, 3),
                  spreadRadius: 10,
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 159,
                  top: 136,
                  child: SizedBox(
                    width: 141,
                    height: 23,
                    child: Text(
                      'Earnings',
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
                Positioned(
                  left: 159,
                  top: 169,
                  child: SizedBox(
                    width: 141,
                    height: 23,
                    child: Text(
                      'Payment',
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
                Positioned(
                  left: 28,
                  top: 24,
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
                Positioned(
                  left: 28,
                  top: 78,
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
                Positioned(
                  left: 52,
                  top: 123,
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
                Positioned(
                  left: 167.6,
                  top: 93.17,
                  child: CallButton(),
                ),
                Positioned(
                  left: 289,
                  top: 11,
                  child: Container(
                    width: 64,
                    height: 81,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0035A8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x331C4EFE),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 13,
                          top: 49,
                          child: SizedBox(
                            width: 38,
                            height: 24,
                            child: Text(
                              'Explor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 163,
                  top: 11,
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
                Positioned(
                  left: 163,
                  top: 66,
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
                Positioned(
                  left: 83,
                  top: 201,
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(color: const Color(0xFFAE0202),
                      borderRadius: BorderRadius.circular(14),),

                    child: Slideto(),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 150,
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 18,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Text(
                              '15m',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFFF06A0B),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0.80,
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

        ]
    );
  }
}
/*class Deliveryrequest extends StatefulWidget{
  @override
  _Deliveryrequest createState() => _Deliveryrequest();

}*/
/*class _Deliveryrequest extends State<Deliveryrequest> {
  String earningText = 'Loading...';
  String paymentText = 'Loading...';
  String dropOffText = 'Loading...';
  String pickUpText = 'Loading...';
  String customerNameText = 'Loading...';
  String restaurantNameText = 'Loading...';
  String orderIdText = 'Loading...';
  String timeText = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend(); // for auto-load
  }

  void fetchDataFromBackend() async {
    var result = await yourApiCall();
    setState(() {
      earningText        = result['earnings'];
      paymentText         = result['payment'];
      dropOffText         = result['drop_off'];
      pickUpText          = result['pick_up'];
      customerNameText    = result['customer_name'];
      restaurantNameText  = result['restaurant_name'];
      orderIdText         = result['order_id'];
      timeText            = result['estimated_time']; // e.g. "25 mins"
    });
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.89,
          child: Container(
            width: 366,
            height: 260,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, -0.00),
                end: Alignment(0.50, 1.00),
                colors: [const Color(0xFFC7C196), const Color(0xE0615E49)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 0.20,
                  offset: Offset(0, 3),
                  spreadRadius: 10,
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 159,
                  top: 136,
                  child: SizedBox(
                    width: 141,
                    height: 23,
                    child: Text(
                      earningText,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 1.23,
                      ),
                    ),
                  ),
                ),  //Earning
                Positioned(
                  left: 159,
                  top: 169,
                  child: SizedBox(
                    width: 141,
                    height: 23,
                    child: Text(
                      paymentText,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 1.23,
                      ),
                    ),
                  ),
                ),  //Payment
                Positioned(
                  left: 28,
                  top: 24,
                  child: SizedBox(
                    width: 157,
                    height: 25,
                    child: Text(
                      customerNameText,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 1.07,
                      ),
                    ),
                  ),
                ),  //CustomerName
                Positioned(
                  left: 28,
                  top: 78,
                  child: SizedBox(
                    width: 157,
                    height: 25,
                    child: Text(
                      restaurantNameText,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 1.07,
                      ),
                    ),
                  ),
                ),  //RestaurantName
                Positioned(
                  left: 52,
                  top: 123,
                  child: SizedBox(
                    width: 88,
                    height: 25,
                    child: Text(
                      orderIdText,
                      style: TextStyle(
                        color: const Color(0xFF1A1A1A),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 1.07,
                      ),
                    ),
                  ),
                ),  //OrderId
                Positioned(
                  left: 167.6,
                  top: 93.17,
                  child: CallButton(),
                ),  //CallButton
                Positioned(
                  left: 289,
                  top: 11,
                  child: Container(
                    width: 64,
                    height: 81,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0035A8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x331C4EFE),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 13,
                          top: 49,
                          child: SizedBox(
                            width: 38,
                            height: 24,
                            child: Text(
                              'Explor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),  //Explor
                Positioned(
                  left: 163,
                  top: 11,
                  child: Text(
                    dropOffText,
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 1.07,
                    ),
                  ),
                ),  //Dropoff
                Positioned(
                  left: 163,
                  top: 66,
                  child: Text(
                    pickUpText,
                    style: TextStyle(
                      color: const Color(0xFF1A1A1A),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 1.07,
                    ),
                  ),
                ),  //PickUp
                Positioned(
                  left: 83,
                  top: 201,
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(color: const Color(0xFFAE0202)),
                    child: SlideAction(
                      text: 'Slide to Call', // Text inside the button
                      outerColor: Color(0xFF00A808), // Outer color (green)
                      innerColor: Colors.white, // Color inside the slider
                      elevation: 4, // Shadow effect
                      borderRadius: 12, // Rounded corners
                      sliderButtonIcon: Icon(Icons.call, color: Colors.white), // Icon inside the button
                      onSubmit: () {
                        // Action when slide is complete
                        print('Calling...');
                      },
                      height: 40, // Height of the entire button
                      sliderButtonIconSize: 30, // Size of the icon (call icon in this case)
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Size of the text inside the slider
                      ),
                    ),
                  ),
                ),  //Slider
                Positioned(
                  left: 30,
                  top: 150,
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 18,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Text(
                              timeText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFFF06A0B),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                height: 0.80,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),  //time
              ],
            ),
          ),
        ),
      ],
    );
  }

}*/




class Slideto extends StatefulWidget {
  final VoidCallback? onSlide;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;

  const Slideto({
    super.key,
    this.onSlide,
    this.onAccept,
    this.onCancel,
  });

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

class DeliveryRequestList extends StatelessWidget {
  const DeliveryRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    // Let's assume you have a list of items to display
    List<int> items = List.generate(10, (index) => index); // Example list of 10 items

    return Scaffold(
      appBar: AppBar(title: Text('Delivery Requests')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: [
              Color(0xFF0FB621),
              Color(0xFF0FC422),
              Color(0xFF8DDD5A),
              Color(0xFFD50B27),
            ],
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 10, bottom: 100),
          itemCount: items.length, // Adjust this to the length of your list
          separatorBuilder: (context, index) => SizedBox(height: 30),
          itemBuilder: (context, index) {
            return Deliveryrequest(); // Your item widget
          },
        ),
      ),
    );

  }
}
