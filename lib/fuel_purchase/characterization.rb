module BrighterPlanet
  module FuelPurchase
    module Characterization
      def self.included(base)
        base.characterize do
          has :fuel_type
          has :volume#, :measures => :volume (currently cubic feet or fixme??)
          has :cost, :measures => Measurement::Cost
          has :price
          has :emission_factor
          has :zip_code
          has :state
          has :petroleum_administration_for_defense_district
          has :date
        end
      end
    end
  end
end
