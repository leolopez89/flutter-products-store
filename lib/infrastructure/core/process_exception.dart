import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_products_store/domain/core/failures.dart';
import 'package:get/get.dart';

typedef ActionCallback<T> = Future<T> Function();
mixin ProcessException {
  Future<Either<IFailure, T>> process<T>(
      {required ActionCallback<T> doRequest}) async {
    try {
      final result = await doRequest();
      return Right(result);
    } on DioError catch (ex) {
      Get.log(ex.stackTrace.toString());
      Get.log(ex.response.toString());
      Get.log(ex.toString());
      return Left(ServerError());
    } catch (ex) {
      Get.log(ex.toString());
      return Left(GenericFailure());
    }
  }
}
