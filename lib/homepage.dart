import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/ProductModel.dart';
import 'package:getx_app/home_controller.dart';

class Homepage extends StatelessWidget {
    Homepage({super.key});


    HomeController homeController = Get.put(HomeController());

    @override
    Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(

            title: Text("Get API integration"),
            
        ),
        body: GetBuilder<HomeController>(

            builder: (_) => homeController.isLoading ? Center(child: CircularProgressIndicator()) :  ListView.builder(

                itemCount: homeController.products.length,
                itemBuilder: (context, index){

                    ProductModel product = homeController.products[index];

                    return Card(

                        child: ListTile(
                            leading: Image.network(product.image!, width: 100.0, height: 100.0,),
                            title: Text(product.title!, overflow: TextOverflow.ellipsis,),
                            subtitle: Text(product.description!) ,
                            
                        ),

                    );

                }

            )
        ),

    );

    }
}