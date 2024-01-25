

import 'package:app_chungkhoan_thuctap/models/chung_khoan_app_global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemDanhMucList extends StatefulWidget {
  final String id;
  final String tencp;
  final String tenCongty;
  final String tenSan;
  final double gia;
  final double khoiluongGD;
  final double tanggiam;
  final double tangphantr;
   int isSave;

   ThemDanhMucList({
    required this.id,
    required this.tenCongty,
    required this.tencp,
    required this.tenSan,
    required this.isSave,
    super.key, required this.gia, required this.khoiluongGD, required this.tanggiam, required this.tangphantr});

  @override
  State<ThemDanhMucList> createState() => _ThemDanhMucListState();
}

class _ThemDanhMucListState extends State<ThemDanhMucList> {
  @override
  Widget build(BuildContext context) {

    final ChungKhoanAppProvider _chungKhoanAppProvider = context.read<ChungKhoanAppProvider>();
    return  Container(
      margin:const  EdgeInsets.only( left:6, right: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  IntrinsicHeight(
                    child: Row(children: [
                       Text(widget.tencp.toString().toUpperCase(), 
                       style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                      
                      ),
                      const VerticalDivider(
                        width: 6,
                        thickness: 0.5,
                        indent: 6,
                        endIndent: 6,
                      ),
                      Text(widget.tenSan.toUpperCase(),
                       style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),)
                    ],),
                  ),
          
                  Text(widget.tenCongty, 
                  style: const  TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),)
          
                ],
                
                ),
          
                 IconButton(
                    onPressed: (){
                      setState(() {
                        
                      });
                      widget.isSave ==0? widget.isSave=1:widget.isSave =0;
                      if(widget.isSave ==1){
                        _chungKhoanAppProvider.coPhieuSelected.add({
                          'id': widget.id,
                           
                            'name':widget.tenCongty,
                            'type':widget.tencp,
                            'san':widget.tenSan,
                            'gia': widget.gia,
                            'tanggiam': widget.tanggiam,
                            'khoiluongGD':widget.khoiluongGD,
                            'tang': widget.tangphantr,
                            
                        });
                  
                      }else if(widget.isSave == 0){
                        _chungKhoanAppProvider.coPhieuSelected.removeWhere((element) => element['type']==widget.tencp);
                      }
                      print(_chungKhoanAppProvider.coPhieuSelected);
                      print(widget.id);
                      print(widget.isSave);
                    }, 
                    style: ElevatedButton.styleFrom(
                      
                    ),
                  
                  
                  icon: Icon(Icons.star,
                  color:  (widget.isSave<=0)? Colors.grey: const Color.fromARGB(255, 225, 182, 30),
                   
                    
                  )
                 
              

                  
                )
                ]
              ),
              
              const Divider(
                thickness: 0.3,
                height: 16,
              )
        ],
      ),
    );

      
  }
}