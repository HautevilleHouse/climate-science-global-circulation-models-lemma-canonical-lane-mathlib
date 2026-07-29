import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure IceAlbedoFeedbackPackage where
  iceExtent : ℝ
  surfaceAlbedo : ℝ -> ℝ
  temperature : ℝ -> ℝ
  feedbackFactor : ℝ
  thresholdTemperature : ℝ
  sensitivity : ℝ

structure IceAlbedoFeedbackEvidence (I : IceAlbedoFeedbackPackage) where
  iceExtentPositive : I.iceExtent > 0
  albedoMonotone : ∀ x, x ≤ I.iceExtent → I.surfaceAlbedo x ≥ 0.5
  feedbackFactorNegative : I.feedbackFactor < 0
  thresholdReachable : I.thresholdTemperature > 0
  sensitivityFinite : I.sensitivity ≠ 0

def IceAlbedoFeedbackClosed (I : IceAlbedoFeedbackPackage) : Prop :=
  I.iceExtent > 0 ∧ (∀ x, x ≤ I.iceExtent → I.surfaceAlbedo x ≥ 0.5) ∧
  I.feedbackFactor < 0 ∧ I.thresholdTemperature > 0 ∧ I.sensitivity ≠ 0

theorem ice_albedo_feedback_closed_from_evidence (I : IceAlbedoFeedbackPackage)
    (Ev : IceAlbedoFeedbackEvidence I) : IceAlbedoFeedbackClosed I := by
  rcases Ev with ⟨ice, albedo, fb, thresh, sens⟩
  exact ⟨ice, albedo, fb, thresh, sens⟩

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse