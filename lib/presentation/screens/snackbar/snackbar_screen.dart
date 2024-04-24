import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snakback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }


  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Non in consectetur ipsum est ipsum laboris cupidatat labore officia deserunt cupidatat. Est dolore aliqua minim mollit sint consequat esse deserunt tempor eiusmod in. Ut dolore dolor non enim duis nostrud do qui velit fugiat aliquip. Aliquip eu minim deserunt ullamco sint nulla reprehenderit.'),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Cancelar')
          ),

          FilledButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Aceptar')
          ),

        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Eiusmod ea exercitation fugiat adipisicing eiusmod. Cupidatat ea tempor ad qui pariatur laboris velit velit culpa fugiat dolore enim nostrud aute. Mollit aliqua consequat eu ut aute proident consectetur laborum cupidatat aliqua irure occaecat ad. Amet irure irure eiusmod ipsum sunt minim magna quis enim aliqua cillum.')
                  ]
                );
              },
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed:() => openDialog(context),
              child: const Text('Mostrar dialogo')
            )
          ],
        ),


      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
