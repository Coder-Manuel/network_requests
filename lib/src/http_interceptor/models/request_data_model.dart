import 'dart:convert';

import 'package:http/http.dart';

final class RequestData extends BaseRequest {
  @override
  // ignore: overridden_fields
  Map<String, String> headers;
  @override
  bool followRedirects;
  @override
  int maxRedirects;
  @override
  bool persistentConnection;

  // Request only variables.
  String? body;
  Encoding? encoding;

  // MultipartRequest only properties.
  Map<String, String>? fields;
  List<MultipartFile>? files;

  RequestData({
    required String method,
    required Uri url,
    required this.headers,
    this.followRedirects = false,
    this.maxRedirects = 5,
    this.persistentConnection = false,
    this.body,
    this.encoding,
    this.fields,
    this.files,
  }) : super(method, url);

  factory RequestData.fromBaseRequest(BaseRequest request) {
    String? reqBody;
    Encoding? reqEncoding;
    Map<String, String>? reqFields;
    List<MultipartFile>? reqFiles;

    switch (request.runtimeType) {
      case const (Request):
        request as Request;
        reqBody = request.body;
        reqEncoding = (request).encoding;
        break;
      case const (MultipartRequest):
        request as MultipartRequest;
        reqFields = request.fields;
        reqFiles = request.files;
        break;
      default:
    }

    return RequestData(
      method: request.method,
      url: request.url,
      headers: request.headers,
      followRedirects: request.followRedirects,
      maxRedirects: request.maxRedirects,
      persistentConnection: request.persistentConnection,
      body: reqBody,
      encoding: reqEncoding,
      fields: reqFields,
      files: reqFiles,
    );
  }
}
