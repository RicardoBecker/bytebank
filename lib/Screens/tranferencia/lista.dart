import 'package:bytebank/Models/transferencia.dart';
import 'package:bytebank/Screens/tranferencia/formulario.dart';
import 'package:flutter/material.dart';


class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  //_ListaTransferenciasState createState() => _ListaTransferenciasState();
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ponto de Controle"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTranferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 2), () {
              debugPrint("Chegou no then");
              debugPrint('$transferenciaRecebida');

              if (transferenciaRecebida != null) {
                setState(
                        () => widget._transferencias.add(transferenciaRecebida));
              }
            });
          }); //Future
        }, //OnPressed
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("Valor R\$ " + _transferencia.valor.toString()),
        subtitle: Text("Conta R\$ " + _transferencia.numConta.toString()),
      ),
    );
  }
}