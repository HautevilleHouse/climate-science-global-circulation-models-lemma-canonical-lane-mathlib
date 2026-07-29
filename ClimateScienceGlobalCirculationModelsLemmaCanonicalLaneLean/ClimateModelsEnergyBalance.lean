import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure EnergyBalancePackage where
  solarInsolation : ℝ
  albedo : ℝ
  outgoingLongwave : ℝ
  netRadiation : ℝ
  temperature : ℝ

structure EnergyBalanceEvidence (E : EnergyBalancePackage) where
  netRadiationClosed : E.netRadiation = E.solarInsolation * (1 - E.albedo) - E.outgoingLongwave
  temperatureClosed : E.temperature > 273.15

def EnergyBalanceClosed (E : EnergyBalancePackage) : Prop :=
  E.netRadiation = E.solarInsolation * (1 - E.albedo) - E.outgoingLongwave

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse