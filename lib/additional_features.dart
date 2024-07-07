import 'package:flutter/material.dart';

class AdditionalFeatures extends StatelessWidget {
  final IconData iconp;
  final String feature;
  final String value;

  const AdditionalFeatures({
  super.key,
  required this.iconp,
  required this.feature,
  required this.value,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
                  //color: Color.fromARGB(255, 244, 234, 203),
                  padding: const EdgeInsets.all(8),
                  width: 118,
                  
                  // decoration: BoxDecoration(
                  //   //borderRadius: BorderRadius.circular(8)
                  // ),
                  child: Column(
                    children: [
                      Icon(iconp,
                      size: 34,
                      ),
                      const SizedBox(height: 8),
                      Text(feature,
                      style: const TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(height: 8),
                      Text(value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                );
  }
}