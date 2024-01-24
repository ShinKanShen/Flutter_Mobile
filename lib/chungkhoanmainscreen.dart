import 'package:app_chungkhoan_thuctap/chondanhmuc/chondanhmuc.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:app_chungkhoan_thuctap/models/chung_khoan_change_notifer.dart';
import 'package:app_chungkhoan_thuctap/listchungkhoanmain.dart';
import 'package:app_chungkhoan_thuctap/data/cophieu.dart';

import 'package:app_chungkhoan_thuctap/suaxoadanhmuc/suaxoadanhmuc.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmucscreen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChungKhoanScreen extends StatefulWidget {
  // static Widget create() {
  //   return ChangeNotifierProvider(
  //     create: (context) => ChungKhoanChangeNotifier(),
  //     child: const ChungKhoanScreen(),
  //   );
  // }

  const ChungKhoanScreen({super.key});

  @override
  _chungkhoanScreenState createState() => _chungkhoanScreenState();
}

class _chungkhoanScreenState extends State<ChungKhoanScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List cophieusort = [];
  // bool? buttonAZ = false;
  // bool? buttonGia = false;
  // bool? buttonKhoiLuong = false;

 
  late ChungKhoanChangeNotifier manager;

  late ChungKhoanChangeNotifier sortItemProvider; 
  late ChungKhoanAppProvider appManager ;

  @override
  void initState() {

    appManager = Provider.of<ChungKhoanAppProvider>(context, listen: false);
    sortItemProvider = Provider.of<ChungKhoanChangeNotifier>(context, listen: false);
    manager = context.read<ChungKhoanChangeNotifier>();
    //coPhieus.sort((a,b)=> (a['name'] as Comparable).compareTo(b['name'] as Comparable));
    manager.loadSortedList(SortCodeConst.az);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },

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
      endDrawer: Enddrawer(),
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
                                      "Thao tác",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.4)),
                                    ),
                                  )),
                            ),
                            Container(
                                height: 56,
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
                                  child: const Text(
                                    "Thêm danh muc mới",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                            Container(
                                height: 56,
                                color: Colors.white,
                                child: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuaDanhMuc()));
                                  },
                                  child: const Text(
                                    "Chỉnh sửa danh mục",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                            Container(
                                height: 56,
                                color: Colors.white,
                                child: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuaDanhMuc()));
                                  },
                                  child: const Text(
                                    "Xóa danh mục",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(209, 51, 56, 1),
                                    ),
                                  ),
                                ))
                          ],
                          cancelButton: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Đóng",
                                style: TextStyle(
                                  fontSize: 16,
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
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            )),
                            builder: (context) => builderSheet());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 12, top: 12, bottom: 12, right: 8),
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
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
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
                    buildIndexButton(context, IndexCodeConst.vn30),
                    const SizedBox(
                      width: 8,
                    ),
                    buildIndexButton(context, IndexCodeConst.hnx),
                    const SizedBox(
                      width: 8,
                    ),
                    buildIndexButton(context, IndexCodeConst.hsx),
                    const SizedBox(
                      width: 8,
                    ),
                    buildIndexButton(context, IndexCodeConst.hnx30),
                    const SizedBox(
                      width: 8,
                    ),
                    buildIndexButton(context, IndexCodeConst.upcom),
                    const SizedBox(
                      width: 8,
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(
                    //       side: const BorderSide(
                    //         color: Color.fromRGBO(230, 230, 230, 1),
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4))),
                    //   child: const Text(
                    //     "VN30",
                    //     style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    // TextButton(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(
                    //       side: const BorderSide(
                    //         color: Color.fromRGBO(230, 230, 230, 1),
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4))),
                    //   child: const Text(
                    //     "HNX",
                    //     style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    // TextButton(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(
                    //       side: const BorderSide(
                    //         color: Color.fromRGBO(230, 230, 230, 1),
                    //         width: 1,
                    //         style: BorderStyle.solid,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4))),
                    //   child: const Text(
                    //     "HNX",
                    //     style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    //   ),
                    // ),
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
                  buildSortButton(context, SortCodeConst.az),
                  const SizedBox(
                    width: 8,
                  ),
                  buildSortButton(context, SortCodeConst.gia),
                  const SizedBox(
                    width: 8,
                  ),
                  buildSortButton(context, SortCodeConst.khoiluong),
                  const SizedBox(
                    width: 8,
                  ),

                  // nut A-z
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       cophieusort = sapxepfunction('name', coPhieus);
                  //       buttonAZ = true;
                  //       buttonGia = false;
                  //       buttonKhoiLuong = false;
                  //     });

                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.only(
                  //         left: 6, top: 12, bottom: 12, right: 5),
                  //     fixedSize: const Size.fromHeight(32),
                  //     backgroundColor: buttonAZ!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //   ),
                  //   child:  Text(
                  //     "A-Z",
                  //     style: TextStyle(color: buttonAZ!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4)),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // // Button Gia
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       cophieusort = sapxepfunction('gia', coPhieus);
                  //       buttonGia = true;
                  //       buttonAZ = false;
                  //       buttonKhoiLuong = false;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.only(
                  //         left: 6, top: 12, bottom: 12, right: 5),
                  //     fixedSize: const Size.fromHeight(32),
                  //     backgroundColor:  buttonGia!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //   ),
                  //   child:  Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Gia",
                  //         style: TextStyle(
                  //           color: buttonGia!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //        Icon(
                  //         Icons.arrow_drop_down_sharp,
                  //         size: 20,
                  //         color: buttonGia!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // // Button Khoi Luong
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       cophieusort = sapxepfunction('khoiluong', coPhieus);
                  //       buttonKhoiLuong = true;
                  //       buttonAZ = false;
                  //       buttonGia = false;
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: const EdgeInsets.only(
                  //         left: 6, top: 12, bottom: 12, right: 5),
                  //     fixedSize: const Size.fromHeight(32),
                  //     backgroundColor:  buttonKhoiLuong!? const Color.fromRGBO(40, 60, 145, 1): Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //   ),
                  //   child:  Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Khoi Luong",
                  //         style: TextStyle(
                  //           color: buttonKhoiLuong!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_drop_down_sharp,
                  //         size: 20,
                  //         color: buttonKhoiLuong!?Colors.white :const  Color.fromRGBO(0, 0, 0, 0.4),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            // phan hien thi gia chung khoan

            listviewWidget(context)

            //  const Expanded(
            //     child:  BotttomMenu())
          ],
        ),
      ),
    );
  }

  Widget buildIndexButton(BuildContext context, String indexCode) {
    return Selector<ChungKhoanChangeNotifier, String>(
      selector: (p0, p1) => p1.currentIndexCode,
      builder: (context, currentIndexCode, child) {
        return TextButton(
          onPressed: () {
            manager.changeIndex(indexCode);           
            manager.sortCoPhieus(indexCode);                        
          },
          style: TextButton.styleFrom(
              side: BorderSide(
                color: indexCode == currentIndexCode
                    ? Colors.red
                    : Color.fromRGBO(230, 230, 230, 1),
                width: 1,
                style: BorderStyle.solid,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          child: Text(
            indexCode,
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
          ),
        );
      },
    );
  }

  Widget buildSortButton(BuildContext context, String sortCode) {
    return Selector<ChungKhoanChangeNotifier, String>(
      selector: (p0, p1) => p1.currentSortIndexCode,
      builder: (context, currentSortIndexCode, child) {
        return ElevatedButton(
          onPressed: () {
            manager.sortFunction(sortCode);
            
            manager.loadSortedList(sortCode);
            
          },
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 6, top: 12, bottom: 12, right: 5),
            fixedSize: const Size.fromHeight(32),
            backgroundColor: sortCode == currentSortIndexCode
                ? const Color.fromRGBO(40, 60, 145, 1)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sortCode,
                style: TextStyle(
                  color: sortCode == currentSortIndexCode
                      ? Colors.white
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 20,
                color: sortCode == currentSortIndexCode
                    ? Colors.white
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ],
          ),
        );
      },
    );
  }
}

