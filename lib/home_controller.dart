import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_app/ProductModel.dart';
import 'package:getx_app/home_service.dart';
import 'package:http/http.dart' as http;

//for managing state related task using GetX
class HomeController extends GetxController{

    //its  okkay but below is the best practice
    //HomeService homeService = HomeService();

    //best practice
    late HomeService homeService;

    //creating a list of products throudh ProductModel
    List<ProductModel> products = [];

    //loading state
    bool isLoading = false;


    //onInit function always called before building the UI
    @override
    void onInit() {

        //best praactice
        homeService = HomeService();

        displayProducts();

        super.onInit();
    }

    //function to get the data from request
    void displayProducts() async{

        //start loading
        isLoading = true;
        update();

        try{

            http.Response response   =  await homeService.getProducts();
            if(response.statusCode == 200){



                //now we need to jsonDecode to get the data on dartform 
                var data = jsonDecode(response.body);

                //iterate over data
                for(int i = 0; i < data.length; i++ ){
                    
                    //adding product into list
                    products.add(ProductModel.fromJson(data[i]));

                }

                isLoading = false;

                //notify any changes to the UI using update function
                update();

                // print(products);


            }

        }catch(e){
            
            print(e);

        }

    }

}