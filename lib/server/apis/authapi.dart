// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server.apis.authapi;

import 'package:rpc/rpc.dart';
import 'package:dev_appserver/common/auth/auth_token.dart';
import 'package:dev_appserver/common/auth/auth_token_verification.dart';
import 'package:dev_appserver/server/services/google_auth_verifier.dart';

@ApiClass(version: 'v1')
class AuthApi {
  GoogleAuthVerifier _glAuthVerifier;

  AuthApi() {
    this._glAuthVerifier = new GoogleAuthVerifier();
  }

  @ApiMethod(method: 'GET', path: 'google/{token}')
  AuthTokenVerification verifyGoogleAuth(String token) {
    return _glAuthVerifier.verify(new AuthToken(token));
  }

}