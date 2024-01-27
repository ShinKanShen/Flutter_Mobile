import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';




class ChungKhoanAppProvider extends ChangeNotifier{

  List chungKhoanIsSaved = [];
  List chungKhoanNotSave =[];

  
  List get getCoPhieusSaved => chungKhoanIsSaved;
  List get getCoPhieusNotSaved => chungKhoanNotSave;

  final List _danhMucData = danhmucs;
  List get getDanhmucs => _danhMucData;

  List coPhieuSelected =[];

 String _danhmucText ='';
 bool isAddNew = false; String get danhmucText=> _danhmucText;
void setDanhMucText(String text){
 
     _danhmucText = text;
     notifyListeners();
  
 
  
}

 int checkItemSelected=0;

 int  checkSelectedItem (int selectedCode){
    if(selectedCode ==0) {
      checkItemSelected =1;
      print(checkItemSelected);
      notifyListeners();
      return 1;}
    else{
      checkItemSelected =0;
       print(checkItemSelected);
       notifyListeners();
      return 0;
    }
    
  }

  void getSavedCoPhieus(){
    chungKhoanIsSaved.addAll(
      (coPhieus.where((element) => element['isSaved']==1)).toList()
    );
    notifyListeners();
  }

  void getNotSaveCoPhieus(){
    chungKhoanNotSave.addAll(
      (coPhieus.where((element) => element['isSaved']==0)).toList()
    );
    notifyListeners();
  }

  bool findDanhMuc(String key, var data){

    if((_danhMucData.where((element) => element[key]==data)).isNotEmpty){
     
      return true;
    }
     notifyListeners();
    return false;
  }

  void addDanhMuc(Map<String, Object> danhmuc){
    _danhMucData.add(danhmuc);
    setDanhMucText(danhmuc['name'] as String);
    notifyListeners();
  } 

  void addDanhmucItem(Map<String, dynamic> item){
    coPhieuSelected.add(item);
    
    notifyListeners();
  }
   Map getDanhmucItems (String tendanhmuc){

    Map data = _danhMucData.firstWhere((element) => element['name']==tendanhmuc);
    if(data.isNotEmpty){
      print('data');
      print(data);
      return data;
      
    }
    return {};
    

  }

}