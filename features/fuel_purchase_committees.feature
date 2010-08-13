Feature: Fuel Purchase Committee Calculations
  The fuel purchase model should generate correct committee calculations

  Scenario Outline: State comittee
    Given a fuel purchase emitter
    And a characteristic "zip_code.name" of "<zip>"
    When the "state" committee is calculated
    Then the conclusion of the committee should have "postal_abbreviation" of "<state>"
    Examples:
      |  zip  | state |
      | 48915 |    MI |
      | 20191 |    VA |

  Scenario Outline: Petroleum Administration for Defense District comittee from state
    Given a fuel purchase emitter
    And a characteristic "zip_code.name" of "<zip>"
    When the "state" committee is calculated
    And the "petroleum_administration_for_defense_district" committee is calculated
    Then the conclusion of the committee should have "district_name" of "<district>"
    And the conclusion of the committee should have "subdistrict_name" of "<subdistrict>"
    Examples:
      |  zip  | district   | subdistrict    |
      | 48915 | Midwest    |                |
      | 20191 | East Coast | Lower Atlantic |

  Scenario Outline: Price committee from fuel type
    Given a fuel purchase emitter
    And a characteristic "fuel_type.name" of "<fuel_type>"
    When the "price" committee is calculated
    Then the conclusion of the committee should be "<price>"
    Examples:
      | fuel_type              | price  |
      | Industrial Coking Coal | 0.1302 |
      | Kerosene               | 0.7059 |

  Scenario Outline: Volume comittee
    Given a fuel purchase emitter
    And a characteristic "cost" of "<cost>"
    And a characteristic "price" of "<price>"
    When the "volume" committee is calculated
    Then the volume committee should be close to <volume>, +/-1
    Examples:
      | cost | price | volume |
      |  3.0 |   4.0 |   12.0 |

  Scenario Outline: Emission factor committee from fuel type
    Given a fuel purchase emitter
    And a characteristic "fuel_type.name" of "<fuel_type>"
    When the "emission_factor" committee is calculated
    Then the conclusion of the committee should be "<factor>"
    Examples:
      | fuel_type              | factor |
      | Industrial Coking Coal | 2.72   |
      | Kerosene               | 2.681  |

  Scenario: Emission factor committee from default
    Given a fuel purchase emitter
    When the "emission_factor" committee is calculated
    Then the conclusion of the committee should be "1.0"
