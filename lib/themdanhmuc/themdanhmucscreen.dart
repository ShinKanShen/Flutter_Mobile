

import 'package:app_chungkhoan_thuctap/chungkhoanmainscreen.dart';
import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmuclist.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class  ThemDanhMuc extends StatefulWidget {
  const ThemDanhMuc ({super.key});

  @override
  _ThemDanhMuc createState() => _ThemDanhMuc();
  
}
class _ThemDanhMuc extends State<ThemDanhMuc>{
  final TextEditingController _textEditingController = TextEditingController();
  
  
// show alert 
  void showAlert(QuickAlertType type, String title, String text){
    QuickAlert.show(
      context: context, 
      type: type,
      title: title,
      text: text
      );

  }

  @override
    Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Them Danh Muc Moi", style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 1),
          ),),
          leading: ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context)=> const ChungKhoanScreen())
               
               );
              

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0, 
            ),
            child: const Icon(Icons.arrow_back_ios),
            
            ) 
        ),
        body:  Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children:  [
               TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    _textEditingController.clear();
                  }
                  , icon: const  Icon(Icons.clear)),
                  filled: true,
                  enabledBorder: InputBorder.none,
                  hintText: "Ten danh muc",
                  hintStyle: const  TextStyle(
                    color:   Color.fromRGBO(0, 0, 0, 0.4)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      width: 0.5,
                    )
                  )
          
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: (){

                  if((danhmucs.where((element) => element['name']==_textEditingController.text)).isNotEmpty){
                      showAlert(QuickAlertType.error,'Thong bao', 'Ten danh muc da ton tai');
                      print(danhmucs.where((element) => element['name']==_textEditingController.text));
                  }else{
                      setState(() {
                      danhmucs.add(
                        {
                          'id':danhmucs.length.toString(),
                          'name': _textEditingController.text.toString()
                        }
                      );
                       _textEditingController.clear();
                      
                    });

                    showAlert(QuickAlertType.success, "Chuc Mung ", "Them danh muc thanh cong!");

                  }

                    

                },
                style: ElevatedButton.styleFrom(
                  
                  minimumSize:const  Size.fromHeight(50),
                  backgroundColor:const  Color.fromRGBO(40, 60, 145, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                  )
                ),
                child: const Text("Xac Nhan", style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16
                ),
                
                )),
               const  SizedBox(
                  height: 8,
                ),
                 TextField(
                  decoration:  InputDecoration(
                      hintText: "Ban dang tim kiem gi",
                      suffixIcon: IconButton(onPressed: (){
                    _textEditingController.clear();
                  }
                  , icon: const  Icon(Icons.clear)),
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4)
                      ),
                      prefixIcon:const  Icon(Icons.filter_vintage),
                      enabledBorder: InputBorder.none
                      )
                      
                  ),
                const Divider(
                    thickness: 0.2,
                    height: 20,
                    color: Colors.black,
                  ),
                Expanded(child: ListView.builder(
                  itemCount: coPhieus.length,
                  itemBuilder:(context, index){
                    final themcp = coPhieus[index];
                    return ThemDanhMucList(
                        tenCongty: themcp['name'] as String,
                        tencp: themcp['type'] as String ,
                        tenSan: themcp['san'] as String,

                    ) ;
                  }))
            ],
          ),
        ),
      );
    
    
    
  }
  }


 