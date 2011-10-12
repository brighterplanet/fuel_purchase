require 'fuel_purchase'

class FuelPurchaseRecord < ActiveRecord::Base
  include BrighterPlanet::Emitter
  include ::BrighterPlanet::FuelPurchase
end
