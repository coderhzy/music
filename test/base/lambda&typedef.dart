// 我们在订阅或者通知的时候，会将一个函数以参数的方式传递给另一个函数
typedef callback2num = void Function(int, int);

void setTitle(String title, callback2num callback) {}

void main() {
  // 箭头函数则为lambda
  // var a = [1, 2, 3];
  // var b = a.map((e) => e * 2).toList();
  // print(a);
  // print(b);

  setTitle('hello', (int a, int b) {});
}
