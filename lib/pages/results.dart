import 'package:flutter/material.dart';
import 'package:imc_improved/utils/utils.dart';
import 'package:screenshot/screenshot.dart';

class Results extends StatefulWidget {
  final double imc;
  final String result;

  const Results({Key key, this.imc, this.result}) : super(key: key);
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("CALCULADORA DE IMC"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Seus Resultados",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
              Card(
                child: Container(
                  color: hexToColor("#1d1f33"),
                  // height: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          rank[widget.result][0].toString().toUpperCase(),
                          style: TextStyle(
                              color: rank[widget.result][1],
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                        child: Center(
                          child: Text(
                            "${widget.imc.toStringAsFixed(1)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 100,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Alcance para IMC ${rank[widget.result][0]}",
                                  style: TextStyle(
                                      color: DefaultColors.disabled,
                                      fontSize: 17),
                                ),
                              ),
                              Text(
                                "${rank[widget.result][2]}",
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            "${rank[widget.result][3]}",
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 11),
                        child: Container(
                          child: Card(
                            child: InkWell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Text("SALVAR RESULTADO"),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "RECALCULAR SEU IMC",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
