
import 'package:app_chungkhoan_thuctap/chondanhmuc/chondanhlist.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:flutter/material.dart';

class ChonDanhMuc extends StatelessWidget {
  const ChonDanhMuc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Chon Danh Muc",
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
            hintText: "Tim Kiem",
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
        Expanded(
          child: ListView.builder(
              itemCount: danhmucs.length,
              itemBuilder: (context, index) {
                final danhmuc = danhmucs[index];
                return DanhMucList(tendanhmuc: danhmuc['name'] as String);
              }),
        )
      ]),
    );
  }
}
