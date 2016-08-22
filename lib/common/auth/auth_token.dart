// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library common.auth.auth_token;

class AuthToken {
  String _tokenId;

  AuthToken(String tokenId) {
    this._tokenId = tokenId;
  }

  String getTokenId() {
    return this._tokenId;
  }
}

