import 'package:flutter/material.dart';
import '../screens/product.dart';

class cartpage extends StatefulWidget {
  const cartpage({Key? key}) : super(key: key);

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Addedproduct.forEach((element) {
      Totalamount += element.price;
    });
  }

  int Totalamount = 0;
  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Cart Page",
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          (Addedproduct.isNotEmpty)
              ? Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: Addedproduct.map(
                      (e) => Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(blurRadius: 10, color: Colors.grey),
                        ]),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height,
                          width:
                          MediaQuery.of(context).size.width * 0.37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(e.thumbnail),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: style,
                            ),
                            Text(
                              "\$ ${e.price.toString()}",
                              style: style,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Addedproduct.forEach((element) {
                                    Totalamount -= e.price;
                                  });
                                  Addedproduct.remove(e);
                                });
                              },
                              child: const Text(
                                "DELETE",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).toList(),
              ),
            ),
          )
              : Expanded(
            flex: 8,
            child: Center(
              child: Text(
                "cart is empty.....",
                style: style,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text(
                      "Total Price:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ ${Totalamount}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}