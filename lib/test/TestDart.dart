import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'dart:math' as math;
printNumber(num aNumber) {
  print('The number is $aNumber');
  var s = r"In a raw string, even \n isn't special.";
  print('$s');

//  var clapping = '\u{1f44f}';
//  print(clapping);
//  print(clapping.codeUnits);
//  print(clapping.runes.toList());
//  Runes input = new Runes('\u2665 \u{1f605} \u{1f60e}');
//  print(new String.fromCharCodes(input));
//  var testMap = new Map();
//  testMap["A"] = "AValue";
//  testMap["B"] = "BValue";
//  var keys = testMap.keys;
//  for(int i = 0; i < keys.length; i++) {
//    print("key: " + keys.elementAt(i));
//  }
//  var values = testMap.values;
//  for(int i = 0; i < values.length; i++) {
//    print("value: " + values.elementAt(i));
//  }
//print("map length: " + testMap.length.toString() +" container key: " + testMap.containsKey("A").toString() + " value= " + testMap["A"]);
//  var list = [1,2,3,4,5];
//  for (int i = 0; i < list.length; i++) {
//      print("array value: " + list[i].toString());
//  }
//  String s = """hello,dark""" + ''' ok ''';
//  print('Dart is $s');
//  print('Dart is ${s.toUpperCase()}');
//  String testString = "10";
//  print(int.parse(testString));
//  int testNumber = 1;
//  print('testNumber is ' + testNumber.toString());
//  double testDouble = 3.1415;
//  print("test double is  " + testDouble.toStringAsFixed(2));
}

class TempObject {
  String temp_01 = "temp_01";
  String temp_02;
  num value_01 = 10;
  num value_02 = 20;
  num value_w = 5;
  num value_h = 5;
//  static final Map<String,TempObject> cache = new Map();
//  TempObject.internal(this.temp_01,this.temp_02);
//  factory TempObject(String name) {
//    if (cache.containsKey(name)) {
//      return cache[name];
//    } else {
//      return TempObject.internal("1","2");
//    }
//  }
  static final TempObject _tempObject = TempObject();
  static TempObject getInstance() {
    return _tempObject;
  }
  num get sum01 {
    return value_01 + value_w;
  }
  num get sum02 => value_02 + value_h;

  set sum01(num value) => value_01 = value - value_w;

  call(String a,String b) => "$a $b";
}

class SubObject extends Object with TempObject {

  SubObject(String name) {
    value_01 = 1;
  }
}
enum Color {
  RED,
  GREEN,
  BLUE,
}

TempObject testFunction(bool isTest,List<int> list,Map<String,String> map,[String value = "test",int maxValue = 10]) {
  print("isTest: " + isTest.toString());
  list.forEach( (value) {
    print("value:${value.toString()}");
  });
  map.forEach((key,value) {
    print("key: " +key + " value: " + value);
  });
  print("testvalue: " + value + " testmax: " + maxValue.toString());
  var b;
  b ??= value;
  print("b value $b");
  return new TempObject();
}

matchReg() {
  var numbers = new RegExp(r'\d+');
  var someDigits = 'llamas live fifteen to twenty years';//'llamas live 15 to 20 years'
  for (var value in numbers.allMatches(someDigits)) {
    print(value.group(0));
  }
}

matchCollection() {
  var list = new List<String>();
  list.add("A");
  list.add("B");
  list.add("C");
  list.add("D");
  var tempList = list.map((value) => value.toLowerCase());
  var whereList = tempList.where((value) => value == 'd');
  whereList.forEach((value) => print(value));
  var isAny = tempList.any((value) => value == 'e');
  print("isAny: $isAny");
  var isEvery = tempList.every((value) => value == 'd');
  print("isEvery: $isEvery");
}

testUri() {
  var url = 'http://example.org:8080/foo/bar#frag';
  var encodeFullUri = Uri.encodeFull(url);
  print("encode full uri: $encodeFullUri" + " decode full uri: ${Uri.decodeFull(encodeFullUri)}");
  var encodeComponentUri = Uri.encodeComponent(url);
  print("encode full component: $encodeComponentUri" + " decode full component: ${Uri.decodeComponent(encodeComponentUri)}");
  Uri uri = Uri.parse(url);
  print(" scheme: ${uri.scheme},host: ${uri.host}, path: ${uri.path} , fragment: ${uri.fragment}, origin: ${uri.origin}");
}

testDateTime() {
  var y2k = DateTime.utc(2000);
  print("y2k year: ${y2k.year}  month: ${y2k.month} day: ${y2k.day}");
  var y2001 = y2k.add(new Duration(days: 366));
  print("y2001 year: ${y2001.year}  month: ${y2001.month} day: ${y2001.day}");
  var december2000 = y2001.subtract(Duration(days: 30));
  print("december2000 year: ${december2000.year}  month: ${december2000.month} day: ${december2000.day}");
  var duration = y2k.difference(december2000);
  print("duration diff days: ${duration.inDays}  hours: ${duration.inHours} minutes: ${duration.inMinutes}");
  var dateNow = DateTime.now();
  print("current year: ${dateNow.year}  month: ${dateNow.month} day: ${dateNow.day}");
}

