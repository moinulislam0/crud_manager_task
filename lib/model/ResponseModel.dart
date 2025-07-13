class Responsemodel {
  final dynamic returnData;
  final bool isSuccess;
  final int StatusCode;
  Responsemodel(
      {required this.StatusCode,
      required this.isSuccess,
      required this.returnData});
}
