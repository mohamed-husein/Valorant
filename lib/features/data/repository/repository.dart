import 'package:dartz/dartz.dart';
import '../../../core/errors/error_handler.dart';
import '../../../core/errors/failure.dart';
import '../model/agents_model.dart';
import '../web_services/web_services.dart';

class Repository {
  final WebServices webServices;

  Repository({required this.webServices});

  Future<Either<Failure, List<Agents>>> getAgentsInfo() async {
    try {
      final result = await webServices.getAgentsInfo();
      return right(result);
    } on ServerException {
      return left(
        ServerFailure(),
      );
    }
  }
}
