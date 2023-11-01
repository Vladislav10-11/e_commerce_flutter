import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      "https://static.vecteezy.com/system/resources/previews/009/345/591/non_2x/stir-fry-salad-with-sushi-and-shrimps-in-a-bowl-with-a-slate-background-top-view-copy-space-shrimp-and-vegetables-served-with-salad-chopsticks-with-asian-food-vector-free-png.png",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9aUbbXZHAPtH91zjNDE_CajeE77Q2b3hxut__nKzEGBv_MbXvOrHecdL3sbNiagGjpkA&usqp=CAU",
      "https://static.vecteezy.com/system/resources/previews/009/345/591/non_2x/stir-fry-salad-with-sushi-and-shrimps-in-a-bowl-with-a-slate-background-top-view-copy-space-shrimp-and-vegetables-served-with-salad-chopsticks-with-asian-food-vector-free-png.png",
      "https://cdni.iconscout.com/illustration/premium/thumb/fast-food-4119390-3425151.png",
      "https://www.seekpng.com/png/full/316-3164991_junk-food-clipart-burger-fry-junk-food-vector.png",
    ];

    List<ProductModel> bestProducts = [
      ProductModel(
          image:
              "https://yastatic.net/avatars/get-grocery-goods/2998515/468edfb5-bdd1-48b6-bfc8-ef8364f6beb4/750x500?webp=true",
          id: "1",
          name: "Banana",
          price: "12",
          description: "good Banana",
          status: "pending",
          isFavourite: false),
      ProductModel(
          image:
              "https://www.applesfromny.com/wp-content/uploads/2020/05/Fortune_NYAS-Apples2.png",
          id: "2",
          name: "Apple",
          price: "12",
          description: "good Apple",
          status: "pending",
          isFavourite: false),
      ProductModel(
          image:
              "https://www.eatme.eu/media/anpou5s5/kiwi-half-topview.png?anchor=center&mode=crop&width=600&height=600&rnd=132629669449130000",
          id: "3",
          name: "Kiwi",
          price: "12",
          description: "good Kiwi",
          status: "pending",
          isFavourite: false),
      ProductModel(
          image:
              "https://cdn.sanity.io/images/or2m2oma/production/916f4cc2843bf9eb7b3db3d4525f16cdc62c6818-600x400.png?w=600&h=400&auto=format",
          id: "4",
          name: "Melone",
          price: "12",
          description: "good Melone",
          status: "pending",
          isFavourite: false),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopTitles(subtitle: "", title: "E-Commerce"),
                  TextField(
                    decoration: InputDecoration(hintText: "Search"),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryList
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Column(
                              children: [Image.network(e)],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Best Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                  itemCount: bestProducts.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2),
                  itemBuilder: (ctx, index) {
                    ProductModel singleProduct = bestProducts[index];
                    return Container(
                      color: Colors.red.withOpacity(0.2),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12.0,
                          ),
                          Image.network(
                            singleProduct.image,
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            singleProduct.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Price: \$${singleProduct.price}"),
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                              height: 45,
                              width: 200,
                              child: OutlinedButton(
                                  onPressed: () {}, child: Text("Buy")))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
