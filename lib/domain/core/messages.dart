enum MessageType { error, warning, info, success }

abstract class IMessage {
  MessageType? get type;
  String get body;
}

class InternetConnection implements IMessage {
  @override
  MessageType get type => MessageType.warning;

  @override
  String get body => 'This option requires an Internet connection. '
      'Verify your connection status.';
}

class GenericServerFails implements IMessage {
  @override
  MessageType get type => MessageType.error;

  @override
  String get body =>
      'Sorry, something was wrong at the time of processing your request. '
      'Please, try again.';
}

class ErrorMessage implements IMessage {
  ErrorMessage(this._body);
  final String _body;

  @override
  MessageType get type => MessageType.error;

  @override
  String get body => _body;
}

class WarningMessage implements IMessage {
  WarningMessage(this._body);
  final String _body;

  @override
  MessageType get type => MessageType.warning;

  @override
  String get body => _body;
}
