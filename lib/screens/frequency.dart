import 'package:flutter/material.dart';

class CropFrequency {
  static Map<String, int> cropFrequencyMap = {};

  // Method to increment the frequency of a crop
  static void incrementCropFrequency(String cropName) {
    if (cropFrequencyMap.containsKey(cropName)) {
      cropFrequencyMap[cropName] = cropFrequencyMap[cropName]! + 1;
    } else {
      cropFrequencyMap[cropName] = 1;
    }
  }

  // Method to get the frequency of a crop
  static int getCropFrequency(String cropName) {
    return cropFrequencyMap[cropName] ?? 0; // Return 0 if crop isn't found
  }
}

// frequency.dart
Map<String, int> cropFrequency = {};

void addCropToFrequency(String cropName) {
  // Check if the crop already exists in the map
  if (cropFrequency.containsKey(cropName)) {
    cropFrequency[cropName] = cropFrequency[cropName]! + 1; // Increment frequency
  } else {
    cropFrequency[cropName] = 1; // Initialize frequency if it doesn't exist
  }
}

class FrequencyScreen extends StatefulWidget {
  @override
  _FrequencyScreenState createState() => _FrequencyScreenState();
}

class _FrequencyScreenState extends State<FrequencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E2723), // Dark brown background
      appBar: AppBar(
        title: Text(
          'Crop Frequency',
          style: TextStyle(color: Colors.white), // White text for the app bar
        ),
        backgroundColor: Color(0xFF6D4C41), // Light brown app bar background
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cropFrequency.length,
          itemBuilder: (context, index) {
            String cropName = cropFrequency.keys.elementAt(index);
            int frequency = cropFrequency[cropName]!;

            return Card(
              color: Color(0xFF202225), // Dark card background
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                title: Text(
                  cropName,
                  style: TextStyle(
                    color: Colors.white, // White text for crop name
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0, // Slightly larger font
                  ),
                ),
                trailing: Text(
                  '$frequency times',
                  style: TextStyle(
                    color: Colors.grey[400], // Light grey for the frequency count
                    fontSize: 14.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
