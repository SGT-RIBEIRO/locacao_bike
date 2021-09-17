import 'package:flutter/material.dart';
import 'package:locacao_bike/Models/bike.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bike => [..._bikes];

  int get total => _bikes.length;

  void addBike(Bike bike){
    _bikes.add(bike);
    notifyListeners();    
    
  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }


  verificaCart(Bike bike, Function addBike){

    String result = "ESSE ITEM JÁ ESTÁ NO SEU CARRINHO";
   
    if (!_bikes.contains(bike)) {
        addBike(bike);
        result = "ITEM ADICIONADO COM SUCESSO";


    }

    return result;

  }



}

