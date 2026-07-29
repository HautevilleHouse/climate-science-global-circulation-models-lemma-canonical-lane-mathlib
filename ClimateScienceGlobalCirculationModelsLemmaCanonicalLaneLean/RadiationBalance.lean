import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure RadiationBalancePackage where
  shortwaveIn : ℝ
  shortwaveOut : ℝ
  longwaveUp : ℝ
  longwaveDown : ℝ
  netRadiation : ℝ
  absorbedSolar : ℝ
  emittedThermal : ℝ

structure RadiationBalanceEvidence (R : RadiationBalancePackage) where
  netPositive : R.netRadiation > 0
  absorptionEfficiency : R.shortwaveIn - R.shortwaveOut > 0
  thermalEmissionPositive : R.longwaveUp > 0 ∧ R.longwaveDown > 0
  energyConservation : R.netRadiation = R.absorbedSolar - R.emittedThermal

def RadiationBalanceClosed (R : RadiationBalancePackage) : Prop :=
  R.netRadiation > 0 ∧ R.shortwaveIn - R.shortwaveOut > 0 ∧
  R.longwaveUp > 0 ∧ R.longwaveDown > 0 ∧
  R.netRadiation = R.absorbedSolar - R.emittedThermal

theorem radiation_balance_closed_from_evidence (R : RadiationBalancePackage)
    (Ev : RadiationBalanceEvidence R) : RadiationBalanceClosed R := by
  rcases Ev with ⟨net, abs, thermal, cons⟩
  exact ⟨net, abs, thermal.1, thermal.2, cons⟩

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse