part of '../../network_requests.dart';

/// [NetworkRequest] client.
class NetworkRequest {
  static NetworkRequest? _instance;

  late InterceptedHttp _httpClient;

  NetworkRequest._internal() {
    _initializer();
  }

  /// [NetworkRequest] singleton instance
  static NetworkRequest get instance {
    _instance ??= NetworkRequest._internal();
    return _instance!;
  }

  void _initializer() {
    _httpClient = InterceptedHttp.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    Logger.log('Client has been initialized');
  }

  /// Add a retry interceptor to the client.
  void addRetryPolicy(RetryInterceptor retryInterceptor) {
    _httpClient.retryPolicy = retryInterceptor;
  }

  /// Set whether the default logger should be activated.
  ///
  /// When activated, it will log the request endpoint and response status code.
  void setLoggerActive(bool activate) {
    bool loggerActive = _httpClient.interceptors.contains(LoggingInterceptor());
    if (activate) {
      if (!loggerActive) {
        _httpClient.interceptors.insert(0, LoggingInterceptor());
      }
    } else {
      if (loggerActive) {
        _httpClient.interceptors.remove(LoggingInterceptor());
      }
    }
  }

  /// Add an interceptor to the [NetworkRequest] client.
  void addInterceptor(NetworkRequestInterceptor value) {
    if (_httpClient.interceptors.contains(value)) {
      _httpClient.interceptors.remove(value);
    }

    _httpClient.interceptors.insert(0, value);
  }

