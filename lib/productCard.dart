import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      body: Center(
        child: Container(
          width: 250,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3), // Changed offset value to (0, 3)
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                    child: Image.asset("images/meal_sample.jpg",
                    height: 150,),
                
                ),
                Text(
                  "Hot Meal",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 4,),
                Text(
                  "Cost: 25",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,),
                ),
                SizedBox(height: 4,),
                Text(
                  "Category: food",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,),
                ),
                SizedBox(height: 4,),
                TextButton(
                  onPressed: (){
                    Fluttertoast.showToast(msg: "Product added to cart",
                    toastLength: Toast.LENGTH_SHORT, fontSize: 16.0);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Add to Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
                )


              ],
            )// Added a placeholder text
          ),
        ),
      ),
    );
  }
}
