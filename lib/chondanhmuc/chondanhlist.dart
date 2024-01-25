import 'package:app_chungkhoan_thuctap/themdanhmuc/danh_muc_display_item.dart';
import 'package:flutter/material.dart';

class DanhMucList extends StatelessWidget {
   final String tendanhmuc;
  const DanhMucList({super.key, required this.tendanhmuc,});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const DanhMucDisplayItem()));

        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text(tendanhmuc, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                const Icon(Icons.arrow_forward_ios_outlined,size: 24, )
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