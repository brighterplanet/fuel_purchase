require 'characterizable'

module BrighterPlanet
  module FuelPurchase
    module Characterization
      def self.included(base)
        base.send :include, Characterizable
        base.characterize do
          has :fuel_type
          has :volume
          has :cost
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
