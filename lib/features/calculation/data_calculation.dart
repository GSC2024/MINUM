double calculatePHPercentage(double pH) {
  if (pH <= 7) {
    return (pH / 7) * 100;
  } else {
    return ((14 - pH) / 7) * 100;
  }
}

double calculateTDSPercentage(double tds) {
  if (tds >= 0 && tds <= 50) {
    return 100;
  } else if (tds >= 51 && tds <= 100) {
    return 80;
  } else if (tds >= 101 && tds <= 200) {
    return 40;
  } else if (tds >= 201 && tds <= 250) {
    return 0;
  } else {
    return -1;
  }
}

double calculateTurbidityPercentage(double turbidity) {
  if (turbidity <= 10) {
    return 100;
  } else if (turbidity <= 30) {
    return 80;
  } else if (turbidity <= 90) {
    return 40;
  } else if (turbidity > 90) {
    return 0;
  } else {
    return -1;
  }
}

double calculateORPPercentage(double orp) {
  // Define ORP ranges and percentage mapping
  if (orp >= 300 && orp <= 500) {
    return 100; // Ideal ORP range
  } else if (orp >= 100 && orp < 200) {
    return 80; // Good ORP range
  } else if (orp >= 0 && orp < 100) {
    return 40; // Poor ORP range
  } else if (orp < 0 || orp > 500) {
    return 0; // Out of acceptable ORP range
  } else {
    return -1; // Invalid ORP value
  }
}

double calculateOverallFormula(
    double pH, double tds, double turbidity, double orp) {
  double phPercent = calculatePHPercentage(pH);
  double tdsPercent = calculateTDSPercentage(tds);
  double turbidityPercent = calculateTurbidityPercentage(turbidity);
  double orpPercent = calculateORPPercentage(orp);

  // Compute overall formula as the average of percentages
  return (phPercent + tdsPercent + turbidityPercent + orpPercent) / 400;
}
