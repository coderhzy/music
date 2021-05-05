
class Interface {
  void show() {}
  void hide() {}
}

class A implements Interface {
  @override
  void hide() {
    // TODO: implement hide
  }

  @override
  void show() {
    // TODO: implement show
  }
}

void main() {
  // 子
  Interface a;
  a = A(); // 因为是静态类型
}
