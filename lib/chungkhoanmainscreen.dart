import 'package:app_chungkhoan_thuctap/chondanhmuc/chondanhmuc.dart';
import 'package:app_chungkhoan_thuctap/listchungkhoanmain.dart';
import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:app_chungkhoan_thuctap/suaxoadanhmuc/suaxoadanhmuc.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmucscreen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ChungKhoanScreen extends StatefulWidget {

 
  const ChungKhoanScreen({ super.key});


  @override
  _chungkhoanScreenState createState() => _chungkhoanScreenState();

 }

class _chungkhoanScreenState extends State<ChungKhoanScreen>  {

   List cophieusort= [];
   bool? buttonAZ =false;
   bool? buttonGia =false;
   bool? buttonKhoiLuong = false;

  
  
  @override
  void initState() {
    
    cophieusort .addAll(coPhieus.toList());
    super.initState();
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bảng giá',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.star_border_purple500_outlined,
                size: 24,
              )),
          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.menu,
              size: 24,
            ),
            // GestureDetector(
            //   // tap to menu
            //   onTap: () {
            //     print("Menu tapped");
            //   },
            //   // custom for icon
            //   child: const Padding(
            //     padding:  EdgeInsets.only(right: 8),
            //     child:  Icon(Icons.menu,size:24,),
            //   ),
            // )
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 16,
          top: 4,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    IconButton.outlined(
                      onPressed: () {
                        final action = CupertinoActionSheet(
                          actions: <Widget>[
                            Container(
                              color: const Color.fromRGBO(228, 228, 228, 1),
                              child: CupertinoActionSheetAction(
                                  onPressed: () {},
                                  isDefaultAction: true,
                                  child: const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Thao tac",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.4)),
                                    ),
                                  )),
                            ),
                            Container(
                                color: Colors.white,
                                child: CupertinoActionSheetAction(
                                  onPressed: () {

                                    // den trang them danh muc
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ThemDanhMuc()));
                                    
                                    
                                  },
                                  
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      "Them Danh Muc Moi",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                                color: Colors.white,
                                child: CupertinoActionSheetAction(
                                  onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuaDanhMuc()));
                                    
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      "Chinh Sua Danh Muc",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                                color: Colors.white,
                                child: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuaDanhMuc()));

                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      "Xoa Danh Muc",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(209, 51, 56, 1),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                          cancelButton: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Dong",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                          ),
                        );
                        showCupertinoModalPopup(
                            context: context, builder: (context) => action);
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                      iconSize: 24,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(32),
                          side: const BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),

                    // chon danh muc
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            // an navigation
                            useRootNavigator: true,
                            backgroundColor:
                               const  Color.fromARGB(255, 255, 255, 255),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            )),
                            builder: (context) => builderSheet());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 6, top: 12, bottom: 12, right: 5),
                        fixedSize: const Size.fromHeight(32),
                        backgroundColor: const Color.fromRGBO(40, 60, 145, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Danh Muc Yeu Thich",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                // dong 2 co the scroll
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      child: const Text(
                        "VN30",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      child: const Text(
                        "HNX",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      child: const Text(
                        "HNX",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                    ),
                  ],
                ))
              ]),
            ),

            // duong ke
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              thickness: 1,
              height: 16,
            ),

            // nut chuc nang ben duoi duong ke
            Container(
              margin: const EdgeInsets.only(top: 4, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // nut A-z
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cophieusort = sapxepfunction('name', coPhieus);
                        buttonAZ = true;  
                        buttonGia = false;
                        buttonKhoiLuong = false;                 
                      });
                      
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 6, top: 12, bottom: 12, right: 5),
                      fixedSize: const Size.fromHeight(32),
                      backgroundColor: buttonAZ!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child:  Text(
                      "A-Z",
                      style: TextStyle(color: buttonAZ!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // Button Gia
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cophieusort = sapxepfunction('gia', coPhieus);
                        buttonGia = true;
                        buttonAZ = false;
                        buttonKhoiLuong = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 6, top: 12, bottom: 12, right: 5),
                      fixedSize: const Size.fromHeight(32),
                      backgroundColor:  buttonGia!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gia",
                          style: TextStyle(
                            color: buttonGia!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                            fontSize: 14,
                          ),
                        ),
                         Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 20,
                          color: buttonGia!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // Button Khoi Luong
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cophieusort = sapxepfunction('khoiluong', coPhieus);
                        buttonKhoiLuong = true;
                        buttonAZ = false;
                        buttonGia = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          left: 6, top: 12, bottom: 12, right: 5),
                      fixedSize: const Size.fromHeight(32),
                      backgroundColor:  buttonKhoiLuong!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Khoi Luong",
                          style: TextStyle(
                            color: buttonKhoiLuong!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 20,
                          color: buttonKhoiLuong!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // phan hien thi gia chung khoan
            
            listview(cophieusort),
            
            //  const Expanded(
            //     child:  BotttomMenu())
          ],
        ),
      ),
    );
  }

}
// chon danh muc
Widget builderSheet() => const ChonDanhMuc();

// sap xep
List<Map<String, dynamic>>  sapxepfunction(String chucnang, List<Map<String, dynamic>>? cophieu){
  
  List<Map<String, dynamic>> cophieusort =[]; 
  
  
  
  switch(chucnang){
    case 'name': cophieu!.sort((a,b)=> (a['name']).compareTo(b['name']));
    case 'gia': cophieu!.sort((a,b)=> (a['gia']).compareTo(b['gia']));
    case 'khoiluong': cophieu!.sort((a,b)=> (a['khoiluongGD']).compareTo(b['khoiluongGD']));
    default :  break;


  }
  cophieusort.addAll(cophieu!.toList());

  
  return cophieusort ;

}

// widget listView 

Widget listview (List? cophieu){

  return Expanded(
              child: ListView.builder(
                  itemCount: cophieu!.length,
                  
                  itemBuilder: (context, index) {
                    final chungkhoan = cophieu[index];
                    return  LayOutChungKhoan(
                        tencongty: chungkhoan['name'] as String,
                        tencophieu: chungkhoan['type'] as String,
                        san: chungkhoan['san'] as String,
                        tanggiam: chungkhoan['tanggiam'] as double,
                        khoiluongGD: chungkhoan['khoiluongGD'] as double,
                        tangphantr: chungkhoan['tang'] as double,
                        gia: chungkhoan['gia'] as double,

                    );
                  }),
            );


}







