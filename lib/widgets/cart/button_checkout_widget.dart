import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCheckoutWidget extends StatelessWidget {
  const ButtonCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 45.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(124, 58, 237,
                      1), 
                  elevation: 4.0, 

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  
                },
                child: const Text('Checkouts'),
              ),
            ),
          );
  }
}