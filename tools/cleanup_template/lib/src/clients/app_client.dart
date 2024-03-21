import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_client.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
AppClient appClient(AppClientRef ref) {
  final appClient = AppClient(Client());
  ref.onDispose(appClient.close);
  return appClient;
}

class AppClient extends BaseClient {
  AppClient(this._inner);

  final Client _inner;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    return _inner.send(request).timeout(const Duration(seconds: 3));
  }

  @override
  void close() => _inner.close();
}
