// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library common.auth.auth_token_verification;

class AuthTokenVerification {
  bool _isVerified;

  AuthTokenVerification(bool isVerified) {
    this._isVerified = isVerified;
  }

  bool getIsVerified() {
    return this._isVerified;
  }

  void setIsVerified(bool isVerified) {
    this._isVerified = isVerified;
  }
}
