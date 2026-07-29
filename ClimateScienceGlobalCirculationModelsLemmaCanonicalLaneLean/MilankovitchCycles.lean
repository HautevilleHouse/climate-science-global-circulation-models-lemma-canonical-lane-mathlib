import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure MilankovitchCyclesPackage where
  eccentricity : ℝ
  obliquity : ℝ
  precession : ℝ
  insolationAnomaly : ℝ

structure MilankovitchCyclesEvidence (M : MilankovitchCyclesPackage) where
  insolationAnomalyClosed : M.insolationAnomaly = M.eccentricity * M.obliquity * M.precession
  eccentricityPositive : M.eccentricity > 0

def MilankovitchCyclesClosed (M : MilankovitchCyclesPackage) : Prop :=
  M.insolationAnomaly = M.eccentricity * M.obliquity * M.precession

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse