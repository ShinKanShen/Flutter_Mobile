import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:app_chungkhoan_thuctap/data/danhmuc_data.dart';
import 'package:flutter/cupertino.dart';




class ChungKhoanAppProvider extends ChangeNotifier{

  List chungKhoanIsSaved = [];
  List chungKhoanNotSave =[];

  
  List get getCoPhieusSaved => chungKhoanIsSaved;
  List get getCoPhieusNotSaved => chungKhoanNotSave;

  List _danhMucData = danhmucs;
  List get getDanhmucs => _danhMucData;

  List coPhieuSelected =[];

  int _currentStateItem =1;
  int get currentStateItem => _currentStateItem;

  void checkSelectedItem (int selectedCode){
    if(_currentStateItem != selectedCode){
      _currentStateItem = selectedCode;
      notifyListeners();
    }
  }

  void getSavedCoPhieus(){
    chungKhoanIsSaved.addAll(
      (coPhieus.where((element) => element['isSaved']==1)).toList()
    );
  }

  void getNotSaveCoPhieus(){
    chungKhoanNotSave.addAll(
      (coPhieus.where((element) => element['isSaved']==0)).toList()
    );
  }

  bool findDanhMuc(String key, var data){

    if((_danhMucData.where((element) => element[key]==data)).isNotEmpty){
      return true;
    }
    return false;
  }

  void addDanhMuc(Map<String, Object> danhmuc){
    _danhMucData.add(danhmuc);
  } 

  void addDanhmucItem(Map<String, dynamic> item){
    coPhieuSelected.add(item);
  }

}