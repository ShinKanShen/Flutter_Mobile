import 'package:app_chungkhoan_thuctap/data/cophieu.dart';
import 'package:flutter/material.dart';

class IndexCodeConst {
  static const String vn30 = "VN30";
  static const String hsx = "HSX";
  static const String hnx = "HNX";
  static const String hnx30 = "HNX30";
  static const String upcom = "UPCOM";
}

enum LoadState {
  loading,
  init,
  loaded,
  error,
}

class SortCodeConst {
  static const String az='A-Z';
  static const String gia='Gia';
  static const String khoiluong ='Khoi Luong';
}
// class SortListConst{
//   static const bool sortAz= false;
//   static const bool sortGia= false;
//   static const bool sortKhoi= false;
// }

class ChungKhoanChangeNotifier with ChangeNotifier {
  String _currentIndex = IndexCodeConst.vn30;
  String get currentIndexCode => _currentIndex;

  String _currentSort = SortCodeConst.az;
  String get currentSortIndexCode =>_currentSort;

 

  LoadState _loadState = LoadState.init;
  LoadState get loadState => _loadState;


final List _cophieus = coPhieus;
List get loadCoPhieus => _cophieus;

  // bool _loadDefaultList = SortListConst.sortAz;
  // bool get loadDefaultList => !_loadDefaultList;

  
  
  

  void changeIndex(String indexCode){
    if (_currentIndex!= indexCode)
    {
      _currentIndex = indexCode;
      notifyListeners();
      loadSymbol();
    }
  }


  void sortFunction(String sortFucntionCode){
    if(_currentSort!=sortFucntionCode){
      _currentSort=sortFucntionCode;
      notifyListeners();
    }
  }


  // void sortByName(){
  //   _cophieus.sort((a,b)=> (a['name']).compareTo(b['name']));
  //     notifyListeners();
  // }

  // void sortByGia(){
  //   _cophieus.sort((a,b)=> (a['gia']).compareTo(b['gia']));
  //   notifyListeners();
  // }
  void isListSort(String currentSortCode){
    switch(currentSortCode){
      case SortCodeConst.az: 
      
    }
  }


 void loadSortedList(String curentSortCode , bool currentSortCode){
  switch(currentSortIndexCode){
    case SortCodeConst.az: 
      _cophieus.sort((a,b)=> (a['name']).compareTo(b['name']));
      //_loadDefaultList =!currentSortCode;
      notifyListeners();
      
      break;
    case SortCodeConst.gia: 
    _cophieus.sort((a,b)=> (a['gia']).compareTo(b['gia']));
   // _loadDefaultList =!currentSortCode;
    notifyListeners();
    
      break;
    case SortCodeConst.khoiluong: 
    _cophieus.sort((a,b)=> (a['khoiluongGD']).compareTo(b['khoiluongGD']));
    //_loadDefaultList =!currentSortCode;
    notifyListeners();
    
      break;

    default : break;
  }
  

 }

  void loadSymbol(){
    switch (currentIndexCode) {
      case IndexCodeConst.hnx:
        
        break;
        case IndexCodeConst.hnx30:
        
        break;
        case IndexCodeConst.hsx:
        
        break;
        case IndexCodeConst.upcom:
        
        break;
        case IndexCodeConst.vn30:
        break;
      default:
    }  
  }
}

