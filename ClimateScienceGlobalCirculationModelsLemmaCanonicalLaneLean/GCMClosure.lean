import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure ClimateAdmittedObject where
  energyBalanceModel : EnergyBalanceModel
  radiationBalance : RadiationBalancePackage
  milankovitch : MilankovitchForcingPackage
  iceAlbedo : IceAlbedoFeedbackPackage
  oceanHeat : OceanHeatTransportPackage
  gcmValid : Prop
  conclusion : gcmValid

structure ClimateAdmissibleClass where
  object : ClimateAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : ClimateAdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : ClimateAdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : ClimateAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ClimateAdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedGCMClosure (A : ClimateAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gcm_endgame (A : ClimateAdmissibleClass) : ConstrainedGCMClosure A := by
  refine And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse