// This is a generated file (see the discoveryapis_generator project).

library dev_appserver.authVerifyApi.client;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;
import 'package:dev_appserver/server/authverifyapi.dart';
export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client authVerifyApi/0.1';

class AuthVerifyApi {

  final commons.ApiRequester _requester;

  AuthVerifyApi(http.Client client, {core.String rootUrl: "http://localhost:8080/", core.String servicePath: "authVerifyApi/0.1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [AuthVerifyResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<AuthVerifyResponse> verifyGoogleAuth(AuthVerifyRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode(AuthVerifyRequestFactory.toJson(request));
    }

    _url = 'google';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => AuthVerifyResponseFactory.fromJson(data));
  }

}



class AuthVerifyRequestFactory {
  static AuthVerifyRequest fromJson(core.Map _json) {
    var message = new AuthVerifyRequest();
    if (_json.containsKey("token")) {
      message.token = _json["token"];
    }
    return message;
  }

  static core.Map toJson(AuthVerifyRequest message) {
    var _json = new core.Map();
    if (message.token != null) {
      _json["token"] = message.token;
    }
    return _json;
  }
}

class AuthVerifyResponseFactory {
  static AuthVerifyResponse fromJson(core.Map _json) {
    var message = new AuthVerifyResponse();
    if (_json.containsKey("isVerified")) {
      message.isVerified = _json["isVerified"];
    }
    return message;
  }

  static core.Map toJson(AuthVerifyResponse message) {
    var _json = new core.Map();
    if (message.isVerified != null) {
      _json["isVerified"] = message.isVerified;
    }
    return _json;
  }
}

