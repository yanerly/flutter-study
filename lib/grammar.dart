
// 程序入口
void main(){
  var number = 22;
  printInteget(number);

  //var name = 'Bob'; //不声明类型
  //String name = 'lili'; //显示声明数据类型
  final name = 'hehe';
  printText(name);

  const bar = 1000000;
  const double atm = 1.01325 * bar;
  printText(atm);

  var foo = const[];
  final sar = const[];

  parseStringIntDouble();

  //printString();

  //printBoolean();

  //printList();

  //printMap();

  printRunes();
}



// 1. 打印一个数字
void printInteget(int number){
  // 当assert(condition) 的condition条件不为真时抛出一个异常
  // assert(number == null);
  print('print num $number');
}

// 2.打印文本
void printText(var str) {
  print('print text : $str');
}

// int 、double、String类型相互转换
void parseStringIntDouble(){
  // int -->String
  var oneToString = 1.toString();
  assert(oneToString == '1');
  print('int -->String转换成功');

  //double --> string
  var piToString = 3.141592653.toStringAsFixed(2);
  assert(piToString == '3.14');
  print('double --> string转换成功');

  //string -->int
  var oneToInt = int.parse('1');
  assert(oneToInt == 1);
  print('string -->int装换成功');

  //string -->double
  var oneToDouble = double.parse('1.1');
  assert(oneToDouble == 1.1);
  print('double --> string转换成功');
}


void printString(){
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  print('$s1,$s2,$s3,$s4');

  var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s5 ==
      'String concatenation works even over '
          'line breaks.');

  var s6 = 'The + operator ' + 'works, as well.';
  assert(s6 == 'The + operator works, as well.');

  // 创建多行字符串的方法:使用带有单引号或双引号的三重引号
  var s7 = '''
  You can create
  multi-line strings like this one.
  ''';
  print('$s7');

  var s8 = """This is also a
  multi-line string.""";
  print('$s8');

  // - 用r前缀创建一个“原始”字符串:
  var sr = r'In a raw string, not even \n gets special treatment.';
  print('$sr'); //In a raw string, not even \n gets special treatment.

  var s = 'In a raw string, not even \n gets special treatment.';
  print('$s');// \n会换号
}

void printBoolean(){
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);
  print('fullname is not empty');
}

void printList(){
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  var constantList = const [1, 2, 3];
  assert(constantList[0] == 1);
}

void printMap() {
  var gifts = {
    // key : value
    'first':'one',
    'second':'two',
    'third':'three'
  };

  gifts['fouth'] = 'four';

  print('$gifts');

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  print('$nobleGases');

  var constuctMap = Map();
  constuctMap['first'] = 'one';
  constuctMap['second'] = 'two';
  constuctMap['third'] = 'three';
  print('$constuctMap');
  // {first: one, second: two, third: three}

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  print('$constantMap');

}

// 字符
void printRunes() {
  // 笑脸表情(😆)的编码\u{1f600},心型字符(♥)的编码为\ u2665
  var clapping = '\u{1f600}';
  print(clapping); // ♥
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
}
