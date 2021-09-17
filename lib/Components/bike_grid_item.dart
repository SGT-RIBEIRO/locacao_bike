import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:locacao_bike/Models/bike.dart';
import 'package:locacao_bike/Providers/cart_item.dart';
import 'package:provider/provider.dart';

import '../app_routes.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  const BikeGridItem( {Key? key, required this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      child: GridTile(
          child: Image(image: CachedNetworkImageProvider(bike.imageURL),
          fit: BoxFit.cover,
        ),

          footer: GridTileBar(
            backgroundColor: Colors.deepPurple,
            //trailing: Text('${bike.nome}'),
            //leading: Text('Aro ${bike.aro}"',
            title: Text(
              '${bike.nome}',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "R\$: ${bike.preco}",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ), 
            trailing: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: (){
                  //AQUI ESTOU CHAMANDO A FUNÇÃO DE VERIFICA CARRINHO DE COMPRA
                  String resp = cartProvider.verificaCart(bike, cartProvider.addBike);
                  //print('Quantidade de Bikes no cart: ${cartProvider.total}');
                  //Tela de Mensagem----
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      backgroundColor: Colors.black54,
                      content: Center(
                        child: Container(
                          height: 250,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("$resp",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Icon(Icons.check_circle, color: Colors.green, size: 50,),
                              ),
                            ],
                          ),
                        ),
                      )
                  ));
              }
            ),
          ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
    );
  }
}