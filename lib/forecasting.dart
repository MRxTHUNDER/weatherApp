import 'package:flutter/material.dart';

class MyWethearCard extends StatelessWidget {
  final String time;
  final IconData iconpp;
  final String temp;

  const MyWethearCard({
  super.key,
  required this.time,
  required this.iconpp,
  required this.temp,
    });

  @override
  Widget build(BuildContext context) {
    return      Card(
                    color: const Color.fromARGB(255, 248, 216, 119),
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          //SizedBox(height: 8),
                          Text(time,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                              ),
                            ),
                          
                          SizedBox(height: 8),
                          Icon(iconpp,
                            size: 32,
                          ),
                          SizedBox(height: 8),
                          Text(temp, 
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold
                              ),
                              ),
                          //SizedBox(height: 8),
                        ],
                      ),
                    )
                  );
  }
}