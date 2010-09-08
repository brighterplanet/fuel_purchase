require 'data_miner'

module BrighterPlanet
  module FuelPurchase
    module Data
      def self.included(base)
        base.data_miner do
          schema do
            string 'fuel_type_id'
            float  'volume'
            string 'volume_units'
            float  'cost'
            string 'cost_units'
            float  'price'
            string 'price_units'
            string 'zip_code_id'
            string 'state_id'
            string 'petroleum_administration_for_defense_district_id'
            date   'date'
          end
          
          process "Pull orphans" do
            FuelPrice.run_data_miner!
          end
          
          process :run_data_miner_on_belongs_to_associations
        end
      end
    end
  end
end
