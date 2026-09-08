import 'package:dart_mappable/dart_mappable.dart';

part 'exchange_ticket_model.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  generateMethods: GenerateMethods.encode,
)
class ExchangeTicketRequestModel with ExchangeTicketRequestModelMappable {
  const ExchangeTicketRequestModel({
    required this.ticket,
  });

  final String ticket;
}

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
  generateMethods: GenerateMethods.decode,
)
class TokenResponseModel with TokenResponseModelMappable {
  const TokenResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType = 'bearer',
    this.expiresIn = 0,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  static const fromJson = TokenResponseModelMapper.fromJson;
}
