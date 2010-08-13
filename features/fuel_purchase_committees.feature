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

  Scenario Outline: Petroleum Administration for Defense District comittee
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

  Scenario Outline: Volume comittee
    Given a fuel purchase emitter
    And a characteristic "cost" of "<cost>"
    And a characteristic "price" of "<price>"
    When the "volume" committee is calculated
    Then the volume committee should be close to <volume>, +/-1
    Examples:
      | cost | price | volume |
      |  3.0 |   4.0 |   12.0 |
