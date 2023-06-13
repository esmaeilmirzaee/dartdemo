import 'package:http/http.dart' show Response;
import 'package:dartdemo/dartdemo.dart';
import 'package:dartdemo/utils.dart';

void main(List<String> arguments) async {
  Response response = await fetchHeavyData();
  String res = response.body;
  final githubs = accountFromJson(res);
  print(githubs.length);
}
