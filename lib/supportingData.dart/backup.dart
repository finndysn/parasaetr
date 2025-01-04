// class CropStat {
//   static Map<String, Map<String, String>> cropStats = {
//     "Rice": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "High (flooded fields)",
//       "growth_period": "90-150 days",
//       "yield": "Varies",
//       "companion_plants": "Azolla & Water spinach",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Maize": {
//       "germination_rate": "7-10 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "60-100 days",
//       "yield": "Varies",
//       "companion_plants": "Beans & Cucumber",
//       "wind_tolerance": "Moderate",
//       "max_height": "6-10 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Jute": {
//       "germination_rate": "10-20 days",
//       "sunlight_required": "Full sun",
//       "water_required": "High",
//       "growth_period": "90-120 days",
//       "yield": "Varies",
//       "companion_plants": "Okra & Sunflower",
//       "wind_tolerance": "Moderate",
//       "max_height": "8-12 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy soil"
//     },
//     "Cotton": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "120-180 days",
//       "yield": "Varies",
//       "companion_plants": "Bean & Marigold",
//       "wind_tolerance": "Moderate",
//       "max_height": "3-6 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Coconut": {
//       "germination_rate": "2-3 months",
//       "sunlight_required": "Full sun",
//       "water_required": "High",
//       "growth_period": "5-10 years",
//       "yield": "100-200 coconuts/tree",
//       "companion_plants": "Banana & Pineapple",
//       "wind_tolerance": "High",
//       "max_height": "30-100 feet",
//       "propagation": "Seedlings",
//       "soil_type": "Well-drained sandy soil"
//     },
//     "Papaya": {
//       "germination_rate": "10-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "High",
//       "growth_period": "180-330 days",
//       "yield": "Varies",
//       "companion_plants": "Basil & Nasturtium",
//       "wind_tolerance": "Low",
//       "max_height": "10-12 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Orange": {
//       "germination_rate": "10-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "365-730 days",
//       "yield": "Varies",
//       "companion_plants": "Chives & Marigold",
//       "wind_tolerance": "Moderate",
//       "max_height": "10-20 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Apple": {
//       "germination_rate": "14-30 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "365-1825 days",
//       "yield": "Varies",
//       "companion_plants": "Chamomile & Dill",
//       "wind_tolerance": "Moderate",
//       "max_height": "10-30 feet",
//       "propagation": "Grafted trees",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Muskmelon": {
//       "germination_rate": "4-10 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "75-100 days",
//       "yield": "Varies",
//       "companion_plants": "Corn & Nasturtium",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Watermelon": {
//       "germination_rate": "4-10 days",
//       "sunlight_required": "Full sun",
//       "water_required": "High",
//       "growth_period": "70-100 days",
//       "yield": "Varies",
//       "companion_plants": "Radish & Marigold",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Grapes": {
//       "germination_rate": "10-20 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "365-730 days",
//       "yield": "Varies",
//       "companion_plants": "Rosemary & Tansy",
//       "wind_tolerance": "Moderate",
//       "max_height": "Varies",
//       "propagation": "Cuttings",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Mango": {
//       "germination_rate": "10-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "180-365 days",
//       "yield": "Varies",
//       "companion_plants": "Basil & Marigold",
//       "wind_tolerance": "Moderate",
//       "max_height": "30-100 feet",
//       "propagation": "Grafted trees",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Banana": {
//       "germination_rate": "10-20 days",
//       "sunlight_required": "Full sun",
//       "water_required": "High",
//       "growth_period": "365-730 days",
//       "yield": "Varies",
//       "companion_plants": "Beans & Cabbage",
//       "wind_tolerance": "Low",
//       "max_height": "6-25 feet",
//       "propagation": "Rhizomes",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Pomegranate": {
//       "germination_rate": "14-30 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "365-730 days",
//       "yield": "Varies",
//       "companion_plants": "Basil & Marigold",
//       "wind_tolerance": "Moderate",
//       "max_height": "10-20 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Lentil": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Low to moderate",
//       "growth_period": "90-120 days",
//       "yield": "Varies",
//       "companion_plants": "Carrot & Chickpea",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Blackgram": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "90-120 days",
//       "yield": "Varies",
//       "companion_plants": "Sesame & Mungbean",
//       "wind_tolerance": "Moderate",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Mungbean": {
//       "germination_rate": "4-7 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "60-90 days",
//       "yield": "Varies",
//       "companion_plants": "Maize & Cucumber",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Mothbeans": {
//       "germination_rate": "4-7 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "60-90 days",
//       "yield": "Varies",
//       "companion_plants": "Cucumber & Radish",
//       "wind_tolerance": "Low",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained sandy loam"
//     },
//     "Pigeonpeas": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "180-365 days",
//       "yield": "Varies",
//       "companion_plants": "Maize & Sorghum",
//       "wind_tolerance": "Moderate",
//       "max_height": "6-10 feet",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Kidneybeans": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "90-150 days",
//       "yield": "Varies",
//       "companion_plants": "Corn & Potato",
//       "wind_tolerance": "Moderate",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Chickpea": {
//       "germination_rate": "7-14 days",
//       "sunlight_required": "Full sun",
//       "water_required": "Moderate",
//       "growth_period": "90-120 days",
//       "yield": "Varies",
//       "companion_plants": "Tomato & Cilantro",
//       "wind_tolerance": "Moderate",
//       "max_height": "Varies",
//       "propagation": "Seeds",
//       "soil_type": "Well-drained loamy soil"
//     },
//     "Coffee": {
//       "germination_rate": "30-60 days",
//       "sunlight_required": "Partial shade",
//       "water_required": "Moderate",
//       "growth_period": "365-730 days",
//       "yield": "Varies",
//       "companion_plants": "Nasturtium & Lemon balm",
//       "wind_tolerance": "Low",
//       "max_height": "3-8 feet",
//       "propagation": "Seeds or cuttings",
//       "soil_type": "Well-drained loamy soil"
//     },
//   };
// }

import 'package:agrisense/screens/faq.dart';
import 'package:flutter/material.dart';

class HomeScreenBody1 extends StatefulWidget {
  HomeScreenBody1({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody1> createState() => _HomeScreenBody1State();
}

class _HomeScreenBody1State extends State<HomeScreenBody1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container for Predicted Crop Frequencies
              buildCard(
                backgroundColor: Color(0xFF1DB954),
                content: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF1DB954),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Color(0xFF1DB954),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Explanation of Predicted Crop Frequencies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Provide a brief explanation of the pie chart and how it represents predicted crop frequencies.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // Container for Recent Prediction
              buildCard(
                backgroundColor: Color(0xFF1DB954),
                content: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF1DB954),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Color(0xFF1DB954),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Explanation of Recent Prediction',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Provide a brief explanation of the recent prediction, possibly with details or insights.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // Container for Frequently Asked Questions
              buildCard(
                backgroundColor: Color(0xFF1DB954),
                content: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF1DB954),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Color(0xFF1DB954),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Frequently Asked Question:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'What are the ideal conditions for crop growth?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required Color backgroundColor,
    required List<Widget> content,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
