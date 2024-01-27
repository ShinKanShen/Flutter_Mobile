

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
  int index;
   ThemDanhMucList({
    required this.id,
    required this.tenCongty,
    required this.tencp,
    required this.tenSan,
    required this.isSave,
    required this.index,
    super.key, required this.gia, required this.khoiluongGD, required this.tanggiam, required this.tangphantr});

  @override
  State<ThemDanhMucList> createState() => _ThemDanhMucListState();
}

class _ThemDanhMucListState extends State<ThemDanhMucList> {

  @override
  void initState(){
    
    super.initState();
  
    
  }
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
          
               Selector<ChungKhoanAppProvider, int>(
                selector: (_,p1)=> p1.checkItemSelected,
                 builder:(context, data, child){
                  return IconButton(
                        onPressed: (){
                          
                          widget.isSave = _chungKhoanAppProvider.checkSelectedItem(widget.isSave);
                          if(widget.isSave ==1){
                            _chungKhoanAppProvider.coPhieuSelected.add(
                                _chungKhoanAppProvider.getCoPhieusNotSaved[widget.index],
                            );
                      
                          }else if(widget.isSave == 0){
                            _chungKhoanAppProvider.coPhieuSelected.removeWhere((element) => element['type']==widget.tencp);
                          }
                          print('id: ${widget.id}');
                          print('issaved: ${widget.isSave}');
                          print(_chungKhoanAppProvider.coPhieuSelected);
                 
                          
                        }, 
                        style: ElevatedButton.styleFrom(
                          
                        ),                   
                      icon: Icon(Icons.star,
                      color:  (widget.isSave ==1)?const Color.fromARGB(255, 225, 182, 30): Colors.grey ,
                       
                        
                      )
                 
                 );
                 } 
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