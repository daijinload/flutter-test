import 'package:artemis/artemis.dart';
import 'package:flutter_main/common/exception.dart';
import 'package:flutter_main/common/my_config.dart';
import 'package:flutter_main/src/3_infrastructures/graphql/generated/test.dart';

final client = ArtemisClient('http://localhost:8040/gql/device');

Future<String> echo() async {
  final echoQuery = EchoQuery();
  final response = await client.execute(echoQuery);
  if (response.hasErrors) {
    final first = response.errors!.first;

    var message = first.message;
    if (myConfig.isViewDialogStackTrace) {
      message += '\n' + first.extensions!['exception'].toString() + '\n\n';
    }

    final code = first.extensions?['code'];
    switch (code) {
      case 'BAD_USER_INPUT':
        throw ValidateException(message);
      default:
    }
    throw Exception('GraphQLのApplloサーバから予期しないエラーコードが返されました。code=$code');
  }

  return response.data!.echo!.id;
}
