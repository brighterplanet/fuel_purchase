Feature: Fuel Purchase Emissions Calculations
  The fuel purchase model should generate correct emission calculations

  Scenario Outline: Standard Calculations for fuel purchase classes
    Given a fuel purchase has "zip_code.name" of "<zip_code>"
    And it has "fuel_type.name" of "<fuel_type>"
    When emissions are calculated
    Then the emission value should be within 0.1 kgs of <emission>
    Examples:
      | zip_code | fuel_type                   | emission |
      |    48915 | Conventional Motor Gasoline |     1234 |
      |    22406 | Residential Natural Gas     |  11964.8 |
