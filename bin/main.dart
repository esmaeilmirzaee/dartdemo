import 'package:http/http.dart' show Response;
import 'package:dartdemo/dartdemo.dart';
import 'package:dartdemo/utils.dart';

List<Account> _accounts = [];

initState() async {
  Response response = await fetchHeavyData();
  String res = response.body;
  _accounts = accountFromJson(res);
}

Stream<Account> getInfoRange(int start, int finish) async* {
  if (start <= finish) {
    yield (_accounts[start]);
    yield* getInfoRange(start + 1, finish);
  }
}

printAccount(Account account) {
  print('id: ${account.id}\n Created at: ${account.createdAt}');
}

void main(List<String> arguments) async {
  await initState();
  getInfoRange(1, 3).forEach(printAccount);
  print(_accounts.length);
}
