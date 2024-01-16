
import 'package:app_chungkhoan_thuctap/data/cophieu.dart';

import 'listchungkhoanmain.dart';
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
                    itemCount: coPhieus.length,
                  
                  itemBuilder: (context, index) {
                    final chungkhoan = coPhieus[index];
                    return  LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,

                    );}
                      ),
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
                       itemCount: coPhieus.length,
                  
                    itemBuilder: (context, index) {
                    final chungkhoan = coPhieus[index];
                    return  LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,

                    );}),
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
                       itemCount: coPhieus.length,
                  
                    itemBuilder: (context, index) {
                    final chungkhoan = coPhieus[index];
                    return  LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,

                    );}),
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
                      itemCount: coPhieus.length,
                  
                    itemBuilder: (context, index) {
                    final chungkhoan = coPhieus[index];
                    return  LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,

                    );}
                    ),
                ),
      ],
    );
  }
}


