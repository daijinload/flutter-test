
import 'package:artemis/artemis.dart';
import 'package:flutter_main/src/3_infrastructures/graphql/generated/test.dart';

final client = ArtemisClient('http://localhost:8040/gql/device');

Future<String> echo() async {
  final echoQuery = EchoQuery();
  final response = await client.execute(echoQuery);
  if (response.hasErrors) {
    // TODO どこかで独自エラーを定義して使いたい
    throw Exception(response.errors!.first.message);
  }
  
  return response.data!.echo!.id;
}
