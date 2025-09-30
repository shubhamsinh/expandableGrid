import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const GiridviewTask(),
    );
  }
}

class GiridviewTask extends StatefulWidget {
  const GiridviewTask({super.key});

  @override
  State<GiridviewTask> createState() => _GiridviewTaskState();
}

class _GiridviewTaskState extends State<GiridviewTask> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;
    int totalItem = 11;

    return Scaffold(
      appBar: AppBar(title: const Text("Expandable list")),
      body: ListView.builder(
        itemCount: (totalItem / columnCount).ceil(),
        itemBuilder: (context, rowIndex) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(columnCount, (colIndex) {
              int index = rowIndex * columnCount + colIndex;
              if (index >= totalItem) {
                return const Expanded(child: SizedBox());
              }
              bool isExpanded = expandedIndex == index;
              return Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(6),
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                "assets/rr.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Item $index",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Expanded view
                    if (isExpanded)
                      Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Expanded view of item $index",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
