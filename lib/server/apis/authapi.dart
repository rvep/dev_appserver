// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dev_appserver.lib.server.api.authapi;

import 'package:rpc/rpc.dart';
import 'package:firebase3/firebase.dart' as firebase;
import 'package:dev_appserver/common/auth/auth_token.dart';
import 'package:dev_appserver/common/auth/auth_token_verification.dart';
import 'package:dev_appserver/server/services/google_auth_verifier.dart';

@ApiClass(version: 'v1')
class AuthApi {
  GoogleAuthVerifier glAuthVerifier;

  AuthApi() {
    // init firebase
    firebase.initializeApp(
      apiKey: "AIzaSyC1aHWikGh18FBBwuVbSGuUu1lQvWCOUnY",
      authDomain: "rvep-1212.firebaseapp.com",
      databaseURL: "https://rvep-1212.firebaseio.com",
      storageBucket: "rvep-1212.appspot.com");
  }

  @ApiMethod(method: 'GET', path: 'google')
  AuthTokenVerification verifyGoogleAuth(AuthToken authToken) {

  }

}