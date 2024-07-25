import 'dart:ffi';

extension StringExtintions on String {
  String toCategoryType() {
    switch (this) {
      case "product":
        return "منتج";
        break;
      case "job":
        return "شاغر وظيفي";
        break;
      case "search_job":
        return "باحث عن عمل";
        break;
      case "news":
        return "خبر";
        break;
      case "tender":
        return "مناقصة";
        break;
      case "service":
        return "خدمة";
        break;
      default:
        return this;
    }
  }

  String toFormatNumber(){
    double number=double.tryParse(this)??0;
    if (number >= 1000000) {
      return (number / 1000000).toStringAsFixed(2) + ' مليون';
    } else if (number >= 1000) {
      return (number / 1000).toStringAsFixed(2) + ' ألف';
    } else {
      return this.toString();
    }
  }


}

extension BooleanExtentions on bool {
  String toArabic() {
    if (this) {
      return "مفعل";
    }
    return "غير مفعل";
  }
}
