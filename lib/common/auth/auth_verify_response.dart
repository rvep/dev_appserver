// Copyright (c) 2016, borysn. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library common.auth.auth_verify_response;

import 'package:rpc/rpc.dart';

class AuthVerifyResponse {
  @ApiProperty(defaultValue: false)
  bool isVerified;

  AuthVerifyResponse();
}
