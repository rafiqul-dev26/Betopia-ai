import '../../domain/entities/oidc_provider_entity.dart';
import '../../domain/entities/sso_session_entity.dart';
import '../models/exchange_ticket_model.dart';
import '../models/oidc_provider_model.dart';

class OidcMapper {
  const OidcMapper();

  OidcProviderEntity toProviderEntity(OidcProviderModel model) {
    return OidcProviderEntity(
      id: model.id,
      oidcName: model.oidcName,
      allowedDomains: model.allowedDomains,
      issuerUrl: model.issuerUrl,
      scope: model.scope,
    );
  }

  List<OidcProviderEntity> toProviderEntityList(List<dynamic> list) {
    return list.map((item) {
      if (item is OidcProviderModel) {
        return toProviderEntity(item);
      }
      final map = item is Map<String, dynamic>
          ? item
          : (item as Map).cast<String, dynamic>();
      return toProviderEntity(OidcProviderModel.fromJson(map));
    }).toList();
  }

  SsoSessionEntity toSessionEntity(TokenResponseModel model) {
    return SsoSessionEntity(
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
    );
  }
}
