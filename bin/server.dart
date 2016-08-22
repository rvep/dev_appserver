// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server;

import 'dart:async';
import 'dart:io';
import 'package:logging/logging.dart';
import 'package:rpc/rpc.dart';
import 'package:dev_appserver/server/apis/authapi.dart';

final ApiServer _apiServer = new ApiServer(prettyPrint: true);

main() async {
  // Add a bit of logging...
  Logger.root..level = Level.INFO
    ..onRecord.listen(print);

  // Set up a server serving the pirate API.
  _apiServer.addApi(new AuthApi());
  HttpServer server =
  await HttpServer.bind(InternetAddress.ANY_IP_V4, 8088);
  server.listen(requestHandler);
  print('Server listening on http://${server.address.host}:'
    '${server.port}');
}

Future requestHandler(HttpRequest request) async {
  if (request.uri.path.startsWith('/authApi')) {
    // Handle the API request.
    var apiResponse;
    try {
      var apiRequest = new HttpApiRequest.fromHttpRequest(request);
      apiResponse =
      await _apiServer.handleHttpApiRequest(apiRequest);
    } catch (error, stack) {
      var exception =
      error is Error ? new Exception(error.toString()) : error;
      apiResponse = new HttpApiResponse.error(
        HttpStatus.INTERNAL_SERVER_ERROR, exception.toString(),
        exception, stack);
    }
    return sendApiResponse(apiResponse, request.response);
  }
}