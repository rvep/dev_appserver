// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dev_appserver.lib.server.api.authapi;

import 'package:rpc/rpc.dart';
import 'package:dev_appserver/common/auth/auth_token.dart';
import 'package:dev_appserver/common/auth/auth_token_verification.dart';
import 'package:dev_appserver/server/services/google_auth_verifier.dart';

@ApiClass(version: 'v1')
class AuthApi {
  GoogleAuthVerifier glAuthVerifier;

  @ApiMethod(path: 'google')
  AuthTokenVerification verifyGoogleAuth(AuthToken authToken) {

  }

}