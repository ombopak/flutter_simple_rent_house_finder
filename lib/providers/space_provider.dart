import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:bwacozy_dewveloper/models/models.dart';


class SpaceProvider extends ChangeNotifier {

  getRecommendedSpaces() async {

    var result = await http.get('');

    print(result.statusCode);

    if(result.statusCode == 200){
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }

  }

}