module BrighterPlanet
  module FuelPurchase
    module Data
      def self.included(base)
        base.col :fuel_type_id
        base.col :volume, :type => :float
        base.col :volume_units
        base.col :cost, :type => :float
        base.col :cost_units
        base.col :price, :type => :float
        base.col :price_units
        base.col :zip_code_id
        base.col :state_id
        base.col :petroleum_administration_for_defense_district_id
        base.col :date, :type => :date

        base.data_miner do
          process "Pull orphans" do
            FuelPrice.run_data_miner!
          end
        end
      end
    end
  end
end