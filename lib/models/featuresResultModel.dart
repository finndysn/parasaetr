class FeaturesResultModel {
  FeaturesResultModel(
      this.nitrogen,
      this.phosphorus,
      this.potassium,
      this.temperature,
      this.humidity,
      this.pH,
      this.rainfall,
      this.location,
      this.dateTime,
      this.predictedResult,
      this.certaintyLevel,
      this.season);

  // int inputID;
  int userID = 1;
  double nitrogen;
  double phosphorus;
  double potassium;
  double rainfall;
  double temperature;
  double humidity;
  double pH;
  String location;
  String dateTime;
  String predictedResult;
  double certaintyLevel;
  String season;
}
