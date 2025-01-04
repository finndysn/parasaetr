import 'package:agrisense/main.dart';
import 'package:agrisense/screens/selectedItemInHistory.dart';
import 'package:agrisense/supportingData.dart/cropImages.dart';
import 'package:flutter/material.dart';

class Recommendation {
  final String date;
  final String location;
  final String recommendedCrop;
  final String cropImage;

  Recommendation({
    required this.date,
    required this.location,
    required this.recommendedCrop,
    required this.cropImage,
  });
}

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DataContainer dataContainer = DataContainer();
  final UserData userData = UserData();

  bool isDataAvailable() {
    if (userData.userID == 1) {
      if (dataContainer.data_list.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      if (dataContainer.data_list_new.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3e2723), // Dark brown background for the entire screen
      body: isDataAvailable()
          ? ListView.builder(
              itemCount: userData.userID == 1
                  ? dataContainer.data_list.length
                  : dataContainer.data_list_new.length,
              itemBuilder: (context, index) {
                if (userData.userID == 1) {
                  userData.indexOfSelectedItemHistory = index;
                  String entryCropImage = 'assets/images/' +
                      CropImages.cropsImages[
                              dataContainer.data_list[index].predictedResult]
                          .toString();
                  Recommendation entry = Recommendation(
                      date: dataContainer.data_list[index].dateTime,
                      location: dataContainer.data_list[index].location,
                      recommendedCrop:
                          dataContainer.data_list[index].predictedResult,
                      cropImage: entryCropImage);
                  return GestureDetector(
                    child: RecommendationCard(recommendation: entry),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectedItemInHistory(indexID: index),
                        ),
                      );
                    },
                  );
                } else {
                  String entryCropImage = 'assets/images/' +
                      CropImages.cropsImages[dataContainer
                              .data_list_new[index].predictedResult]
                          .toString();
                  Recommendation entry = Recommendation(
                      date: dataContainer.data_list_new[index].dateTime,
                      location: dataContainer.data_list_new[index].location,
                      recommendedCrop:
                          dataContainer.data_list_new[index].predictedResult,
                      cropImage: entryCropImage);
                  return RecommendationCard(recommendation: entry);
                }
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No data available',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for better contrast
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  final Recommendation recommendation;

  RecommendationCard({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF6d4c41), // Light brown card background
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(recommendation.cropImage),
              radius: 35,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${recommendation.date}",
                    style: TextStyle(
                      color: Colors.white, // White text for better contrast
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Location: ${recommendation.location}",
                    style: TextStyle(
                      color: Colors.white, // White text for better contrast
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    recommendation.recommendedCrop,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
