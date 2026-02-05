import 'model.dart';
import 'choosefile.dart';

String selectedTile = "";
int selectedIndex ;
bool selected = true;
int epoints = 0;
int npoints = 0;
int hpoints = 0;

List<TileModel> myPairs = new List<TileModel>();
List<bool> clicked = new List<bool>();

List<bool> getClicked(){

  List<bool> yoClicked = new List<bool>();
  List<TileModel> myairs = new List<TileModel>();
  myairs = getPairs_Hard();
  for(int i=0;i<myairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getPairs_Easy(){
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();
  List<String> ep = File.file_easy();
  for(var i = 0; i < 6;i++) {
    tileModel.setImageAssetPath(ep[i]);
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }
  return pairs;
}

List<TileModel>  getPairs_Normal(){
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();
  List<String> np = File.file_normal();
  for(var i = 0; i < 8;i++) {
    tileModel.setImageAssetPath(np[i]);
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }
  return pairs;
}

List<TileModel>  getPairs_Hard(){
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();
  List<String> hp = File.file_hard();
  for(var i = 0; i < 8;i++) {
    tileModel.setImageAssetPath(hp[i]);
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }
  return pairs;
}


List<TileModel>  getQuestionPairs_12(){
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();
  for(var i = 0; i < 6;i++) {
    tileModel.setImageAssetPath("assets/question.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }
  return pairs;
}

List<TileModel>  getQuestionPairs_16(){
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();
  for(var i = 0; i < 8;i++) {
    tileModel.setImageAssetPath("assets/question.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }
  return pairs;
}
