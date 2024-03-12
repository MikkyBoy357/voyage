import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voyage/constants/api_url.dart';

import '../../models/destination_model.dart';

class DestinationProvider extends ChangeNotifier {
  List<DestinationModel> destinations = [];

  Future<void> fetchDestinations(String token) async {
    try {
      final url = Uri.parse('$baseUrl/destinations/');
      final response = await http.get(
        url,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        log('Destination ====> $data');
        destinations =
            data.map((item) => DestinationModel.fromJson(item)).toList();

        // for (var item in data) {
        //   destinations.add(
        //     DestinationModel.fromJson(item),
        //   );
        // }
        log('Checking ===> $destinations');
        // notifyListeners();
      } else {
        log('Failed to load destinations');
      }
    } catch (error) {
      log('Error Loading destinations $error');
    }
  }
}
