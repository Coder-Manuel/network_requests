part of network_requests;

/// The upload structure of files
class UploadFile {
  /// The field name/key that will be used to append the file while uploading.
  final String field;

  /// The absolute path of the file.
  final String path;

  /// The file name of the file.
  final String? fileName;

  UploadFile({
    required this.field,
    required this.path,
    this.fileName,
  });
}
