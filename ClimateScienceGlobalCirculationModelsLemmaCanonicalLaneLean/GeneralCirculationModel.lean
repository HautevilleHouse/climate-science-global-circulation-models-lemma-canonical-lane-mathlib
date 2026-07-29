import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure GeneralCirculationModel where
  gridResolution : ℝ
  timeStep : ℝ
  nlAssumption : Prop
  hydrostaticApprox : Prop
  convergenceCriterion : Prop
  stabilityCondition : Prop
  energyConservation : Prop
  massConservation : Prop

structure GeneralCirculationModelEvidence (G : GeneralCirculationModel) where
  nlAssumptionClosed : G.nlAssumption
  hydrostaticApproxClosed : G.hydrostaticApprox
  convergenceCriterionClosed : G.convergenceCriterion
  stabilityConditionClosed : G.stabilityCondition
  energyConservationClosed : G.energyConservation
  massConservationClosed : G.massConservation

def GeneralCirculationModelClosed (G : GeneralCirculationModel) : Prop :=
  G.nlAssumption ∧ G.hydrostaticApprox ∧ G.convergenceCriterion ∧
  G.stabilityCondition ∧ G.energyConservation ∧ G.massConservation

theorem general_circulation_model_closed_from_evidence (G : GeneralCirculationModel)
    (E : GeneralCirculationModelEvidence G) : GeneralCirculationModelClosed G := by
  exact And.intro E.nlAssumptionClosed
    (And.intro E.hydrostaticApproxClosed
      (And.intro E.convergenceCriterionClosed
        (And.intro E.stabilityConditionClosed
          (And.intro E.energyConservationClosed E.massConservationClosed))))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse
