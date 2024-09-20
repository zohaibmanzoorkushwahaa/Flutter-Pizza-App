import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/sign_in_blocs/sign_in_bloc.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_app/screens/home/views/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _appbar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if (state is GetPizzaSuccess) {
              return GridView.builder(
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                 DetailsScreen(
                                   pizza: state.pizzas[i],
                                 ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(state.pizzas[i].picture),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: state.pizzas[i].isVeg ?
                                      Colors.green
                                          :
                                      Colors.red,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                         state.pizzas[i].isVeg ?
                                        'Vegi'
                                            :
                                        'Non Vegi',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        state.pizzas[i].spicy == 1
                                            ? '🌶️ MILD'
                                            : state.pizzas[i].spicy == 2
                                            ? '🌶️ SPICY'
                                            : '🌶️ BLAND',
                                        style: TextStyle(
                                            color:  state.pizzas[i].spicy == 1
                                                ? Colors.orange
                                                : state.pizzas[i].spicy == 2
                                                ? Colors.redAccent
                                                : Colors.green,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                state.pizzas[i].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                state.pizzas[i].descriptions,
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Text(
                                    '\$${ state.pizzas[i].price - (state.pizzas[i].price * state.pizzas[i].discount /100) }',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '\$${state.pizzas[i].price}.00',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          CupertinoIcons.add_circled_solid)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.pizzas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9 / 16),
              );
            } else if(state is GetPizzaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center  (
                child: Text(
                  'An Error has Occured...'
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Refactored AppBar method
  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        children: [
          Image.asset(
            'assets/8.png',
            scale: 14,
          ),
          const SizedBox(width: 10),
          const Text(
            'PIZZA',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Handle cart action
          },
          icon: const Icon(CupertinoIcons.cart),
        ),
        IconButton(
          onPressed: () {
            context.read<SignInBloc>().add(SignOutRequired());
          },
          icon: const Icon(CupertinoIcons.arrow_right_to_line),
        ),
      ],
    );
  }
}
