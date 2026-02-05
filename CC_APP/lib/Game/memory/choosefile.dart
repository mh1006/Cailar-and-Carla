import 'dart:math';

class File {
  static Random random = Random();
  static List<String> file_easy() {
    List<String> efile = new List<String>();
    List<int> check = new List<int>();
    int filechoose;
    for (var b = 0; b < 6; b++) {
      filechoose = random.nextInt(9)+1;
      if(b!=0) {
        for (var i = 0; i < check.length; i++) {
          if (filechoose == check[i]) {
            filechoose = random.nextInt(9) + 1;
            i = -1;
          }
        }
      }
        check.add(filechoose);
        String card = "assets/easy/${filechoose}.png";
        efile.add(card);
    }
    return efile;
  }

  static List<String> file_normal(){
    List<String> nfile = new List<String>();
    List<int> check = new List<int>();
    int filechoose;
    for (var b = 0; b < 8; b++) {
      filechoose = random.nextInt(14)+1;
      if(b!=0) {
        for (var i = 0; i < check.length; i++) {
          if (filechoose == check[i]) {
            filechoose = random.nextInt(14) + 1;
            i = -1;
          }
        }
      }
        check.add(filechoose);
        String card = "assets/normal/${filechoose}.png";
        nfile.add(card);
      }
    return nfile;
  }

  static List<String> file_hard(){
    List<String> hfile = new List<String>();
    int filenum = random.nextInt(7)+1;
    for(var c = 1; c < 9;c++){
      String card = "assets/hard/${filenum}/${c}.png";
      hfile.add(card);
    }
    return hfile;
  }
}