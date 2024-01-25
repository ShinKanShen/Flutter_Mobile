import 'package:app_chungkhoan_thuctap/listchungkhoanmain.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DanhMucDisplayItem extends StatefulWidget {
  const DanhMucDisplayItem({super.key});

  @override
  State<DanhMucDisplayItem> createState() => _DanhMucDisplayItemState();
}

class _DanhMucDisplayItemState extends State<DanhMucDisplayItem> {
  @override
  Widget build(BuildContext context) {

    ChungKhoanAppProvider _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(_chungKhoanAppProvider.getDanhmucs.last['name']),
        centerTitle: true,
      ),

      body: Center(
        child: listviewWidget(context),
      ),
    );
  }
  Widget listviewWidget(BuildContext context) {
  return Selector<ChungKhoanAppProvider, List>(
    selector: (p0, p1) => p1.coPhieuSelected,
    shouldRebuild: (p,n)=> true,
    builder: (context, listCoPhieus, child) {
      return Expanded(
        child: ListView.builder(
            itemCount: listCoPhieus.length,
            itemBuilder: (context, index) {
              final chungkhoan = listCoPhieus[index];

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
    },
  );
}
}