import 'package:flutter_products_store/domain/core/messages.dart';

abstract class IFailure {
  IMessage get message;
}

class CancelledByUser implements IFailure {
  @override
  IMessage get message => WarningMessage("Request cancelled by the user");
}

class ServerError implements IFailure {
  @override
  IMessage get message => ErrorMessage("Server Error");
}

class InvalidEmailAndPasswordCombination implements IFailure {
  @override
  IMessage get message =>
      ErrorMessage("Invalid email and password combination");
}

class RequireInternetConnection extends IFailure {
  @override
  IMessage get message => InternetConnection();
}

class GenericFailure extends IFailure {
  @override
  final message = GenericServerFails();
}