  /// Sends a GET request with the given headers to the given URL.
  /// > * _@param: (required)_ __[Uri]__
  ///
  /// > * _@param:_ __[Map<String, String>?]__ headers
  ///
  /// > * _@param:_ __[Duration?]__ timeout
  ///
  /// Pass in a [timeout] if you want more customization, the default
  /// set to 30 seconds
  ///
  /// If the `success` property is `false`, then that simply means the `request`
  /// `failed`, you can then view other details of the request but the `data`
  /// value will be `null`.
  ///
  /// This automatically initializes a new [Client] and closes that client once
  /// the request is complete.
  Future<ApiResponse> get(
    Uri url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _httpClient
          .get(
            url,
            headers: headers,
          )
          .timeout(
            timeout ?? const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(
              ResponseMessage.SERVER_TIMEOUT.value,
            ),
          );

      // * Set the response
      apiResponse = respData(response.statusCode, response.body);
    } on TimeoutException {
      apiResponse.exception = ResponseMessage.SERVER_TIMEOUT;
      apiResponse.message = ResponseMessage.SERVER_TIMEOUT.value;
    } on SocketException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } on http.ClientException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } catch (e) {
      apiResponse.exception = e;
      apiResponse.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
    }

    return apiResponse;
  }

  /// Sends a POST request with the given headers and body to the given URL.
  ///
  /// > * _@param: (required)_ __[Uri]__
  ///
  /// > * _@param:_ __[Map<String, String>?]__ headers
  ///
  /// > * _@param:_ __[Object?]__ body
  ///
  /// > * _@param:_ __[Duration?]__ timeout
  ///
  /// Pass in a [timeout] if you want more customization, the default
  /// set to 30 seconds
  ///
  /// If the `success` property is `false`, then that simply means the `request`
  /// `failed`, you can then view other details of the request but the `data`
  /// value will be `null`.
  ///
  /// This automatically initializes a new [Client] and closes that client once
  /// the request is complete.
  Future<ApiResponse> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Duration? timeout,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _httpClient
          .post(
            url,
            headers: headers,
            body: bodyParser(body),
          )
          .timeout(
            timeout ?? const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(
              ResponseMessage.SERVER_TIMEOUT.value,
            ),
          );

      // * Set the response
      apiResponse = respData(response.statusCode, response.body);
    } on TimeoutException {
      apiResponse.exception = ResponseMessage.SERVER_TIMEOUT;
      apiResponse.message = ResponseMessage.SERVER_TIMEOUT.value;
    } on SocketException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } on http.ClientException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } catch (e) {
      apiResponse.exception = e;
      apiResponse.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
    }

    return apiResponse;
  }

  /// Sends a PUT request with the given headers and body to the given URL.
  ///
  /// > * _@param: (required)_ __[Uri]__
  ///
  /// > * _@param:_ __[Map<String, String>?]__ headers
  ///
  /// > * _@param:_ __[Object?]__ body
  ///
  /// > * _@param:_ __[Duration?]__ timeout
  ///
  /// Pass in a [timeout] if you want more customization, the default
  /// set to 30 seconds
  ///
  /// If the `success` property is `false`, then that simply means the `request`
  /// `failed`, you can then view other details of the request but the `data`
  /// value will be `null`.
  ///
  /// This automatically initializes a new [Client] and closes that client once
  /// the request is complete.
  Future<ApiResponse> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Duration? timeout,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _httpClient
          .put(
            url,
            headers: headers,
            body: bodyParser(body),
          )
          .timeout(
            timeout ?? const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(
              ResponseMessage.SERVER_TIMEOUT.value,
            ),
          );

      // * Set the response
      apiResponse = respData(response.statusCode, response.body);
    } on TimeoutException {
      apiResponse.exception = ResponseMessage.SERVER_TIMEOUT;
      apiResponse.message = ResponseMessage.SERVER_TIMEOUT.value;
    } on SocketException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } on http.ClientException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } catch (e) {
      apiResponse.exception = e;
      apiResponse.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
    }

    return apiResponse;
  }

  /// Sends a DELETE request with the given headers to the given URL.
  /// > * _@param: (required)_ __[Uri]__
  ///
  /// > * _@param:_ __[Map<String, String>?]__ headers
  ///
  /// > * _@param:_ __[Object?]__ body
  ///
  /// > * _@param:_ __[Duration?]__ timeout
  ///
  /// Pass in a [timeout] if you want more customization, the default
  /// set to 30 seconds
  ///
  /// If the `success` property is `false`, then that simply means the `request`
  /// `failed`, you can then view other details of the request but the `data`
  /// value will be `null`.
  ///
  /// This automatically initializes a new [Client] and closes that client once
  /// the request is complete.
  Future<ApiResponse> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Duration? timeout,
  }) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await _httpClient
          .delete(
            url,
            headers: headers,
            body: bodyParser(body),
          )
          .timeout(
            timeout ?? const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(
              ResponseMessage.SERVER_TIMEOUT.value,
            ),
          );

      // * Set the response
      apiResponse = respData(response.statusCode, response.body);
    } on TimeoutException {
      apiResponse.exception = ResponseMessage.SERVER_TIMEOUT;
      apiResponse.message = ResponseMessage.SERVER_TIMEOUT.value;
    } on SocketException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } on http.ClientException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } catch (e) {
      apiResponse.exception = e;
      apiResponse.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
    }

    return apiResponse;
  }

  /// Sends a [MultipartRequest] to upload [files] with the given [headers] to the provided [url].
  ///
  /// __NOTE: This methods only uploads files from paths, the other types e.g bytes and string
  /// are yet to be implemented.__
  ///
  /// > * _@param: (required)_ __[Uri]__
  ///
  /// > * _@param: (required)_ __[String]__ method => The method to be used while uploading. e.g `post`,
  /// `get`, `patch`
  ///
  /// > * _@param:_ __[Map<String, String>?]__ headers
  ///
  /// > * _@param:_ __[List<UploadFile>]__ files
  ///

  Future<ApiResponse> uploadFile(
    Uri url, {
    required String method,
    Map<String, String>? headers,
    List<UploadFile> files = const [],
    Map<String, String>? otherFields,
    Duration? timeout,
  }) async {
    // * Initiate the request client
    final request = MultipartRequest(method.toUpperCase(), url);

    // * Add the provided files to the multipart request files.
    for (var i in files) {
      // * Get the mime type.
      final mime = lookupMimeType(i.path)?.split('/');

      final uploadFile = await http.MultipartFile.fromPath(
        i.field,
        i.path,
        filename: i.fileName,
        contentType: mime != null ? MediaType(mime[0], mime[1]) : null,
      );
      request.files.add(uploadFile);
    }

    // * Add headers.
    request.headers.addAll(headers ?? {});

    // * Add any extra fields that might be passed.
    if (otherFields != null) {
      request.fields.addAll(otherFields);
    }

    ApiResponse apiResponse = ApiResponse();
    try {
      Logger.log(
        '============= HTTP CLIENT: ${_httpClient.client?.toString()}',
      );
      final response = await _httpClient.client?.send(request).timeout(
            timeout ?? const Duration(seconds: 30),
            onTimeout: () => throw TimeoutException(
              ResponseMessage.SERVER_TIMEOUT.value,
            ),
          );

      // * Set the response
      apiResponse = await uploadRespData(response);
    } on TimeoutException {
      apiResponse.exception = ResponseMessage.SERVER_TIMEOUT;
      apiResponse.message = ResponseMessage.SERVER_TIMEOUT.value;
    } on SocketException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } on http.ClientException {
      apiResponse.exception = ResponseMessage.NO_INTERNET;
      apiResponse.message = ResponseMessage.NO_INTERNET.value;
    } catch (e) {
      Logger.logError('ERROR: ${e.toString()}');
      apiResponse.exception = e;
      apiResponse.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
    }

    return apiResponse;
  }
}
