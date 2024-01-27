

import 'package:app_chungkhoan_thuctap/chondanhmuc/chondanhlist.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChonDanhMuc extends StatefulWidget {
  const ChonDanhMuc({
    super.key,
  });

  @override
  State<ChonDanhMuc> createState() => _ChonDanhMucState();
}

class _ChonDanhMucState extends State<ChonDanhMuc> {

  late ChungKhoanAppProvider _chungKhoanAppProvider;

  @override
  void initState(){
    _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Chọn danh mục",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 24,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(238, 238, 238, 1)),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(238, 238, 238, 1),
            hintText: "Tìm Kiếm",
            hintStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontSize: 16,
            ),
            prefixIcon: const Icon(Icons.gps_fixed_outlined),
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0.4,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),

        listViewDanhMuc(context),
        // Expanded(
        //   child: ListView.builder(
        //       itemCount: danhmucs.length,
        //       itemBuilder: (context, index) {
        //         final danhmuc = danhmucs[index];
        //         return DanhMucList(tendanhmuc: danhmuc['name'] as String);
        //       }),
        // )
      ]),
    );
  }

  Widget listViewDanhMuc(BuildContext context){
    return Selector<ChungKhoanAppProvider, List>(
      builder: (context, danhmucs, child){
        return  Expanded(
          child: ListView.builder(
              itemCount: danhmucs.length,
              itemBuilder: (context, index) {
                final danhmuc = danhmucs[index];
                
                return DanhMucList(
                  tendanhmuc: danhmuc['name'] as String,
                  index: index,
                );
              }),
        );
      },
      shouldRebuild: (previous, next) => true,
      selector: (_,p1)=> p1.getDanhmucs);
  }
}
