

import 'package:app_chungkhoan_thuctap/listchungkhoanmain.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DanhMucDisplayItem extends StatefulWidget {
  final String tendanhmuc; 
  const DanhMucDisplayItem({super.key, required this.tendanhmuc});

  @override
  State<DanhMucDisplayItem> createState() => _DanhMucDisplayItemState();
}

class _DanhMucDisplayItemState extends State<DanhMucDisplayItem> {

  late ChungKhoanAppProvider _chungKhoanAppProvider;
  @override
  void initState() {
     _chungKhoanAppProvider =  context.read<ChungKhoanAppProvider>();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tendanhmuc.toString().toUpperCase()),
        centerTitle: true,
      ),

      body: listviewWidget(context),
      //Center(
      //   child: Text(_chungKhoanAppProvider.getDanhmucItems(widget.tendanhmuc)['cophieus'].toString()),
      // ),
    );
  }
  Widget listviewWidget(BuildContext context) {
  return Selector<ChungKhoanAppProvider, List>(
    selector: (p0, p1) => p1.getDanhmucItems(widget.tendanhmuc.toString())['cophieus'],
    shouldRebuild: (p,n)=> true,
    builder: (context, listCoPhieus, child) {
      
      if(listCoPhieus.isEmpty){
        return Container();
      }else{
        return Expanded(
        child: ListView.builder(
            itemCount: listCoPhieus.length,
            itemBuilder: (context, index) {
              final chungkhoan = listCoPhieus[index];
              print('1234567');
              print(chungkhoan);
              return LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,
              );}));
    }
      }
      
  );
}
}