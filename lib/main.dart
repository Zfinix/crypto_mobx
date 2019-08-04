import 'package:crypto_mobx/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controllers/homeController.dart';
import 'models/cryptoModel.dart';
import 'utils/margin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = CryptoController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 240, 240, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Crypto',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_buildCard(), _buildList()],
        ),
      ),
    );
  }

  _buildCard() => Flexible(
        flex: 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(7.0)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.pink[300],
                Colors.pink[400],
                Colors.red[300],
                Colors.red[400],
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total Value',
                style: TextStyle(color: Colors.white),
              ),
              cYM(8),
              Text(
                '\$580.00',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 35),
              ),
            ],
          ),
        ),
      );

  _buildList() => Flexible(
        flex: 2,
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: _controller?.cryptoData?.length ?? 0,
            itemBuilder: (BuildContext context, int i) {
              return CryptoCard(cryptoData: _controller?.cryptoData[i]);
            },
          ),
        ),
      );

  _loadData() async {
    var load = await Api.getData(context);
    if (load != null) _controller.changeCryptoData(load.data);
  }
}

class CryptoCard extends StatelessWidget {
  final CryptoData cryptoData;
  const CryptoCard({
    Key key,
    @required this.cryptoData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(10)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: buildImage(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(cryptoData?.name ?? '',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    cYM(8),
                    Text(
                      cryptoData?.symbol ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 11),
                    ),
                  ],
                ),
              ),
              cXM(8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                        '\$${double.parse(cryptoData.price).toStringAsFixed(2)}',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    cYM(8),
                    Text(
                      'Rank: ${cryptoData?.rank ?? 'NaN'}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                  '\$${double?.parse(cryptoData?.md?.priceChange ?? '0.00').toStringAsFixed(2) ?? 0.00}',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              cYM(8),
              Text(
                '${double.parse(cryptoData.high).toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontSize: 11),
              ),
            ],
          ),
        ),
      ),
      key: Key(cryptoData.id),
    );
  }

  buildImage() => Card(
        child: cryptoData.logoUrl != null && cryptoData.logoUrl.contains('svg')
            ? CircleAvatar(
                maxRadius: 21.0,
                child: SvgPicture.network(cryptoData.logoUrl ?? ''),
                backgroundColor: Colors.white,
              )
            : CircleAvatar(
                maxRadius: 21.0,
                backgroundImage: NetworkImage(cryptoData?.logoUrl ??
                    'https://i.pinimg.com/originals/1f/7d/ec/1f7dec824ddfabb03b890b08d6c3e548.png'),
                backgroundColor: Colors.white,
              ),
        elevation: 3.0,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
      );
}
