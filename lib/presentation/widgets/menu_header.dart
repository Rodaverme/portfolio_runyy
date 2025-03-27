import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15) ,
          width: double.maxFinite,
          height: 150,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Placeholder(),
              TextButton(onPressed: (){}, child: Text('Inicio')),
              TextButton(onPressed: (){}, child: Text('Quien soy')),
              TextButton(onPressed: (){}, child: Text('Experiencia')),
              TextButton(onPressed: (){}, child: Text('Servicios')),
              TextButton(onPressed: (){}, child: Text('Trabajos realizados')),
              
            ],
          ),
        );
  }
}
