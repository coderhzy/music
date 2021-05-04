class Person {
  // var _a = 12;

  String name;
  int age;

  // constructor
  // 写法一
  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }
  // 写法二
  // Person(this.name, this.age) {}
  // 写法三：经常使用
  Person({this.name = 'xxx', this.age = 0});

  void show() {
    print('姓名:${name},年龄:${age}');
  }
}

void main() {
  // var p = Person();
  // p._a++;
  // print(p._a);

  // 对应方法三：常用
  var p = Person(name: 'blue', age: 18);
  var p2 = Person(
    name: '张三',
  );

  p.show();
  p2.show();
}
