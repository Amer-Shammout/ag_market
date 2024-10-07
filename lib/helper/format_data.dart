String formatData(String data){
  String formattedName = "${data.substring(0, 1).toUpperCase()}${data.substring(1)}";
  return formattedName;
}