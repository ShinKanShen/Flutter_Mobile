import 'package:app_chungkhoan_thuctap/chungkhoanmainscreen.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:app_chungkhoan_thuctap/screens.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/danh_muc_display_item.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmuclist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class ThemDanhMuc extends StatefulWidget {
  const ThemDanhMuc({super.key});
  // static Widget create(){
  //   return ChangeNotifierProvider(

  //     create: (context)=> ChungKhoanAppProvider(),
  //     child: const ThemDanhMuc(),
  //     );
  // }
  @override
  _ThemDanhMuc createState() => _ThemDanhMuc();
}

class _ThemDanhMuc extends State<ThemDanhMuc> {
  final TextEditingController _textEditingController = TextEditingController();

  late ChungKhoanAppProvider _chungKhoanAppProvider;

  @override
  void initState() {
    _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    _chungKhoanAppProvider.getNotSaveCoPhieus();

    super.initState();
  }

// show alert
  void showAlert(QuickAlertType type, String title, String text) {
    QuickAlert.show(context: context, type: type, title: title, text: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Thêm Danh mục mới",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          leading: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChungKhoanScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            child: const Icon(Icons.arrow_back_ios),
          )),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textEditingController.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  filled: true,
                  enabledBorder: InputBorder.none,
                  hintText: "Tên danh mục",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        width: 0.5,
                      ))),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_chungKhoanAppProvider.findDanhMuc(
                          'name', _textEditingController.text) ||
                      _textEditingController.text.isEmpty) {
                    showAlert(QuickAlertType.error, 'Thông báo',
                        'Tên danh mục đã tồn tại');
                  } else {
                    print(_textEditingController.text);
                    print(_chungKhoanAppProvider.getDanhmucs);
                    _chungKhoanAppProvider.addDanhMuc({
                      'id': danhmucs.length.toString(),
                      'name': _textEditingController.text.toString(),
                      'cophieu': _chungKhoanAppProvider.coPhieuSelected,
                    });

                    if (_chungKhoanAppProvider.findDanhMuc(
                        'name', _textEditingController.text)) {
                      _textEditingController.clear();

                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DanhMucDisplayItem()));

                      showAlert(QuickAlertType.success, "Chúc Mừng",
                          "Thêm danh mục thành công!");
                    } else {
                      showAlert(QuickAlertType.error, 'Thông báo',
                          'Them khong thanh cong');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(40, 60, 145, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: const Text(
                  "Xác Nhận",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            const SizedBox(
              height: 8,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: "Bạn đang tìm kiếm gì",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                        },
                        icon: const Icon(Icons.clear)),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    prefixIcon: const Icon(Icons.filter_vintage),
                    enabledBorder: InputBorder.none)),
            const Divider(
              thickness: 0.2,
              height: 20,
              color: Colors.black,
            ),
            // list view
            listViewWidget(context),
            // Expanded(child: ListView.builder(
            //   itemCount: coPhieus.length,
            //   itemBuilder:(context, index){
            //     final themcp = coPhieus[index];
            //     return ThemDanhMucList(
            //         tenCongty: themcp['name'] as String,
            //         tencp: themcp['type'] as String ,
            //         tenSan: themcp['san'] as String,
            //         isSave: themcp['isSaved'] as int,

            //     ) ;
            //   }))
          ],
        ),
      ),
    );
  }

  Widget listViewWidget(BuildContext context) {
    return Selector<ChungKhoanAppProvider, List>(
        builder: (context, notSavedList, child) {
          return Expanded(
              child: ListView.builder(
                  itemCount: notSavedList.length,
                  
                  itemBuilder: (context, index) {
                    print(notSavedList.length);
                    final themcp = notSavedList[index];
                    return ThemDanhMucList(
                      id: themcp['id'] as String,
                      tenCongty: themcp['name'] as String,
                      tencp: themcp['type'] as String,
                      tenSan: themcp['san'] as String,
                      isSave: themcp['isSaved'] as int, 
                      gia: themcp['gia'] ,
                      tanggiam: themcp['tanggiam'],
                      tangphantr: themcp['tang'],
                      khoiluongGD: themcp['khoiluongGD'],
                    );
                  }));
        },
        shouldRebuild: (p, n) => true,
        selector: (_, p1) => p1.getCoPhieusNotSaved);
  }
}
