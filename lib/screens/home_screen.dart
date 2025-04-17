import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import '../providers/zodiak_provider.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  DateTime? _tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Awal")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/foto.jpg'), // tambahkan foto ke assets
            ),
            SizedBox(height: 16),
            Text("Nama: John Doe", style: TextStyle(fontSize: 18)),
            Text("NIM: 1234567890", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            TextField(controller: _namaController, decoration: InputDecoration(labelText: "Nama")),
            TextField(controller: _nimController, decoration: InputDecoration(labelText: "NIM")),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Pilih Tanggal Lahir"),
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1970),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    _tanggalLahir = picked;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Ramal"),
              onPressed: () {
                if (_tanggalLahir != null) {
                  final user = UserData(
                    nama: _namaController.text,
                    nim: _nimController.text,
                    tanggalLahir: _tanggalLahir!,
                  );
                  Provider.of<ZodiakProvider>(context, listen: false).setUser(user);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
