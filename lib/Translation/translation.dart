import 'package:get/get.dart';

class LocalString extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'lang':'Choose Language',
      'min':'Ministry',
      'min1':"Ministry Of Education",
      'min2':"Ministry Of Internal Affairs",
      'sort':'Sort By:',
      'doc1':'High School Diploma',
      'doc2' :'Middle School Diploma',
      'doc3':'Individual Civil Registry Record',
      'doc4':'Family Civil Registry Record',
      'Search':'document type',
      'emp':'Employee Name:',
      'name':'Your username',
      'pass':'Password',
      'sign':'Sign in',
      'req':'Requests',
      'cus':'Customer Informations',
      "Yes":"Yes",
      "Cancel":"Cancel",
      'sure':"Are you sure?",
      "out":"Log out"
    },
    'ar_lb':{
      "lang":"اختر اللغة",
      'min':'الوزارة',
      'min1':"وزارة التربية",
      'min2':"وزارة الداخلية",
      'sort':':تصنيف بحسب',
      'doc1':'شهادة التعليم الثانوي',
      'doc2':'شهادة التعليم الأساسي',
      'doc3':'إخراج قيد فردي',
      'doc4':'إخراج قيد عائلي',
      'Search': 'ابحث بحسب نوع المستند',
      'emp':'اسم العامل',
      'name':'اسم المستخدم',
      'pass':'رمز الامان',
      'sign':'تسجيل الدخول',
      'req':'الطلبات المقدمة',
      'cus':'معلومات مقدم الطلب',
      "Yes":"نعم",
      "Cancel":"إلغاء",
      "sure":"هل تريد تسجيل الخروج؟",
      "out":"تسجيل الخروج"
    }
  };
}