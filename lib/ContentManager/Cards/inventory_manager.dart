import 'dart:collection';

import 'package:project/ContentManager/Cards/custom_card.dart';

class InventoryManager{

  static List<CustomCard> cardsOwned = <CustomCard>[];

  static CustomCard getRandomCard(Rarity rarity){
    late CustomCard customCard;
    for(int i = 0; i < cardsOwned.length; i++){
      CustomCard targetCard = cardsOwned[i];
      if(targetCard.getRarity() == rarity){
        customCard = targetCard;
      }
    }
    return customCard;
  }
}