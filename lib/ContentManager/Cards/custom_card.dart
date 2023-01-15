class CustomCard{

  late final int _amount, _health, _damage;
  late final String _asset;

  CustomCard(this._health, this._damage, this._amount, this._asset);

  int getHealth() => _health;

  int getDamage() => _damage;

  int getAmount() => _amount;

  String getAsset() => _asset;
}