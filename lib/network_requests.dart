// For queries, contact the author at: sirmanuel4@gmail.com

library network_requests;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// 3rd party libraries
import 'package:http/http.dart' as http;
export 'package:network_requests/src/services/network_service.dart';
export 'package:network_requests/src/functions/interceptors/network_request_interceptor.dart';

/// The models
part 'models/response_model.dart';
part 'models/upload_file_model.dart';

/// The functions
part 'src/functions/network_functions.dart';

/// The Utilities
part 'src/utils/response_messages.dart';
part 'src/utils/logger_util.dart';
part 'src/utils/network_util.dart';
