
import 'chungkhoanlistmain.dart';
import 'package:flutter/material.dart' show BuildContext, Column, Expanded, ListView, MainAxisAlignment, SizedBox, StatelessWidget, Text, Widget;


class  ThiTruong extends StatelessWidget {
  const ThiTruong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Text("Screen 2")),
        SizedBox(
                  
                  height: 570,
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const LayOutChungKhoan();
                      }),
                ),
      ],
    );
  }
}

class  ThiTruong2 extends StatelessWidget {
  const ThiTruong2({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Text("Screen 1")),
        SizedBox(
                  
                  height: 570,
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const LayOutChungKhoan();
                      }),
                ),
      ],
    );
  }
}
class  ThiTruong3 extends StatelessWidget {
  const ThiTruong3({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Text("Screen 3")),
        SizedBox(
                  
                  height: 570,
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const LayOutChungKhoan();
                      }),
                ),
      ],
    );
  }
}
class  ThiTruong4 extends StatelessWidget {
  const ThiTruong4 ({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Text("Screen 4")),
        SizedBox(
                  
                  height: 570,
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const LayOutChungKhoan();
                      }),
                ),
      ],
    );
  }
}


