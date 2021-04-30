// 抽象类
abstract class Shape {
  void draw();

  String toJSON();
  void fromJSON(String json);
}

class Circle extends Shape {
  @override
  void draw() {
    // TODO: implement draw
  }

  @override
  void fromJSON(String json) {
    // TODO: implement fromJSON
  }

  @override
  String toJSON() {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
