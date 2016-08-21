// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dev_appserver.lib.server.services.google_auth_verifier;

import 'package:firebase3/firebase.dart' as firebase;
import 'package:dev_appserver/common/auth/auth_token.dart';

class GoogleAuthVerifier {

  bool verify(AuthToken authToken) {
    firebase.auth().currentUser.getToken();
  }

}