import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure PaleoTemperatureProxyPackage where
  delta18O : ℝ → ℝ
  temperature : ℝ → ℝ
  calibrationSlope : ℝ
  calibrationIntercept : ℝ

structure PaleoTemperatureProxyEvidence (P : PaleoTemperatureProxyPackage) where
  delta18OClosed : ∀ t, P.delta18O t = -1.5 * Real.sin (0.002 * t)
  calibrationClosed : ∀ t, P.temperature t = P.calibrationSlope * P.delta18O t + P.calibrationIntercept
  slopeClosed : P.calibrationSlope = 0.5
  interceptClosed : P.calibrationIntercept = 10.0

def PaleoTemperatureProxyClosed (P : PaleoTemperatureProxyPackage) : Prop :=
  (∀ t, P.delta18O t = -1.5 * Real.sin (0.002 * t)) ∧
  (∀ t, P.temperature t = P.calibrationSlope * P.delta18O t + P.calibrationIntercept) ∧
  (P.calibrationSlope = 0.5) ∧
  (P.calibrationIntercept = 10.0)

theorem paleo_temperature_proxy_closed_from_evidence (P : PaleoTemperatureProxyPackage) (Ev : PaleoTemperatureProxyEvidence P) : PaleoTemperatureProxyClosed P := by
  exact And.intro Ev.delta18OClosed (And.intro Ev.calibrationClosed (And.intro Ev.slopeClosed Ev.interceptClosed))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse
