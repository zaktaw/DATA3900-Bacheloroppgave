class TttEntry {
  late String activity;
  late int count;

  TttEntry(this.activity, this.count);

  int get getCount {
    return count;
  }

   String toString() {
    return activity + ", " + count.toString();
  }

 
}
