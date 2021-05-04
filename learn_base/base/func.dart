// void show(dynamic a) {
//   if (a is int) {
//     print('a');
//   } else if (a is String) {
//     print('b');
//   } else if (a is double) {
//     print('c');
//   } else {
//     throw TypeError();
//   }
// }

// void main() {
//   show(12.6);
// }

// // 可选位置参数，
// void show(int a, [int b, int c]) {
//   print(a + b + c);
// }

// void main() {
//   // show(12, 23);
//   // show(12, 23, 432);
//   // 不赋值则为null
// }

void show(int a, {String name = 'no name', int age}) {
  print(a);
  print(name);
  print(age);
}

void main() {
  show(12, age: 12);
}
