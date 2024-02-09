import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
       bool animation = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
               animation = !animation;
            });
          },
          child: AnimatedContainer(
            curve: Easing.linear,
            duration:const Duration(milliseconds: 500),
            width: animation ? 200 :100 ,
            height: 60.0,
            decoration: BoxDecoration(
              color:animation == false ? Colors.blue:Colors.green,
              borderRadius: BorderRadius.circular(animation == false ?10.0:30.0),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  animation ? 
                  Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if(animation)
              const  Text('Added to cart',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