Future<List<int>> addAsyncData() {
  var list = new List<int>();
  list.add(10);
  list.add(20);
  list.add(30);
  const oneSecond = Duration(seconds: 1);
  Future<List<int>> datas() =>
      Future.delayed(oneSecond,() => list);
  return datas();
}

testAsync() {
  addAsyncData().then((values) {
      values.removeLast();
      return values;
  }).then((values) {
    values.forEach((value) {
      print("value: $value");
    });
  });
}

testFile(String path) {
  FileSystemEntity.isDirectory(path)
      .then((isDir) {
        if (isDir) {
          var dir = new Directory(path);
          dir.list().listen((stream) {
            if (stream is File) {
              //todo
            }
          });
        }
  });
}

testFileAsync(String path) async {
  if (await FileSystemEntity.isDirectorySync(path)) {
    var dir = new Directory(path);
    await for (var file in dir.list()) {
        if (file is File) {
          //todo
        }
    }
  }
}

testFileStream(String path) async {
  var file = new File(path);
  Stream<List<int>> stream = file.openRead();
  var lines = stream.transform(new Utf8Decoder())
    .transform(new LineSplitter());
  await for (var line in lines) {
    print("line string: $line");
  }
}

testMath() {
  var degrees = 30;
  print('pi:${math.pi}  value: ${math.pi / 180}');
  var radians = degrees * (math.pi / 180);
  print("radians: $radians");
  var sinOf30Degrees = math.sin(radians);
  print("sinOf30Degrees: $sinOf30Degrees");
  var random = new math.Random();
  var randomValue = random.nextInt(10);
  print('random value: $randomValue');
}

testServer(String address,int port) async {
  handlerRequest(HttpRequest request) {
    request.response.headers.contentType = new ContentType('text', 'plain');
    request.response.write('hello,dart request');
    request.response.close();
  }
  var requests = await HttpServer.bind(address, port);
  await for (var request in requests) {
    print("uri origin: ${request.uri.origin}");
    if (request.uri.path == '/language/dart') {
      handlerRequest(request);
    } else {
      request.response.write('Not found');
      request.response.close();
    }
  }
}

testClient(String url) async {
  var uri = Uri.parse(url);
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(uri);
  print('have request');
  var response = await request.close();
  print('have response');
  var data = await response.transform(new Utf8Decoder()).toList();
  var body = data.join('');
  print('server response: $body');
  httpClient.close();
}

class JsonObject {
  String value_01 = "hello,json";
  Map toJson() {
    Map<String,String> map = new Map();
    map["value_01"] = value_01;
    return map;
  }
  static JsonObject convertObject(Map<String,Object> map) {
    JsonObject jsonObject = new JsonObject();
    jsonObject.value_01 = map["value_01"];
    return jsonObject;
  }
}

testJson() {
  JsonObject tempObject = new JsonObject();
  String json = jsonEncode(tempObject);
  print("json: $json");
  JsonObject jsonObject = JsonObject.convertObject(jsonDecode(json));
  print('json object value01: ${jsonObject.value_01}');
}

main() {
  var number = 42;
  //printNumber(number);
//  List<int> list = new List();
//  list.add(1);
//  list.add(2);
//  list.add(3);
//  Map<String,String> map = new Map();
//  map["A"] = "AValue";
//  map["B"] = "BValue";
//
//  var value = testFunction(true, list, map,"test01");
//  if (value != null && value is TempObject) {
//    var tempValue = (value as TempObject)
//        ..temp_01 = "01"
//        ..temp_02 = "02";
//    print("tempvalue: ${tempValue.temp_01} ${tempValue.temp_02}");
//  }
//  TempObject tempObject = TempObject.getInstance();
//  print("sum01:${tempObject.sum01}");
//  print("sum02:${tempObject.sum02}");
//  tempObject.sum01 = 50;
//  print("set sum01:${tempObject.value_01}");
//  Color mColor = Color.BLUE;
//  switch (mColor) {
//    case Color.RED:
//      print("red");
//      break;
//    case Color.BLUE:
//      print("blue");
//      break;
//    case Color.GREEN:
//      print("green");
//      break;
//    default:
//      break;
//  }
//  List<Color> colors = Color.values;
//  colors.forEach((color) {
//    print("color index: ${color.index}");
//  });
//  matchReg();
//  matchCollection();
//  testUri();
//  testDateTime();
//  testAsync();
//  testMath();
  testJson();
}