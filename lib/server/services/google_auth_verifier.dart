// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server.services.google_auth_verifier;

import 'package:dart_jwt/dart_jwt.dart';
import 'package:dev_appserver/common/auth/auth_verify_request.dart';
import 'package:dev_appserver/common/auth/auth_verify_response.dart';

class GoogleAuthVerifier {

  AuthVerifyResponse verify(AuthVerifyRequest authToken) {
    AuthVerifyResponse verification = new AuthVerifyResponse();

    JsonWebToken jwt = new JsonWebToken.decode(authToken.token);
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