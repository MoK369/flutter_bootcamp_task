extension HttpStatusCode on int{
  bool isSuccessHttpCall(){
    return this >= 200 && this < 300;
  }
}