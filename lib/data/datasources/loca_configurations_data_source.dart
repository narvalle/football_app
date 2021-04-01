import 'package:meta/meta.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../core/error/exceptions.dart';

abstract class LocalConfigurationsDataSource {
  String getBaseUrl();
  String getTokenName();
  String getToken();
}

const _CACHED_BASE_URL = 'base_url';
const _CACHED_TOKE_NAME = 'token_name';
const _CACHED_TOKEN = 'token';

class LocalConfigurationsDataSourceImpl
    implements LocalConfigurationsDataSource {
  final GlobalConfiguration globalConfiguration;

  LocalConfigurationsDataSourceImpl({@required this.globalConfiguration});

  @override
  String getBaseUrl() {
    final jsonString = globalConfiguration.getValue<String>(_CACHED_BASE_URL);
    if (jsonString != null) {
      return jsonString;
    } else {
      throw CacheException();
    }
  }

  @override
  String getToken() {
    final jsonString = globalConfiguration.getValue<String>(_CACHED_TOKEN);
    if (jsonString != null) {
      return jsonString;
    } else {
      throw CacheException();
    }
  }

  @override
  String getTokenName() {
    final jsonString = globalConfiguration.getValue<String>(_CACHED_TOKE_NAME);
    if (jsonString != null) {
      return jsonString;
    } else {
      throw CacheException();
    }
  }
}
