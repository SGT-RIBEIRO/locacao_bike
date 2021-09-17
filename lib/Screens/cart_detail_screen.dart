import 'package:flutter/material.dart';
import 'package:locacao_bike/Models/bike.dart';
import 'package:locacao_bike/Providers/cart_item.dart';
import 'package:provider/provider.dart';

import '../app_routes.dart';

class CartDetailScreen extends StatelessWidget {
  const CartDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bike; //!
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Aluguel'),
        //centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.pedal_bike),
            onPressed: (){},  
          ),

          Consumer<CartItem>(builder: (context, cartItem, _) => Text(cartItem.total.toString()),),

          SizedBox(
            width: 22,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    trailing: GestureDetector(
                      child: Icon(Icons.delete_forever, color: Colors.red,),
                      onTap: (){
                        cartProvider.removeBike(bikes[index]);
                      },
                    ),
                    title: Text('${bikes[index].nome}'),
                  ),
                );
              }, 
              separatorBuilder: (context, int index) => const Divider(), 
              itemCount: bikes.length,
            ),

            ElevatedButton.icon(
              //style: ButtonStyle(
              //  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              //),
              style:  ElevatedButton.styleFrom(
                minimumSize: Size(200,40),
                primary: Colors.deepPurple,
              ),
              icon: Icon(Icons.shopping_cart), 
              label: Text("Ir para pagamento"),
              onPressed: (){}, 
            ),

            ElevatedButton.icon(
              //style: ButtonStyle(
              //  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
              //),

              style:  ElevatedButton.styleFrom(
                minimumSize: Size(200,40),
                primary: Colors.deepPurple,
              ),
              icon: Icon(Icons.pedal_bike_rounded),
              label: Text("Ver mais bikes"),
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.HOME);
              }, 
            )
          ],
        ),
      ),
    );
  }
}