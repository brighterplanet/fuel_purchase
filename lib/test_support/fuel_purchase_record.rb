require 'fuel_purchase'

class FuelPurchaseRecord < ActiveRecord::Base
  include Sniff::Emitter
  include ::BrighterPlanet::FuelPurchase
  
  belongs_to :fuel_type
  belongs_to :zip_code
  belongs_to :state
  belongs_to :petroleum_administration_for_defense_district
end
