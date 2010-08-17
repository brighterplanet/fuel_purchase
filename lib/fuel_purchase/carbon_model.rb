require 'leap'

module BrighterPlanet
  module FuelPurchase
    module CarbonModel
      def self.included(base)
        base.extend ::Leap::Subject
        base.decide :emission, :with => :characteristics do
          committee :emission do
            quorum 'from volume and emission factor', :needs => [:volume, :emission_factor] do |characteristics|
              #     variable units                variable units          FIXME TODO should we make volumes energy contents to avoid unit mismatches?
              characteristics[:volume] * characteristics[:emission_factor]
            end
            
            quorum 'default' do
              raise "The fuel purchase's default emission quorum should never be called"
            end
          end
          
          committee :emission_factor do # FIXME TODO add date-based lookup once we have timeseries of emission factors
            quorum 'from fuel type', :needs => :fuel_type do |characteristics|
              characteristics[:fuel_type].emission_factor
            end
            
            quorum 'default' do
              ::FuelType.fallback.emission_factor
            end
          end
          
          committee :volume do
            quorum 'from cost and price', :needs => [:cost, :price] do |characteristics|
              #       dollars          dollars / variable unit          FIXME TODO should we make prices $ / kJ to avoid unit mismatches?
              characteristics[:cost] / characteristics[:price]
            end
            
            quorum 'from fuel type', :needs => :fuel_type do |characteristics|
              #      variable units
              characteristics[:fuel_type].average_purchase_volume
            end
            
            quorum 'default' do # FIXME TODO get rid of this if we ever make a fallback fuel_type
              #      variable units
              FuelType.fallback.average_purchase_volume
            end
          end
          
          committee :price do
            # FIXME TODO fill in location- and date-based quorums
            # quorum :from_fuel_type_and_state_and_date, :needs => [:fuel_type, :state, :date] do |characteristics, timeframe|
            # end
            # 
            # quorum :from_fuel_type_and_petroleum_administration_for_defense_district_and_date, :needs => [:fuel_type, :petroleum_administration_for_defense_district, :date] do |characteristics, timeframe|
            # end
            # 
            # quorum :from_fuel_type_and_state, :needs => [:fuel_type, :state] do |characteristics, timeframe|
            # end
            # 
            # quorum :from_fuel_type_and_petroleum_administration_for_defense_district, :needs => [:fuel_type, :petroleum_administration_for_defense_district] do |characteristics, timeframe|
            # end
            # 
            # quorum :from_fuel_type_and_date, :needs [:fuel_type, :date] do |characteristics, timeframe|
            # end
            quorum 'from fuel type', :needs => :fuel_type do |characteristics|
              #    dollars / variable unit
              characteristics[:fuel_type].price
            end
          end
          
          committee :petroleum_administration_for_defense_district do
            quorum 'from state', :needs => :state do |characteristics|
              characteristics[:state].petroleum_administration_for_defense_district
            end
          end
          
          committee :state do
            quorum 'from zip code', :needs => :zip_code do |characteristics|
              characteristics[:zip_code].state
            end
          end
          
          # FIXME TODO should this be only user-supplied, or should we specify a fallback?
          # committee :fuel_type do |characteristics, timeframe|
          #   FuelType.fallback.fuel_type
          # end
        end
      end
    end
  end
end
