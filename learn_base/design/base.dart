class Person {
  String name;
  int age;

  void showName() {
    var name = '111';

    print(this.name);
  }
}

void main() {
  var p = Person();
  print(p);
  print(p.name);
}
