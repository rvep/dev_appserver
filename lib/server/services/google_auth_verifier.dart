// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library server.services.google_auth_verifier;

import 'package:dart_jwt/dart_jwt.dart';
import 'package:dev_appserver/common/auth/auth_token.dart';
import 'package:dev_appserver/common/auth/auth_token_verification.dart';

class GoogleAuthVerifier {

  AuthTokenVerification verify(AuthToken authToken) {
    AuthTokenVerification verification = new AuthTokenVerification(false);

    JsonWebToken jwt = new JsonWebToken.decode(authToken.getTokenId());
    JwtValidationContext jvc = new JwtValidationContext.withSharedSecret("AIzaSyC1aHWikGh18FBBwuVbSGuUu1lQvWCOUnY");

    try {
      Set<ConstraintViolation> violations = jwt.validate(jvc);
      verification.setIsVerified(true);
    } catch (violation) {
      // claims may have been tampered with
      return verification;
    }
  }

}