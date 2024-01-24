import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:flutter/cupertino.dart';

class ChungKhoanAppProvider extends ChangeNotifier{

  List chungKhoanIsSaved = [];
  List chungKhoanNotSave =[];

  List get getCoPhieusSaved => chungKhoanIsSaved;
  List get getCoPhieusNotSaved => chungKhoanNotSave;
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

}