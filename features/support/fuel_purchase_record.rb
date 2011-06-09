require 'fuel_purchase'

class FuelPurchaseRecord < ActiveRecord::Base
  include Sniff::Emitter
  include ::BrighterPlanet::FuelPurchase
end
