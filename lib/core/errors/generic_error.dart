import 'application_error.dart';

/// Uma [ApplicationError] cuja mensagem para o usuário é genérica.
class GenericError extends ApplicationError {
  GenericError({
    causedBy,
    fingerprint,
    additionalInfo,
  }) : super(
    friendlyMessage: '',
    causedBy: causedBy,
    fingerprint: fingerprint,
    additionalInfo: additionalInfo,
  );

  @override
  String get name => '$GenericError';
}
