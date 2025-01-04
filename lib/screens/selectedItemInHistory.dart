import 'package:flutter/material.dart';
import 'package:agrisense/main.dart';
import 'package:agrisense/models/featuresResultModel.dart';
import 'package:agrisense/supportingData.dart/cropGeneralDescription.dart';
import 'package:agrisense/supportingData.dart/cropImages.dart';
import 'package:agrisense/supportingData.dart/cropStat.dart';
import 'package:agrisense/supportingData.dart/genus.dart';

class SelectedItemInHistory extends StatefulWidget {
  SelectedItemInHistory({required this.indexID});
  int indexID;

  @override
  State<SelectedItemInHistory> createState() => _SelectedItemInHistoryState();
}

class _SelectedItemInHistoryState extends State<SelectedItemInHistory> {
  final PredictedResult predictedResult = PredictedResult();
  final UserData userData = UserData();
  final DataContainer dataContainer = DataContainer();
  List<List<String>> cropStatList = [];

  @override
  Widget build(BuildContext context) {
    FeaturesResultModel selectedItemViaUserID = userData.userID == 1
        ? dataContainer.data_list[widget.indexID]
        : dataContainer.data_list_new[widget.indexID];

    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFF2F3136), // Discord-like dark background
            title: Center(
              child: Column(
                children: [
                  Text(
                    predictedResult.recommendedCrop,
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Image.asset(
                    'assets/images/${CropImages.cropsImages[selectedItemViaUserID.predictedResult]}',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            content: Text(
              '${selectedItemViaUserID.predictedResult} is the most suitable crop to grow.',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F3136), // Dark Discord-like color
        title: Text(
          'Recommendation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                        'assets/images/${CropImages.cropsImages[selectedItemViaUserID.predictedResult].toString()}'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedItemViaUserID.predictedResult,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Discord-like white text
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        GenusDataClass.cropGenusMap[selectedItemViaUserID.predictedResult].toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400], // Lighter grey for subtitle
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Certainty level',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'N/A', // Subtitle for Certainty Level
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              CropGeneralDescription.cropsGeneralDescriptions[selectedItemViaUserID.predictedResult].toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // White text for description
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    loadCropStatList(selectedItemViaUserID);

                    return Card(
                      color: Color(0xFF202225), // Dark background for cards
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        title: Text(
                          cropStatList[index][0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white, // White text for title
                          ),
                        ),
                        trailing: Text(
                          cropStatList[index][1],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[400], // Light grey for trailing
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF3e2723), // Dark background for the whole screen
    );
  }

  void loadCropStatList(FeaturesResultModel selectedItemViaUserID) {
    CropStat.cropStats[selectedItemViaUserID.predictedResult]!
        .forEach((key, value) {
      cropStatList.add([key, value]);
    });
  }
}
