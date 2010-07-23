module BrighterPlanet
  module FuelPurchase
    extend self

    def included(base)
      require 'cohort_scope'
      require 'falls_back_on'
      require 'falls_back_on/active_record_ext'

      require 'fuel_purchase/carbon_model'
      require 'fuel_purchase/characterization'
      require 'fuel_purchase/data'
      require 'fuel_purchase/summarization'

      base.send :include, BrighterPlanet::FuelPurchase::CarbonModel
      base.send :include, BrighterPlanet::FuelPurchase::Characterization
      base.send :include, BrighterPlanet::FuelPurchase::Data
      base.send :include, BrighterPlanet::FuelPurchase::Summarization
    end
    def fuel_purchase_model
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
