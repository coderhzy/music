// class Person {
//   String name;
//   int age;

//   Person({this.name = 'xxx', this.age = 0});
//   Person.aaa() {
//     print('a');
//   }

//   Person.bbb() {
//     print('b');
//   }

//   void show() {
//     print('name:${name},age:${age}');
//   }
// }

// void main() {
//   var p = Person();
//   var p1 = Person.aaa();
//   var p2 = Person.bbb();

//   print(p);
//   p.show();

//   print(p1);
//   p1.show();

//   print(p2);
//   p2.show();
// }

class A {
  int _a = 0;

  int get a {
    print('get a');
    return _a;
  }

  set a(int newVal) {
    print('set a');
    _a = newVal;
  }
}

void main() {
  var obj = A();

  obj.a = 1234;

  print(obj.a);
}
