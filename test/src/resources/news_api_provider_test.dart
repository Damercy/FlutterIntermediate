import 'package:UdemyFlutter/src/resources/news_api_provider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  final newsApiClient = NewsApiProvider();

  test("fetchTopIds returns list of Ids",() async{
    // setup of test case
    newsApiClient.client = MockClient((request) async{
        return Response(json.encode([1,2,3,4,5]),200);
    });

    final ids = await newsApiClient.fetchTopIds();
    // expectation

    expect(ids,[1,2,3,4,5]);
  });

}
