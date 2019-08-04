class CryptoModel {
  List<CryptoData> data;

  CryptoModel({this.data});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CryptoData>();
      json['data'].forEach((v) {
        data.add(new CryptoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CryptoData {
  String currency;
  String id;
  String price;
  String priceDate;
  String symbol;
  String circulatingSupply;
  String maxSupply;
  String name;
  String logoUrl;
  String marketCap;
  String rank;
  String high;
  String highTimestamp;
  Md md;

  CryptoData(
      {this.currency,
      this.id,
      this.price,
      this.priceDate,
      this.symbol,
      this.circulatingSupply,
      this.maxSupply,
      this.name,
      this.logoUrl,
      this.marketCap,
      this.rank,
      this.high,
      this.highTimestamp,
      this.md});

  CryptoData.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    id = json['id'];
    price = json['price'];
    priceDate = json['price_date'];
    symbol = json['symbol'];
    circulatingSupply = json['circulating_supply'];
    maxSupply = json['max_supply'];
    name = json['name'];
    logoUrl = json['logo_url'];
    marketCap = json['market_cap'];
    rank = json['rank'];
    high = json['high'];
    highTimestamp = json['high_timestamp'];
    md = json['1d'] != null ? new Md.fromJson(json['1d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['id'] = this.id;
    data['price'] = this.price;
    data['price_date'] = this.priceDate;
    data['symbol'] = this.symbol;
    data['circulating_supply'] = this.circulatingSupply;
    data['max_supply'] = this.maxSupply;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['market_cap'] = this.marketCap;
    data['rank'] = this.rank;
    data['high'] = this.high;
    data['high_timestamp'] = this.highTimestamp;
    if (this.md != null) {
      data['1d'] = this.md.toJson();
    }
    return data;
  }
}

class Md {
  String priceChange;
  String priceChangePct;
  String volume;
  String volumeChange;
  String volumeChangePct;
  String marketCapChange;
  String marketCapChangePct;

  Md(
      {this.priceChange,
      this.priceChangePct,
      this.volume,
      this.volumeChange,
      this.volumeChangePct,
      this.marketCapChange,
      this.marketCapChangePct});

  Md.fromJson(Map<String, dynamic> json) {
    priceChange = json['price_change'];
    priceChangePct = json['price_change_pct'];
    volume = json['volume'];
    volumeChange = json['volume_change'];
    volumeChangePct = json['volume_change_pct'];
    marketCapChange = json['market_cap_change'];
    marketCapChangePct = json['market_cap_change_pct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_change'] = this.priceChange;
    data['price_change_pct'] = this.priceChangePct;
    data['volume'] = this.volume;
    data['volume_change'] = this.volumeChange;
    data['volume_change_pct'] = this.volumeChangePct;
    data['market_cap_change'] = this.marketCapChange;
    data['market_cap_change_pct'] = this.marketCapChangePct;
    return data;
  }
}
