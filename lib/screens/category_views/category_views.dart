import 'package:e_commerce_flutter/constants/routes.dart';
import 'package:e_commerce_flutter/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:e_commerce_flutter/models/category_model/category_model.dart';
import 'package:e_commerce_flutter/models/product_model/product_model.dart';
import 'package:e_commerce_flutter/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

class CategoryViews extends StatefulWidget {
  CategoryViews({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryViews> createState() => _CategoryViewsState();
}

class _CategoryViewsState extends State<CategoryViews> {
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  void getCategoriesList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFireStoreHelper.instance
        .getCategoryViewsProducts(widget.categoryModel.id);
    productModelList.shuffle();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoriesList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const BackButton(),
                          Text(
                            widget.categoryModel.name,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    productModelList.isEmpty
                        ? Center(
                            child: Text("Best Product is Empty"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                                itemCount: productModelList.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 0.9,
                                        crossAxisCount: 2),
                                itemBuilder: (ctx, index) {
                                  ProductModel singleProduct =
                                      productModelList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
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
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Price: \$${singleProduct.price}"),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: 150,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singleProduct),
                                                  context: context);
                                            },
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.red,
                                              surfaceTintColor: Colors.red,
                                              shadowColor: Colors.red,
                                              side: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.9),
                                            ),
                                            child: Text(
                                              "Buy",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    SizedBox(
                      height: 12.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
