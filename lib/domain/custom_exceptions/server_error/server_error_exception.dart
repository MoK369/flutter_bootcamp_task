class ServerErrorException implements Exception{
  String statusCode;
  String statusMessage;
  ServerErrorException({required this.statusCode,required this.statusMessage});
}