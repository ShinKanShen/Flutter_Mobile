import 'package:flutter/material.dart';

class Notification extends ChangeNotifier{

  final data = notificationData;


  bool findItemInList(String tacgia, String id){
    if((data.where((element) => element['id']==id && element['tacgia']==tacgia)).isNotEmpty){
      return true;
    }
    return false;

  }

  bool addNewNotigication( String id, String date, String content, String tacgia){
    
     data.add({
       'id': 'no${data.length}',
       'date': date.toString(),
       'content': content,
       'tacgia': tacgia,
       'dadoc': false,
      });
    
    return false;
  }
  

  bool updateItem(String id, String date, String content, String tacgia){



    return false;
  }




}

final notificationData =[
  {
    'id':'no00',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': true,

  },
   {
    'id':'no01',
    'date':'14/12/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': false,

  },
   {
    'id':'no02',
    'date':'10/1/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': true,

  },
   {
    'id':'no03',
    'date':'1/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': false,

  },
   {
    'id':'no04',
    'date':'30/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': false,

  },
   {
    'id':'no05',
    'date':'13/13/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': false,

  },
   {
    'id':'no06',
    'date':'10/15/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': true,

  },
   {
    'id':'no07',
    'date':'10/14/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van a',
    'dadoc': false,

  },
   {
    'id':'no08',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 123',
    'dadoc': true,

  },
   {
    'id':'no09',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 456',
    'dadoc': true,

  },
   {
    'id':'no10',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 10',
    'dadoc': true,

  },
   {
    'id':'no11',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 11',
    'dadoc': false,

  },
   {
    'id':'no12',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 12',
    'dadoc': false,

  },
   {
    'id':'no13',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 13',
    'dadoc': true,

  },
   {
    'id':'no14',
    'date':'10/11/2023',
    'content':'Hom nay la moi ngay mua nen thi truong chung khoan cung do theo',
    'tacgia':'pham van 14',
    'dadoc': true,
  },


];