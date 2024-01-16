import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class SuaDanhMuc extends StatefulWidget {
  const SuaDanhMuc({super.key});

  @override
  State<SuaDanhMuc> createState() => _SuaDanhMuc();
}

class _SuaDanhMuc extends State<SuaDanhMuc> {
  late TextEditingController _textEditingController;
  String name = '';
  List<Map<String, String>> target = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  void showAlert(QuickAlertType type, String title, String text) {
    QuickAlert.show(context: context, type: type, title: title, text: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Muc"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: danhmucs.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            final danhmuclist = danhmucs[index];
            return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    if (direction == DismissDirection.startToEnd) {
                      print("xoas");
                      danhmucs.removeWhere(
                          (item) => item['name'] == danhmuclist['name']);
                      if ((danhmucs.where((element) =>
                          element['name'] == danhmuclist['name'])).isEmpty) {
                        showAlert(QuickAlertType.success, "Xoa thanh cong",
                            "Xoa thanh cong danh muc ${danhmuclist['name']}");
                      }
                    } else {
                      print('Sua');
                      target.add(danhmucs.firstWhere(
                          (element) => element['name'] == danhmuclist['name']));
                      print(danhmuclist['name']);
                      print(target);
                    }
                    ;
                  });
                },
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete"),
                            content: const Text(
                                "Ban co chac chan muon xoa danh muc nay"),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text("Yes"),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text("No"))
                            ],
                          );
                        });
                  } else {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Update"),
                            content:
                                const Text("Ban co chac chan muon cap nhat"),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.of(context).pop(true);
                                  final name = await openDialog();
                                  print("gia tri name la: $name");
                                  if (name == null || name.isEmpty) {
                                    showAlert(
                                        QuickAlertType.error,
                                        "Opps! Have some trouble!",
                                        "Vui Long nhap ten danh muc");
                                    return;
                                  } else {
                                    setState(() {
                                      this.name = name;
                                      print(this.name);

                                      if (target.isNotEmpty) {
                                        target[0]['name'] = name.toString();
                                      }
                                      if ((danhmucs.where((element) =>
                                              element['name'] == name))
                                          .isNotEmpty) {
                                        showAlert(
                                            QuickAlertType.success,
                                            "Sua thanh cong",
                                            "Sua thanh cong danh muc $name");
                                      } else {
                                        showAlert(
                                            QuickAlertType.error,
                                            "Sua Khong thanh cong",
                                            "Sua Khong thanh cong danh muc ${danhmuclist['name']} thanh $name");
                                      }
                                    });
                                  }
                                },
                                child: const Text("Yes"),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text("No"))
                            ],
                          );
                        });
                  }
                },

                // xoa
                background: Container(
                  height: 50,
                  color: Colors.red.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Delete",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                // chinh sua
                secondaryBackground: Container(
                  height: 50,
                  color: const Color.fromARGB(255, 123, 220, 151),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Update",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                child: Container(
                  color: const Color.fromARGB(255, 248, 244, 244),
                  margin: const EdgeInsets.only(left: 8, top: 8),
                  height: 50,
                  child: Center(
                    child: Text(
                      danhmuclist['name'] as String,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ));
          }),
    );
  }

  // show dialog cap nhat
  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Cap nhat danh muc"),
            content: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Nhap ten danh muc moi"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(_textEditingController.text);
                    _textEditingController.clear();
                  },
                  child: const Text("Save"))
            ],
          ));
}
