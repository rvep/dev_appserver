// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library authverifyapi;

import 'package:rpc/rpc.dart';

import 'package:dart_jwt/dart_jwt.dart';

class AuthVerifyRequest {
  @ApiProperty(required: true)
  String token;
}

class AuthVerifyResponse {
  bool isVerified;

  AuthVerifyResponse();
}

@ApiClass(version: '0.1')
class AuthVerifyApi {

  AuthVerifyApi();

  @ApiMethod(method: 'POST', path: 'google')
  AuthVerifyResponse verifyGoogleAuth(AuthVerifyRequest request) {
    AuthVerifyResponse verification = new AuthVerifyResponse();

    JsonWebToken jwt = new JsonWebToken.decode(request.token);
    JwtValidationContext jvc = new JwtValidationContext.withSharedSecret("AIzaSyC1aHWikGh18FBBwuVbSGuUu1lQvWCOUnY");

    try {
      Set<ConstraintViolation> violations = jwt.validate(jvc);
      verification.isVerified = true;
      return verification;
    } catch (violation) {
      // claims may have been tampered with
      return verification;
    }
  }

}