require 'earth/fuel/fuel_type'
require 'earth/locality/petroleum_administration_for_defense_district'
require 'earth/locality/state'
require 'earth/locality/zip_code'

module BrighterPlanet
  module FuelPurchase
    module Relationships
      def self.included(target)
        target.belongs_to :fuel_type
        target.belongs_to :zip_code
        target.belongs_to :state
        target.belongs_to :petroleum_administration_for_defense_district
      end
    end
  end
end
