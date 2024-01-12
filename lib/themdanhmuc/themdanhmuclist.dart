import 'package:flutter/material.dart';

class ThemDanhMucList extends StatelessWidget {
  const ThemDanhMucList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const  EdgeInsets.only( left:6, right: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  IntrinsicHeight(
                    child: Row(children: [
                       Text("VIX", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                      
                      ),
                      VerticalDivider(
                        width: 6,
                        thickness: 0.5,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Text("Hose", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),)
                    ],),
                  ),
          
                  Text("CHung Khan VIX", style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),)
          
                ],
                
                ),
          
                IconButton(
                  onPressed: (){}, 
                
                icon: const Icon(Icons.star_border_rounded))
                
                ]
              ),
              const Divider(
                thickness: 0.8,
                height: 16,
              )
        ],
      ),
    );

      
  }
}