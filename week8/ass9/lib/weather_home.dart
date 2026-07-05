import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'secrets.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _cityController = TextEditingController();
  String _temp = "";
  String _desc = "Enter a city to get weather";
  bool _isLoading = false;

  Future<void> getWeather(String city) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$openWeatherApiKey&units=metric',
    );
    setState(() => _isLoading = true);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _temp = data['main']['temp'].toString();
          _desc = data['weather'][0]['description'];
        });
      } else {
        setState(() => _temp = "");
        setState(() => _desc = "City not found.");
      }
    } catch (error) {
      setState(() => _desc = "Error connecting to server");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Finder")),
      body: Padding(
        padding: const EdgeInsets.all(20), 
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: "Enter City Name",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => getWeather(_cityController.text), 
              child: const Text("Get Weather"),
            ),
            const SizedBox(height: 40,),
            _isLoading 
            ? const CircularProgressIndicator()
            : Column(
              children: [
                if (_temp.isNotEmpty) 
                  Text("$_temp °C", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                Text(_desc.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.grey),)
              ],
            )
          ],
        ),),
    );
  }
}
