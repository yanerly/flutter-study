void main() {
  pointClass();
}

class Point {
  num x;
  num y;

  Point(x,y){
    this.x = x;
    this.y = y;
  }

}



void pointClass(){
  // 导包 ：import 'dart:math';
  // 构造函数
  var p = Point(2,2);
  //var p1 = Point.fromJson();

  // 这里会提示p.y只能设置一次值，因为是final类型
  // 为避免最左操作数为空时出现异常，使用 ?.代替 .来使用
  //p.y = 4;--->p?.y = 4

  // 获取y的值
  assert(p.y == 2);

  // 这里用num和var是一样的
  //num distance = p.distanceTo(Point(3,4));
  print('distance = $distance');
}

