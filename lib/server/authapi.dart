// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:rpc/rpc.dart';
import 'package:dev_appserver/common/auth/auth_token.dart';
import 'package:dev_appserver/common/auth/auth_token_verification.dart';

@ApiClass(version: 'v1')
class AuthApi {

  @ApiMethod(path: 'google')
  AuthTokenVerification verifyGoogleAuth(AuthToken authToken) {
    
  }

}