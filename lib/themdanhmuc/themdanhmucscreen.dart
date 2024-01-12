import 'package:app_chungkhoan_thuctap/chungkhoanscreen.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmuclist.dart';
import 'package:flutter/material.dart';

class  ThemDanhMuc extends StatefulWidget {
  const ThemDanhMuc ({super.key});

  @override
  _ThemDanhMuc createState() => _ThemDanhMuc();
  
}
class _ThemDanhMuc extends State<ThemDanhMuc>{
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
            child: const Icon(Icons.arrow_back_ios),) 
        ),
        body:  Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children:  [
               TextField(
                decoration: InputDecoration(
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
                onPressed: (){},
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
                const TextField(
                  decoration:  InputDecoration(
                      hintText: "Ban dang tim kiem gi",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.4)
                      ),
                      prefixIcon: Icon(Icons.filter_vintage),
                      enabledBorder: InputBorder.none
                      )
                      
                  ),
                const Divider(
                    thickness: 0.2,
                    height: 20,
                    color: Colors.black,
                  ),
                Expanded(child: ListView.builder(
                  itemCount: 15,
                  itemBuilder:(context, index)=>const  ThemDanhMucList() ))
          
               
                 
                
          
            ],
          ),
        ),
      );
    
    
    
  }
  }