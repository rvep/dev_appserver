// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library auth.authverifyapi;

import 'package:rpc/rpc.dart';

import 'package:dart_jwt/dart_jwt.dart';

import 'package:dev_appserver/common/auth/auth_verify_request.dart';
import 'package:dev_appserver/common/auth/auth_verify_response.dart';

@ApiClass(version: '0.1')
class AuthVerifyApi {

  AuthVerifyApi();

  @ApiMethod(method: 'POST', path: 'google')
    AuthVerifyResponse verifyGoogleAuth(AuthVerifyRequest request) {
    AuthVerifyResponse verification = new AuthVerifyResponse();

    JsonWebToken jwt = new JsonWebToken.decode(request.token);
    JwtValidationContext jvc = new JwtValidationContext.withSharedSecret("AIzaSyC1aHWikGh18FBBwuVbSGuUu1lQvWCOUnY");

    try {
      jwt.validate(jvc);
      // no violation
      verification.isVerified = true;
      return verification;
    } catch (violation) {
      // claims may have been tampered with
      verification.isVerified = false;
      return verification;
    }
  }

}
