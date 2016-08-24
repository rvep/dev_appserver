// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server;

import 'dart:io';

import 'package:logging/logging.dart';
import 'package:logging_handlers/server_logging_handlers.dart';
import 'package:rpc/rpc.dart';

import 'package:dev_appserver/server/apis/authverifyapi.dart';

const String _API_PREFIX = '/api';
final ApiServer _apiServer = new ApiServer(apiPrefix: _API_PREFIX, prettyPrint: true);

main() async {
  // Add a simple log handler to log information to a server side file.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(new SyncFileLoggingHandler('server.log'));
  if (stdout.hasTerminal) {
    Logger.root.onRecord.listen(new LogPrintHandler());
  }

  _apiServer.addApi(new AuthVerifyApi());
  _apiServer.enableDiscoveryApi();

  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8088);
  server.listen(_apiServer.httpRequestHandler);
}