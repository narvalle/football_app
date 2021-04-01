import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../error/exceptions.dart';
import '../../domain/repositories/local_configurations_repository.dart';

abstract class HttpManager {
  Future get({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    String tokenName,
    String bodyParametter,
  });

  Future post({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    @required Map<String, dynamic> body,
    String token,
    String tokenName,
    String bodyParametter,
  });

  Future<Stream<T>> getSteam<T>({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    T Function(dynamic) decoder,
  });
}

final Duration _timeOutDuration = Duration(seconds: 40);

class HttpManagerImpl implements HttpManager {
  final LocalConfigurationsRepository repository;

  HttpManagerImpl({@required this.repository});

  @override
  Future get({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    String tokenName,
    String bodyParametter,
  }) async =>
      _returnResponse(
        response: await http
            .get(
          _queryBuilder(path, query),
          headers: _headerBuilder(
            token: token,
            tokenName: tokenName,
          ),
        )
            .timeout(
          _timeOutDuration,
          onTimeout: () {
            throw ServerException();
          },
        ),
        bodyParametter: bodyParametter,
      );

  @override
  Future post({
    String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    Map<String, dynamic> body,
    String token,
    String tokenName,
    String bodyParametter,
  }) async =>
      _returnResponse(
        response: await http
            .post(
          _queryBuilder(path, query),
          headers: _headerBuilder(
            token: token,
            tokenName: tokenName,
          ),
          body: body,
        )
            .timeout(
          _timeOutDuration,
          onTimeout: () {
            throw ServerException();
          },
        ),
        bodyParametter: bodyParametter,
      );

  @override
  Future<Stream<T>> getSteam<T>({
    @required String path,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
    String token,
    T Function(dynamic) decoder,
  }) async {
    final st = await http.Client().send(
      http.Request(
        'get',
        _getUri(path),
      ),
    );

    return st.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => _getDataFromMap(data))
        .expand((data) => (data as List))
        .map((data) => decoder(data));
  }

  Map<String, dynamic> _getDataFromMap(Map<String, dynamic> map) => map['data'];

  Uri _getUri(String path) {
    final inputEither = repository.getBaseUrl();
    final baseUrl = inputEither.fold(
      (failure) {
        throw CacheException();
      },
      (localCache) => localCache,
    );
    String _path = Uri.parse(baseUrl).path;
    if (!_path.endsWith('/')) {
      _path += '/';
    }
    Uri uri = Uri(
        scheme: Uri.parse(baseUrl).scheme,
        host: Uri.parse(baseUrl).host,
        port: Uri.parse(baseUrl).port,
        path: _path + path);
    return uri;
  }

  Map<String, String> _headerBuilder(
      {String token, String tokenName = 'token'}) {
    final headers = Map<String, String>();
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    headers[repository.getTokenName().fold(
          (failure) => throw CacheException(),
          (localCache) => localCache,
        )] = repository.getToken().fold(
          (failure) => throw CacheException(),
          (localCache) => localCache,
        );
    if (headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        headers[tokenName] = value;
      });
    }
    return headers;
  }

  String _queryBuilder(String path, Map<String, dynamic> query) {
    final buffer = StringBuffer();
    final inputEither = repository.getBaseUrl();
    final baseUrl = inputEither.fold(
      (failure) {
        throw CacheException();
      },
      (localCache) => localCache,
    );
    buffer.write('$baseUrl$path');
    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        buffer.write('$key=$value&');
      });
    }
    return buffer.toString();
  }

  dynamic _returnResponse({
    @required http.Response response,
    String bodyParametter,
  }) {
    print('Response from API(${response.statusCode})');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final bodyDecode = json.decode(response.body);
      return bodyParametter == null ? bodyDecode : bodyDecode[bodyParametter];
    }
    throw ServerException();
  }
}
