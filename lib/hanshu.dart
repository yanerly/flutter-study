var _list = [1,2,3,4];

void main(List<String> args){
  print(args); //输出：[]
  //print('${isNoble(3)}');

  // funAsArgs();

  //funToVariable();

  // anonymousFun();

  //grammerScope();

  lexicalClosure();

  //funEqual();

  //funReturn();

  defaultArgs();
}

// 完整写法
/*bool isNoble(int number){
  var _list = [1,2,3,4];

  return _list[number] == 4;
}*/

// 可以省略类型进行简写（省略返回值类型和参数类型）
/*isNoble(number) {
  return _list[number] == 4;
}*/

// 如果只包含一个表达式，可以简写为
bool isNoble(int number) =>_list[number] == 3;

// 函数作为参数
void printElement(int element) {
  print(element);
}

void funAsArgs(){
  var list = [1, 2, 3];

// 将函数作为变量传入
  list.forEach(printElement);
}

// 为变量分配一个函数
void funToVariable(){
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

// 匿名函数
void anonymousFun(){
  var list = ['apples', 'bananas', 'oranges'];
  /*list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });*/

  // 等效于
  list.forEach(
      (item) => print('${list.indexOf(item)}: $item')
  );
}

// 语法作用域
bool topLevel = true;
void grammerScope(){
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

// 词法闭包
Function uid() {
  int id = 0;
  return () => id++;
}

void lexicalClosure() {
  var uidGenerator = uid();
  print(uidGenerator());
  print(uidGenerator());
  print(uidGenerator());
  /**输出
   *  0
      1
      2
   */
}

// 测试函数相等
class A{
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void foo() {} // A top-level function

void funEqual(){
  var x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;


  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
}

// 函数返回值
void funReturn() {
  foo(){}

  assert(foo() == null);
}

// 测试编译时常量
void funConstant(){
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = const [1, 2, 3];

  // 以下字符串是合法的，因为它所引用的也都是编译时常量
  const validConstString = '$aConstNum $aConstBool $aConstString';
// 但是下面这个就是非法的，因为所引用的都不是编译时常量（四个变量全报红）
  //const invalidConstString = '$aNum $aBool $aString $aConstList';
}

// 默认参数
void defaultArgs({ String from = 'Lili', String msg = 'Hello' }){
  print('$from says $msg');// 输出：Lili says Hello
}

