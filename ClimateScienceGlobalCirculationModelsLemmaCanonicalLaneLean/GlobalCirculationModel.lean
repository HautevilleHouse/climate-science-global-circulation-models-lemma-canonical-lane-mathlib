import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure GlobalCirculationModel where
  gridResolution : ℕ
  timeStep : ℝ
  parameterizationScheme : String
  numericalStability : Prop
  conservationLaws : Prop
  stabilityTerm : numericalStability
  conservationTerm : conservationLaws

def GlobalCirculationModelClosed (G : GlobalCirculationModel) : Prop :=
  G.numericalStability ∧ G.conservationLaws

theorem global_circulation_model_closed (G : GlobalCirculationModel) :
    GlobalCirculationModelClosed G := by
  exact And.intro G.stabilityTerm G.conservationTerm

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse