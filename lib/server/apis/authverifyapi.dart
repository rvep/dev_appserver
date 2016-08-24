// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server.apis.auth_verify_api;

import 'package:rpc/rpc.dart';

import 'package:dev_appserver/common/auth/auth_verify_request.dart';
import 'package:dev_appserver/common/auth/auth_verify_response.dart';
import 'package:dev_appserver/server/services/google_auth_verifier.dart';

@ApiClass(version: '0.1')
class AuthVerifyApi {
  @ApiResource()
  GoogleAuthVerifier _glAuthVerifier;

  AuthVerifyApi() {
    this._glAuthVerifier = new GoogleAuthVerifier();
  }

  @ApiMethod(method: 'POST', path: 'google')
  AuthVerifyResponse verifyGoogleAuth(AuthVerifyRequest request) {
    return _glAuthVerifier.verify(request);
  }

}