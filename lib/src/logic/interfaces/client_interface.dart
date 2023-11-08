mixin ClientInterface {
  
  /// DIO GET
  get() {}

  /// DIO POST
  post() {}

  /// DIO DELETE
  delete() {}

  /// DIO PATCH
  patch() {}

  /// DIO PUT
  put() {}

  /// DIO DOWNLOAD
  download() {}

  /// DIO UPLOAD
  uploadFiles({required List<dynamic> files}) {}

  /// LISTEN TO STREAM DIO
  listenToAStream() {}
}