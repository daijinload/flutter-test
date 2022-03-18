import 'package:flutter_main/src/3_infrastructures/graphql/test_gql_api.dart'
    as test_gql_api;
import 'package:flutter_main/src/3_infrastructures/http/sample_api.dart'
    as sample_api;

Future<String> userInfo(String nanika) async {
  final id = await test_gql_api.echo();
  final result = await sample_api.getUserInfo();
  return result + id;
}
