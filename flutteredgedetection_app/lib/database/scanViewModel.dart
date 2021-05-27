import 'database.dart';

class ScanViewModel{

  List<Selectable<Scan>> scans;
  bool selectableModeActive = false;
  ScanViewModel(this.scans);
}

class Selectable<T>{
  bool selected;
  T data;
  Selectable(this.data,{this.selected=false});
}