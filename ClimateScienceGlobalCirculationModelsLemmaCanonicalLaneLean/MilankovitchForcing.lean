import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure MilankovitchForcingPackage where
  eccentricity : ℝ → ℝ
  obliquity : ℝ → ℝ
  precession : ℝ → ℝ
  insolationAnomaly : ℝ → ℝ → ℝ

structure MilankovitchForcingEvidence (M : MilankovitchForcingPackage) where
  eccentricityClosed : ∀ t, M.eccentricity t = 0.015 * Real.sin (0.001 * t)
  obliquityClosed : ∀ t, M.obliquity t = 23.44 + 2 * Real.sin (0.01 * t)
  precessionClosed : ∀ t, M.precession t = 0.5 * Real.sin (0.005 * t)
  insolationAnomalyClosed : ∀ lat t, M.insolationAnomaly lat t = M.eccentricity t * Real.sin (M.obliquity t) * Real.sin (lat - M.precession t)

def MilankovitchForcingClosed (M : MilankovitchForcingPackage) : Prop :=
  (∀ t, M.eccentricity t = 0.015 * Real.sin (0.001 * t)) ∧
  (∀ t, M.obliquity t = 23.44 + 2 * Real.sin (0.01 * t)) ∧
  (∀ t, M.precession t = 0.5 * Real.sin (0.005 * t)) ∧
  (∀ lat t, M.insolationAnomaly lat t = M.eccentricity t * Real.sin (M.obliquity t) * Real.sin (lat - M.precession t))

theorem milankovitch_forcing_closed_from_evidence (M : MilankovitchForcingPackage) (Ev : MilankovitchForcingEvidence M) : MilankovitchForcingClosed M := by
  exact And.intro Ev.eccentricityClosed (And.intro Ev.obliquityClosed (And.intro Ev.precessionClosed Ev.insolationAnomalyClosed))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse
