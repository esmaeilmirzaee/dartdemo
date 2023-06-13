import 'package:http/http.dart' show get, Response;

Iterable<int> getRange(int start, int finish) sync* {
  for (int i = start; i <= finish; i++) {
    yield i;
  }
}

Iterable<int> getRangeTwo(int start, int finish) sync* {
  if (start <= finish) {
    yield start;
    yield* getRangeTwo(start + 1, finish);
  }
}

Future<Response> fetchHeavyData() async {
  print('fetching data');
  final response = await get(Uri.parse(
      'https://raw.githubusercontent.com/json-iterator/test-data/master/large-file.json'));
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Error');
  }
}
