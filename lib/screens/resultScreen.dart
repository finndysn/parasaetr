import 'package:agrisense/main.dart';
import 'package:agrisense/models/featuresResultModel.dart';
import 'package:agrisense/screens/homepage.dart';
import 'package:agrisense/supportingData.dart/cropGeneralDescription.dart';
import 'package:agrisense/supportingData.dart/cropImages.dart';
import 'package:agrisense/supportingData.dart/cropStat.dart';
import 'package:agrisense/supportingData.dart/genus.dart';
import 'package:flutter/material.dart';
import 'package:agrisense/screens/frequency.dart';



class ResultScreen extends StatefulWidget {
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final PredictedResult predictedResult = PredictedResult();
  List<List<String>> cropStatList = [];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[800], // Dark brown background
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
                    'assets/images/${CropImages.cropsImages[predictedResult.recommendedCrop].toString()}',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            content: Text(
              '${predictedResult.recommendedCrop} is the most suitable crop to grow.',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK', style: TextStyle(color: Colors.orangeAccent)),
              ),
            ],
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3e2723), // Deep brown background
        title: Text(
          'Crop Recommendation',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff8e735b), // Muted brown button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            label: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              if (insertToList()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.brown[800],
                      title: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Success!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      content: Text(
                        'Data saved successfully.',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.brown[800],
                      title: Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Failed!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      content: Text(
                        'Failed to save data. Please try again.',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/images/${CropImages.cropsImages[predictedResult.recommendedCrop].toString()}',
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        predictedResult.recommendedCrop,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        GenusDataClass.cropGenusMap[predictedResult.recommendedCrop].toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
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
                        'N/A',
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
            Text(
              CropGeneralDescription.cropsGeneralDescriptions[predictedResult.recommendedCrop].toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
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
                    loadCropStatList();

                    return Card(
                      color: Color(0xff5c4033), // Medium brown card background
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          cropStatList[index][0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          cropStatList[index][1],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
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
    );
  }

  bool insertToList() {
  final UserData userData = UserData();
  final DataContainer dataContainer = DataContainer();

  try {
    if (userData.userID == 1) {
      setState(() {
        FeaturesResultModel newEntry = FeaturesResultModel(
            predictedResult.nitrogen,
            predictedResult.phosphorus,
            predictedResult.potassium,
            predictedResult.temperature,
            predictedResult.humidity,
            predictedResult.pH,
            predictedResult.rainfall,
            predictedResult.location,
            predictedResult.dateTime,
            predictedResult.recommendedCrop,
            predictedResult.certaintyLevel,
            predictedResult.season);
        dataContainer.data_list.insert(0, newEntry);

        // Add frequency tracking here
        CropFrequency.incrementCropFrequency(predictedResult.recommendedCrop);
      });
    } else {
      setState(() {
        FeaturesResultModel newEntryNew = FeaturesResultModel(
            predictedResult.nitrogen,
            predictedResult.phosphorus,
            predictedResult.potassium,
            predictedResult.temperature,
            predictedResult.humidity,
            predictedResult.pH,
            predictedResult.rainfall,
            predictedResult.location,
            predictedResult.dateTime,
            predictedResult.recommendedCrop,
            predictedResult.certaintyLevel,
            predictedResult.season);
        dataContainer.data_list_new.insert(0, newEntryNew);

        // Add frequency tracking here
        CropFrequency.incrementCropFrequency(predictedResult.recommendedCrop);
      });
    }

    // Navigate to FrequencyScreen after adding the crop
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FrequencyScreen(),
      ),
    );

    return true;
  } catch (e) {
    return false;
  }
}


  void loadCropStatList() {
    CropStat.cropStats[predictedResult.recommendedCrop]!.forEach((key, value) {
      cropStatList.add([key, value]);
    });
  }
}
