import 'dart:ffi';

import 'package:flutter/material.dart';

class ThemDanhMucList extends StatelessWidget {
  final String tencp;
  final String tenCongty;
  final String tenSan;
  final int isSave;

  const ThemDanhMucList({
    required this.tenCongty,
    required this.tencp,
    required this.tenSan,
    required this.isSave,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const  EdgeInsets.only( left:6, right: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  IntrinsicHeight(
                    child: Row(children: [
                       Text(tencp.toString().toUpperCase(), 
                       style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                      
                      ),
                      const VerticalDivider(
                        width: 6,
                        thickness: 0.5,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Text(tenSan.toUpperCase(),
                       style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),)
                    ],),
                  ),
          
                  Text(tenCongty, 
                  style: const  TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),)
          
                ],
                
                ),
          
                IconButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    
                  ),
                
                
                icon:    Icon(Icons.star,
                color:  (isSave>0)? Colors.white: const Color.fromARGB(255, 225, 182, 30),
                 
                  
                )
                )
                ]
              ),
              const Divider(
                thickness: 0.3,
                height: 16,
              )
        ],
      ),
    );

      
  }
}