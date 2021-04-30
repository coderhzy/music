class Base {
  int a;

  Base(this.a);
  void show() {}
}

class Derived extends Base {
  int b;

  // 成熟类写法: 重载共早起
  Derived(int a, this.b) : super(a);

  @override
  void show() {
    super.show(); // 在重载的子类方法汇总，直接调用父类方法
  }
}

void main() {
  var a = Derived(1, 2);
}
