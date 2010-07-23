Feature: Fuel Purchase Committee Calculations
  The fuel purchase model should generate correct committee calculations

  Scenario Outline: Volume Comittee
    Given a fuel purchase has "cost" of "<cost>"
    And it has "price" of "<price>"
    When emissions are calculated
    Then the volume committee should be close to <volume>, +/-1
    Examples:
      | cost | price | volume |
      |  3.0 |   4.0 |   12.0 |
