import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure GeneralCirculationModelPackage where
  primitiveEquations : Prop
  parameterizations : Prop
  numericalDiscretization : Prop
  boundaryLayerPhysics : Prop
  radiativeTransfer : Prop

structure GeneralCirculationModelEvidence (G : GeneralCirculationModelPackage) where
  primitiveEquationsClosed : G.primitiveEquations
  parameterizationsClosed : G.parameterizations
  numericalDiscretizationClosed : G.numericalDiscretization
  boundaryLayerPhysicsClosed : G.boundaryLayerPhysics
  radiativeTransferClosed : G.radiativeTransfer

def GeneralCirculationModelClosed (G : GeneralCirculationModelPackage) : Prop :=
  G.primitiveEquations ∧ G.parameterizations ∧
  G.numericalDiscretization ∧ G.boundaryLayerPhysics ∧ G.radiativeTransfer

theorem general_circulation_model_closed_from_evidence
    (G : GeneralCirculationModelPackage) (E : GeneralCirculationModelEvidence G) :
    GeneralCirculationModelClosed G := by
  exact And.intro E.primitiveEquationsClosed
    (And.intro E.parameterizationsClosed
      (And.intro E.numericalDiscretizationClosed
        (And.intro E.boundaryLayerPhysicsClosed E.radiativeTransferClosed)))

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse