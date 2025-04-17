import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/zodiak_provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ZodiakProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Hasil Ramalan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Zodiak: ${provider.zodiak}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text("Karakter Bulan: ${provider.bulanKarakter}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            Text("Ramalan:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(child: SingleChildScrollView(child: Text(provider.ramalan))),
          ],
        ),
      ),
    );
  }
}
