import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
