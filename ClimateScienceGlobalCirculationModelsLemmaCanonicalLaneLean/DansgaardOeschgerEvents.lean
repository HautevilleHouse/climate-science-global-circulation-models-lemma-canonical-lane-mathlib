import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure DansgaardOeschgerEventsPackage where
  abruptWarming : ℝ
  gradualCooling : ℝ
  period : ℝ
  amplitude : ℝ

structure DansgaardOeschgerEventsEvidence (D : DansgaardOeschgerEventsPackage) where
  amplitudeClosed : D.amplitude = D.abruptWarming - D.gradualCooling
  periodPositive : D.period > 0

def DansgaardOeschgerEventsClosed (D : DansgaardOeschgerEventsPackage) : Prop :=
  D.amplitude = D.abruptWarming - D.gradualCooling

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse