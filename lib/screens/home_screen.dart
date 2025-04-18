// file: lib/screens/home_screen.dart
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
  DateTime? _tanggalLahir;

  String formatTanggal(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ramalan Zodiak")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar dan identitas pembuat
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/saya.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              "Nama: Gaby Febrianti Sirait",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "NIM: 2310501073",
              style: TextStyle(fontSize: 16),
            ),

            Divider(height: 40),

            // Inputan Nama
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: "Masukkan Nama",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Tombol pilih tanggal lahir
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                setState(() {
                  _tanggalLahir = pickedDate;
                });
              },
              child: Text("Pilih Tanggal Lahir"),
            ),

            // Tampilkan tanggal lahir jika sudah dipilih
            if (_tanggalLahir != null) ...[
              SizedBox(height: 10),
              Text(
                "📅 Tanggal Lahir: ${formatTanggal(_tanggalLahir!)}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],

            SizedBox(height: 30),

            // Tombol Ramalkan
            ElevatedButton(
              onPressed: () {
                if (_tanggalLahir != null) {
                  final user = UserData(
                    nama: _namaController.text,
                    nim: "", // nim tidak digunakan
                    tanggalLahir: _tanggalLahir!,
                  );
                  Provider.of<ZodiakProvider>(context, listen: false)
                      .setUser(user);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Silakan pilih tanggal lahir!")),
                  );
                }
              },
              child: Text("Ramalkan"),
            ),
          ],
        ),
      ),
    );
  }
}
