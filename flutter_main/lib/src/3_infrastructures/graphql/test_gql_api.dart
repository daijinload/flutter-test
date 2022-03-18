import 'package:artemis/artemis.dart';
import 'package:flutter_main/src/3_infrastructures/graphql/generated/test.dart';

final client = ArtemisClient('http://localhost:8040/gql/device');

Future<String> echo() async {
  final echoQuery = EchoQuery();
  final response = await client.execute(echoQuery);
  if (response.hasErrors) {
    final first = response.errors!.first;
    switch (first.extensions?['code']) {
      case 'BAD_USER_INPUT':
        // TODO どこかで独自エラーを定義して使いたい
        throw Exception(first.message +
            '\n' +
            first.extensions!['exception'].toString() +
            '\n\n');
      default:
    }
  }

  return response.data!.echo!.id;
}
