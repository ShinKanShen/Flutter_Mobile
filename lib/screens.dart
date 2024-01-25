
import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'listchungkhoanmain.dart';
import 'package:flutter/material.dart' show BuildContext, Colors, Column, Expanded, ListView, MainAxisAlignment, SizedBox, StatelessWidget, Text, Widget;


class ThiTruong extends StatelessWidget {
  const ThiTruong({super.key});

  @override
  Widget build(BuildContext context) {

    final ChungKhoanAppProvider _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          
          padding:const  EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(_chungKhoanAppProvider.getDanhmucs.last['name'], style: const TextStyle(
                color: Colors.black, fontSize: 18,
              ),)
            ],
          ),
        )
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


