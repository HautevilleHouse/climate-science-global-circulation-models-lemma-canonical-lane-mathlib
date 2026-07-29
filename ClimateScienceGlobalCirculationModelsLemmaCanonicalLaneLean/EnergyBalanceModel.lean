import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure EnergyBalanceModelPackage where
  solarInsolation : ℝ → ℝ
  albedo : ℝ → ℝ
  outgoingLongwave : ℝ → ℝ
  heatCapacity : ℝ
  equilibriumTemperature : ℝ → ℝ

structure EnergyBalanceModelEvidence (E : EnergyBalanceModelPackage) where
  insolationClosed : ∀ x, E.solarInsolation x = 1361 * (1 + 0.5 * Real.cos x)
  albedoClosed : ∀ x, E.albedo x = 0.3
  longwaveClosed : ∀ x, E.outgoingLongwave x = 0.6 * (E.equilibriumTemperature x)^4
  heatCapacityClosed : E.heatCapacity = 1.0

def EnergyBalanceModelClosed (E : EnergyBalanceModelPackage) : Prop :=
  (∀ x, E.solarInsolation x = 1361 * (1 + 0.5 * Real.cos x)) ∧
  (∀ x, E.albedo x = 0.3) ∧
  (∀ x, E.outgoingLongwave x = 0.6 * (E.equilibriumTemperature x)^4) ∧
  (E.heatCapacity = 1.0)

theorem energy_balance_model_closed_from_evidence (E : EnergyBalanceModelPackage) (Ev : EnergyBalanceModelEvidence E) : EnergyBalanceModelClosed E := by
  exact And.intro Ev.insolationClosed (And.intro Ev.albedoClosed (And.intro Ev.longwaveClosed Ev.heatCapacityClosed))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse
