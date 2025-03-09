import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;
  String category = "";
  Color categoryColor = Colors.grey;

  void calculatedBMI({required double weight, required double height}) {
    final double bmi = (weight * 10000) / (height * height);
    final result = determineCategory(bmi);

    setState(() {
      bmiResult = bmi;
      category = result["category"] as String;
      categoryColor = result["color"] as Color;
    });
  }

  void clearResult() {
    setState(() {
      bmiResult = 0.0;
      category = "";
      categoryColor = Colors.grey;
      heightController.clear();
      weightController.clear();
    });
  }

  Map<String, dynamic> determineCategory(double bmiResult) {
    if (bmiResult < 1) {
      return {"category": "", "color": Colors.grey};
    } else if (bmiResult < 18.5) {
      return {"category": "Berat Badan Kurang", "color": Colors.blue};
    } else if (bmiResult <= 24.9) {
      return {"category": "Berat Badan Normal", "color": Colors.green};
    } else if (bmiResult <= 29.9) {
      return {"category": "Berat Badan Berlebihan", "color": Colors.yellow};
    } else if (bmiResult <= 34.9) {
      return {"category": "Obesitas Tingkat I", "color": Colors.orange};
    } else if (bmiResult <= 39.9) {
      return {"category": "Obesitas Tingkat II", "color": Colors.red};
    } else {
      return {"category": "Obesitas Tingkat III", "color": Colors.purple};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Hitung Indeks Massa Tubuh (IMT)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(Icons.monitor_weight_outlined, size: 50),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Berat Badan (Kg)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.height, size: 50),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tinggi Badan (Cm)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (weightController.text.isNotEmpty &&
                      heightController.text.isNotEmpty) {
                    calculatedBMI(
                      weight: double.parse(weightController.text),
                      height: double.parse(heightController.text),
                    );
                  }
                },
                child: const Text("HITUNG"),
              ),
              const SizedBox(height: 20.0),
              bmiResult > 0.0
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: categoryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          const Text('Hasil:'),
                          const SizedBox(height: 10.0),
                          Text(
                            bmiResult.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20.0),
              bmiResult > 0.0
                  ? ElevatedButton(
                      onPressed: clearResult,
                      child: const Text("BERSIHKAN"),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