// chon danh muc
Widget builderSheet() => const ChonDanhMuc();

// sap xep
// List<Map<String, dynamic>>  sapxepfunction(String chucnang, List<Map<String, dynamic>>? cophieu){

//   List<Map<String, dynamic>> cophieusort =[];

//   switch(chucnang){
//     case 'name': cophieu!.sort((a,b)=> (a['name']).compareTo(b['name']));
//     case 'gia': cophieu!.sort((a,b)=> (a['gia']).compareTo(b['gia']));
//     case 'khoiluong': cophieu!.sort((a,b)=> (a['khoiluongGD']).compareTo(b['khoiluongGD']));
//     case 'isSaved': cophieu!.sort((a,b)=> (a['isSaved']).compareTo(b['isSaved']));
//     default :  break;

//   }
//   cophieusort.addAll(cophieu!.toList());

//   return cophieusort ;

// }

// widget listView


Widget listviewWidget(BuildContext context) {
  return Selector<ChungKhoanChangeNotifier, List>(
    selector: (p0, p1) => p1.getIndexItem,
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



Widget Enddrawer() {
  return Drawer(
      backgroundColor: const Color.fromARGB(255, 158, 244, 235),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("SharKo Sharko"),
            accountEmail: const Text("SharokoSharko@gmail.com"),
            currentAccountPicture: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(80),
                image: const DecorationImage(
                  image: AssetImage('assets/icons/moon_cloud.png'),
                  fit: BoxFit.cover,
                  scale: 0.2,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                const Text(
                  "Giao dich xa hoi",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                const Text(
                  "Giao dich xa hoi",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                const Text(
                  "Giao dich xa hoi",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Danh gia ung dung",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Chat truc tuyen",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "De xuat mot tinh nang",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Giay to phap ly",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => null,
                  leading: const Icon(
                    Icons.add_chart_rounded,
                    color: Colors.black54,
                    size: 24,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  subtitle: const Text(
                    "Tang thu nhap bang cach chia se chien luoc cua ban",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
