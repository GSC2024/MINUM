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
  if (turbidity == 1) {
    return 100;
  } else if (turbidity >= 2 && turbidity <= 5) {
    return 80;
  } else if (turbidity > 5) {
    return 0;
  } else {
    return -1; 
}
}

double calculateOverallFormula(double pH, double tds, double turbidity) {
  double phPercent = calculatePHPercentage(pH);
  double tdsPercent = calculateTDSPercentage(tds);
  double turbidityPercent = calculateTurbidityPercentage(turbidity);

  return (phPercent + tdsPercent + turbidityPercent) / 300;
}
