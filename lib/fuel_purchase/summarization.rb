require 'summary_judgement'

module BrighterPlanet
  module FuelPurchase
    module Summarization
      def self.included(base)
        base.extend SummaryJudgement
        #TODO?
      end
    end
  end
end
