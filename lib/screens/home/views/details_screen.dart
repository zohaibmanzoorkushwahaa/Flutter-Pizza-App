import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pizza_app/components/macro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;
  const DetailsScreen({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3,3),
                  blurRadius: 5
                )
                ],
                image: DecorationImage(
                  image: NetworkImage(pizza.picture)
                )
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3,3),
                      blurRadius: 5
                  )
                  ],

              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                         Expanded(
                          flex: 2,
                          child: Text(
                            pizza.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment:Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${ pizza.price - (pizza.price * pizza.discount /100) }',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                                Text(
                                  '\$${pizza.price}.0',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough

                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                     Row(
                      children: [
                        MyMacroWidget(
                          title: 'Calories',
                          value: pizza.macros.calories,
                          icon: FontAwesomeIcons.fire
                        ),
                        const SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Protein',
                          value: pizza.macros.proteins,
                          icon: FontAwesomeIcons.dumbbell
                        ),
                        const SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Fat',
                          value: pizza.macros.fat,
                          icon: FontAwesomeIcons.pills
                        ),
                        const SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Carbs',
                          value: pizza.macros.carbs,
                          icon: FontAwesomeIcons.breadSlice
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Text(
                            'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
