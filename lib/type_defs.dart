import 'package:fpdart/fpdart.dart';
import 'package:riverpod_sample1/failure.dart';

typedef FutureEither<T>=Future<Either<Failure,T>>;
typedef FutureVoid=FutureEither<void>;