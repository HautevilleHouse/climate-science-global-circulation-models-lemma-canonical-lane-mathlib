import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure DansgaardOeschgerEvent where
  temperatureAnomaly : ℝ
  duration : ℝ
  onsetRate : ℝ
  amplitude : ℝ
  stadialCondition : Prop
  interstadialCondition : Prop

structure DansgaardOeschgerEvidence (E : DansgaardOeschgerEvent) where
  temperatureAnomalyClosed : E.temperatureAnomaly > 0
  durationClosed : E.duration > 0
  onsetRateClosed : E.onsetRate > 0
  amplitudeClosed : E.amplitude > 0
  stadialConditionClosed : E.stadialCondition
  interstadialConditionClosed : E.interstadialCondition

def DansgaardOeschgerClosed (E : DansgaardOeschgerEvent) : Prop :=
  E.temperatureAnomaly > 0 ∧ E.duration > 0 ∧ E.onsetRate > 0 ∧
  E.amplitude > 0 ∧ E.stadialCondition ∧ E.interstadialCondition

theorem dansgaard_oeschger_closed_from_evidence (E : DansgaardOeschgerEvent)
    (Ev : DansgaardOeschgerEvidence E) : DansgaardOeschgerClosed E := by
  exact And.intro Ev.temperatureAnomalyClosed
    (And.intro Ev.durationClosed
      (And.intro Ev.onsetRateClosed
        (And.intro Ev.amplitudeClosed
          (And.intro Ev.stadialConditionClosed Ev.interstadialConditionClosed))))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse
