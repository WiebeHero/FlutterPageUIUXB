import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomCard{

  late final String _identifier;
  late final int _health, _damage;
  late int _amount;
  late final String _asset;
  late final Rarity _rarity;

  CustomCard(this._identifier, this._health, this._damage, this._amount, this._rarity, this._asset);

  int getHealth() => _health;

  int getDamage() => _damage;

  int getAmount() => _amount;

  int setAmount(int value) => _amount = value;

  String getAsset() => _asset;

  String getIdentifier() => _identifier;

  Rarity getRarity() => _rarity;
}

enum Rarity{
  common,
  rare,
  epic,
  legendary,
  heroic
}

extension ColorExtension on Rarity{
  String get name => describeEnum(this);
  Color get color  {
    switch(this){
      case Rarity.common:
        return Colors.grey;
      case Rarity.rare:
        return Colors.green;
      case Rarity.epic:
        return Colors.purple;
      case Rarity.legendary:
        return Colors.red;
      case Rarity.heroic:
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }
}