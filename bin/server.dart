// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server;

import 'package:rpc/rpc.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_rpc/shelf_rpc.dart' as shelf_rpc;
import 'package:dev_appserver/server/apis/authapi.dart';

void main() {
  // Create your RPC API Server.
  ApiServer apiServer = new ApiServer(prettyPrint: true);
  apiServer.addApi(new AuthApi());

  // Create a Shelf handler for your RPC API.
  var handler = shelf_rpc.createRpcHandler(apiServer);

  // Start serving with Shelf.
  io.serve(handler, 'localhost', 8088);
}