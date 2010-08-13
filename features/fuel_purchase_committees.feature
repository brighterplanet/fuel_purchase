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

  Scenario Outline: Volume Comittee
    Given a fuel purchase emitter
    And a characteristic "cost" of "<cost>"
    And a characteristic "price" of "<price>"
    When the "volume" committee is calculated
    Then the volume committee should be close to <volume>, +/-1
    Examples:
      | cost | price | volume |
      |  3.0 |   4.0 |   12.0 |
