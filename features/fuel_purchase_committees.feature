Feature: Fuel Purchase Committee Calculations
  The fuel purchase model should generate correct committee calculations

  Background:
    Given a fuel_purchase

  Scenario Outline: State comittee
    Given a characteristic "zip_code.name" of "<zip>"
    When the "state" committee reports
    Then the conclusion of the committee should have "postal_abbreviation" of "<state>"
    Examples:
      |  zip  | state |
      | 48915 |    MI |
      | 20191 |    VA |

  Scenario Outline: Petroleum Administration for Defense District committee from state
    Given a characteristic "zip_code.name" of "<zip>"
    When the "state" committee reports
    And the "petroleum_administration_for_defense_district" committee reports
    Then the conclusion of the committee should have "district_name" of "<district>"
    And the conclusion of the committee should have "subdistrict_name" of "<subdistrict>"
    Examples:
      |  zip  | district   | subdistrict    |
      | 48915 | Midwest    |                |
      | 20191 | East Coast | Lower Atlantic |

  Scenario Outline: Price committee from fuel type
    Given a characteristic "fuel_type.name" of "<fuel_type>"
    When the "price" committee reports
    Then the conclusion of the committee should be "<price>"
    Examples:
      | fuel_type                     | price  |
      | Industrial Coking Coal        | 0.1302 |
      | Residential Natural Gas       | 0.4227 |
      | Kerosene                      | 0.7059 |
      | Conventional Motor Gasoline   | 0.4922 |

  Scenario Outline: Volume comittee from cost and price
    Given a characteristic "cost" of "<cost>"
    And a characteristic "price" of "<price>"
    When the "volume" committee reports
    Then the committee should have used quorum "from cost and price"
    And the conclusion of the committee should be "<volume>"
    Examples:
      | cost | price | volume |
      | 12.0 |   3.0 |    4.0 |
      |  0.0 |   1.0 |    0.0 |

  Scenario Outline: Volume comittee from fuel type
    Given a characteristic "fuel_type.name" of "<fuel>"
    When the "volume" committee reports
    Then the committee should have used quorum "from fuel type"
    And the conclusion of the committee should be "<volume>"
    Examples:
      | fuel                    | volume   |
      | Residential Natural Gas |  6221.98 | 

  Scenario Outline: Volume comittee from default
    When the "volume" committee reports
    And the conclusion of the committee should be "<volume>"
    Examples:
      | volume |
      | 100    |

  Scenario Outline: Emission factor committee from fuel type
    Given a characteristic "fuel_type.name" of "<fuel_type>"
    When the "emission_factor" committee reports
    Then the committee should have used quorum "from fuel type"
    And the conclusion of the committee should be "<factor>"
    Examples:
      | fuel_type                   | factor |
      | Industrial Coking Coal      | 2.720  |
      | Residential Natural Gas     | 1.923  |
      | Kerosene                    | 2.681  |
      | Conventional Motor Gasoline | 2.358  |

  Scenario: Emission factor committee from default
    When the "emission_factor" committee reports
    Then the committee should have used quorum "default"
    And the conclusion of the committee should be "1.0"
