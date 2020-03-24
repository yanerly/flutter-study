//Dart 运算符
void main() {
  funDivision();

  //funNotFullEqual();

  //funNotEqual();

  funIncDec();
}

// 除取整运算符~/
funDivision(){
  assert(10 ~/2 == 5); //true
}

// 没有全等运算符
class A{
  bool operator ==(dynamic y){
    return y == 1;
  }
}

funNotFullEqual(){
  var a = new A();
  print(a == 1); //true
  print(a == 2); //false
}

// ??=运算符
funNotEqual(){
  var x = null;
  x ??= 10;
  print(x); // 输出10

  var y = 25;
  y ??= 20;
  print(y); // 输出25
}

//前缀和后缀递增和递减运算符
funIncDec(){
  var a, b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  print('a=$a,b=$b');
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a AFTER b gets its value.
  print('a=$a,b=$b');
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  print('a=$a,b=$b');
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a AFTER b gets its value.
  print('a=$a,b=$b');
  assert(a != b); // -1 != 0
}
