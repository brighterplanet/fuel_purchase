require 'emitter'

module BrighterPlanet
  module FuelPurchase
    extend BrighterPlanet::Emitter

    def self.fuel_purchase_model
      if Object.const_defined? 'FuelPurchase'
        ::FuelPurchase
      elsif Object.const_defined? 'FuelPurchaseRecord'
        FuelPurchaseRecord
      else
        raise 'There is no fuel_purchase model'
      end
    end
  end
end
