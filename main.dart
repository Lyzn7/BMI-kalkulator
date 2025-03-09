import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI calculator",
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

  void calculatedBMI({required double weight, required double height}) {
    final double bmi = (weight * 10000) / (height * height);

    setState(() {
      bmiResult = bmi;
    });
  }

  void clearResult() {
    setState(() {
      bmiResult = 0.0;
      heightController.clear();
      weightController.clear();
    });
  }

  String determineCategory({required double bmiResult}) {
    if (bmiResult < 1) {
      return '';
    } else if (bmiResult < 18.5) {
      return 'Berat Badan Kurang';
    } else if (bmiResult <= 24.9) {
      return 'Berat Badan Normal';
    } else if (bmiResult <= 29.9) {
      return 'Berat Badan Berlebihan';
    } else if (bmiResult <= 34.9) {
      return 'Obesitas Tingkat I';
    } else if (bmiResult <= 39.9) {
      return 'Obesitas Tingkat II';
    } else {
      return 'Obesitas Tingkat III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Hitung Indeks Massa Tubuh (IMT)"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Berat Badan (Kg)',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tinggi Badan (Cm)',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                  child: const Text("HITUNG")),
              const SizedBox(
                height: 20.0,
              ),
              bmiResult > 0.0
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          const Text('Hasil:'),
                          const SizedBox(height: 10.0),
                          Text(
                            bmiResult.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 35.0),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20.0,
              ),
              bmiResult > 0.0
                  ? ElevatedButton(
                      onPressed: () {
                        clearResult();
                      },
                      child: const Text("BERSIHKAN"))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
