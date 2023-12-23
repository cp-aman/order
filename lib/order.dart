import 'package:flutter/material.dart';

class Item {
  final String dish;
  final double price;

  Item({required this.dish,required this.price});
}

List<Item> finallist = [];
List<Item> fooditems = [
    Item(dish: 'Pizza',price: 300),
    Item(dish: 'Momo',price: 100),
    Item(dish: 'Pasta',price: 200),
    Item(dish: 'Dosa',price: 200),
    Item(dish: 'Burger',price: 200 ),
    Item(dish: 'French Fries',price:150 ),
    Item(dish: 'Sandwhich',price: 150),
    Item(dish: 'Paneer Tikka',price:150 ),
    Item(dish: 'Chilli Potato',price: 150),
    Item(dish: 'Baby Corn',price:100 ),
    Item(dish: 'Taco',price:150),
    Item(dish: 'Pav Bhaji',price:150),
    Item(dish: 'Raj Kachori',price:100),
    Item(dish: 'Spring Roll',price:100),
    Item(dish: 'Aloo Tikki',price:100),
    Item(dish: 'Patties',price:50),
  ];

List<Item> drinkitems = [
    Item(dish: 'Mineral Water',price: 50),
    Item(dish: 'Strawberry Shake',price: 150),
    Item(dish: 'Cappuccino',price: 200),
    Item(dish: 'Frappucino',price: 200),
    Item(dish: 'Babycino',price: 200),
    Item(dish: 'Expreso',price: 200),
    Item(dish: 'BlueBerry',price: 250),
    Item(dish: 'Oreo Shake',price: 100),
    Item(dish: 'Hot Chocolate',price:200),
    Item(dish: 'Kulhad Chai',price: 150),
    Item(dish: 'Kesar Kulfi',price: 100),
    Item(dish: 'Virgin Mohito',price: 150),
    Item(dish: 'Kitkat Shake',price: 150),
    Item(dish: 'Pastry',price: 200),
    Item(dish: 'Corneto',price: 80),
    Item(dish: 'Kesar Dudh',price: 100),
    Item(dish: 'Custard',price: 150),
    Item(dish: 'Rose',price: 100),
  ];

FloatingActionButton fb(context){
  return FloatingActionButton(
    onPressed: () {
      finallist.clear();
      Navigator.popUntil(context,ModalRoute.withName('/')); 
    },
    child: Icon(Icons.clear),

  );
}



class Food extends StatefulWidget {
  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  // const MyWidget({super.key});
  

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      floatingActionButton: fb(context),
      body: ListView.builder(
        itemCount: fooditems.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text('${fooditems[index].dish}'),
            subtitle: Text('\u{20B9} ${fooditems[index].price}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                setState(() {
                  finallist.add(fooditems[index]);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${fooditems[index].dish} added to the order'),
                  )
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
      // color: Colors.blue, // You can customize the color as needed
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                
              },
              child: Icon(Icons.home),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (Drinks()))
                );
              },
              child: Icon(Icons.local_drink),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class Drinks extends StatefulWidget {
  // const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drinks'),
      ),
      floatingActionButton: fb(context),
      body: ListView.builder(
        itemCount: drinkitems.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text('${drinkitems[index].dish}'),
            subtitle: Text('\u{20B9} ${drinkitems[index].price}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                setState(() {
                  finallist.add(drinkitems[index]);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${drinkitems[index].dish} added to the order'),
                  )
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
      // color: Colors.blue, // You can customize the color as needed
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                
              },
              child: Icon(Icons.food_bank),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (FinalOrder()))
                );
              },
              child: Icon(Icons.currency_rupee),
            ),
          ],
        ),
      ),
    ),

    );
  }
}

class FinalOrder extends StatelessWidget {
  // const FinalOrder({super.key});
   double total = finallist.fold(0, (sum, product) => sum + product.price);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      floatingActionButton: fb(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finallist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(finallist[index].dish),
                  subtitle: Text('\u{20B9}${finallist[index].price}'),
                );
              },
            ),
          ),
          
          Center(
            child: ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order Placed'),
                  )
                );

              },
              child: Text('Confirm ur Order'),
            )
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \u{20B9}${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}