import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure IsotopicPaleothermometryPackage where
  delta18O : ℝ
  temperature : ℝ
  slope : ℝ
  intercept : ℝ

structure IsotopicPaleothermometryEvidence (I : IsotopicPaleothermometryPackage) where
  delta18OClosed : I.delta18O = I.slope * I.temperature + I.intercept
  temperatureClosed : I.temperature > 250

def IsotopicPaleothermometryClosed (I : IsotopicPaleothermometryPackage) : Prop :=
  I.delta18O = I.slope * I.temperature + I.intercept

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse