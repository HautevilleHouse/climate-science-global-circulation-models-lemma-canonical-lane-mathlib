import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean

structure OceanHeatTransportPackage where
  meridionalTransport : ℝ
  zonalTransport : ℝ
  verticalMixing : ℝ
  heatContent : ℝ
  boundaryFlux : ℝ
  transportDivergence : ℝ

structure OceanHeatTransportEvidence (O : OceanHeatTransportPackage) where
  meridionalPositive : O.meridionalTransport > 0
  zonalFinite : O.zonalTransport ≠ 0
  verticalMixingPositive : O.verticalMixing > 0
  heatContentPositive : O.heatContent > 0
  divergenceAccounted : O.transportDivergence = O.boundaryFlux

def OceanHeatTransportClosed (O : OceanHeatTransportPackage) : Prop :=
  O.meridionalTransport > 0 ∧ O.zonalTransport ≠ 0 ∧
  O.verticalMixing > 0 ∧ O.heatContent > 0 ∧
  O.transportDivergence = O.boundaryFlux

theorem ocean_heat_transport_closed_from_evidence (O : OceanHeatTransportPackage)
    (Ev : OceanHeatTransportEvidence O) : OceanHeatTransportClosed O := by
  rcases Ev with ⟨merid, zon, vert, heat, div⟩
  exact ⟨merid, zon, vert, heat, div⟩

end ClimateScienceGlobalCirculationModelsLemmaCanonicalLaneLean
end HautevilleHouse