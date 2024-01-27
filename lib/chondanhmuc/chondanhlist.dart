import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/danh_muc_display_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DanhMucList extends StatelessWidget {
   final String tendanhmuc;
   final int index ;
  const DanhMucList({super.key, required this.tendanhmuc, required this.index,});
  
  

  @override
  Widget build(BuildContext context) {
    ChungKhoanAppProvider _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    return Container(
      
      
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: GestureDetector(
        onTap: (){
          _chungKhoanAppProvider.setDanhMucText(tendanhmuc);
          
          print('tendanhmuc Onclick');
          print(_chungKhoanAppProvider.danhmucText);
          Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>  DanhMucDisplayItem(tendanhmuc: _chungKhoanAppProvider.getDanhmucs[index]['name'] as String ,)));

        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text(tendanhmuc, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                const Icon(Icons.arrow_forward_ios_outlined,size: 20, )
              ],
            ),
            const Divider(
              thickness: 0.5,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}