import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure EnergyBalanceModelPackage where
  incomingSolarRadiation : Prop
  outgoingLongwaveRadiation : Prop
  albedoEffect : Prop
  greenhouseForcing : Prop
  equilibriumTemperature : Prop

structure EnergyBalanceModelEvidence (M : EnergyBalanceModelPackage) where
  incomingSolarRadiationClosed : M.incomingSolarRadiation
  outgoingLongwaveRadiationClosed : M.outgoingLongwaveRadiation
  albedoEffectClosed : M.albedoEffect
  greenhouseForcingClosed : M.greenhouseForcing
  equilibriumTemperatureClosed : M.equilibriumTemperature

def EnergyBalanceModelClosed (M : EnergyBalanceModelPackage) : Prop :=
  M.incomingSolarRadiation ∧ M.outgoingLongwaveRadiation ∧
  M.albedoEffect ∧ M.greenhouseForcing ∧ M.equilibriumTemperature

theorem energy_balance_model_closed_from_evidence
    (M : EnergyBalanceModelPackage) (E : EnergyBalanceModelEvidence M) :
    EnergyBalanceModelClosed M := by
  exact And.intro E.incomingSolarRadiationClosed
    (And.intro E.outgoingLongwaveRadiationClosed
      (And.intro E.albedoEffectClosed
        (And.intro E.greenhouseForcingClosed E.equilibriumTemperatureClosed)))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse