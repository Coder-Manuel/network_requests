// For queries, contact the author at: sirmanuel4@gmail.com

library network_requests;

import 'dart:async';
import 'dart:io';

/// 3rd party libraries
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'src/functions/functions.dart';
import 'src/interceptors/logging_interceptor.dart';
import 'src/interceptors/network_request_interceptor.dart';
import 'src/http_interceptor/http_interceptor.dart';
import 'src/utils/utils.dart';

/// Exports
export 'src/http_interceptor/http_interceptor.dart'
    hide
        InterceptorContract,
        RetryPolicy,
        BaseClient,
        Response,
        Request,
        BaseRequest,
        BaseResponse;
export 'src/interceptors/network_request_interceptor.dart';
export 'src/utils/utils.dart' hide Logger;

/// The models
part 'src/models/response_model.dart';
part 'src/models/upload_file_model.dart';
part 'src/models/network_request_exception.dart';

/// The Service
part 'src/services/network_service.dart';
