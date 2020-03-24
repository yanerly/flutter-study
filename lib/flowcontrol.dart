import 'package:flutterapp/hanshu.dart';

void main(){
  funForRound();
}

// 1.For循环
void funForRound(){
  var message = StringBuffer('Dart is fun');
  // 标准for循环
  for(var i = 0;i < 5;i++){
    message.write(' yes!');
  }
  print('message = $message');

  //闭包
  var callback = [];
  for(var i = 0;i<2;i++) {
    //callback.add(() =>print(i));
      callback.add(i);
      print(i);
  }
  //callback.forEach((element) => element());
  callback.forEach((element) {
    element();
  });
}