class ServerErrorException implements Exception{
  String statusMessage;
  String errorMessage;
  ServerErrorException({required this.statusMessage,required this.errorMessage});
}