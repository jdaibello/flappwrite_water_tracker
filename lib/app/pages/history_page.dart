import 'package:flappwrite_water_tracker/app/model/water_intake.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var intakes = <WaterIntake>[];
  int todaysIntake = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMEd().format(
            DateTime.now(),
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                ...intakes.map(
                  (intake) {
                    return ListTile(
                      title: Text("${intake.amount} ml"),
                      subtitle: Text(
                        "${DateFormat.yMMMMd().format(intake.date)} ${DateFormat.jm().format(intake.date)}",
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {},
                      ),
                    );
                  },
                )
              ],
            ),
    );
  }
}
