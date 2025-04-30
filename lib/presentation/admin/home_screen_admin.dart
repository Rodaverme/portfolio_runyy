import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/admin/admin_projects_done.dart';
import 'package:portfolio_runny/presentation/widgets/forms/add_and_update_form.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  String _selectedOption = 'actualizar'; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administrador'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Menú de navegación
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildNavigationBar(),
          ),
          // Contenido dinámico
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    return NavigationBar(
      selectedIndex: _getSelectedIndex(),
      onDestinationSelected: (int index) {
        setState(() {
          _selectedOption = _getOptionFromIndex(index);
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.check_box),
          label: 'Proyectos Realizados',
        ),
        NavigationDestination(
          icon: Icon(Icons.add_box),
          label: 'Nuevo Proyecto',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
        NavigationDestination(
          icon: Icon(Icons.business),
          label: 'Registrar Empresa',
        ),
      ],
    );
  }

  int _getSelectedIndex() {
    switch (_selectedOption) {
      case 'crear':
        return 1;
      case 'Configuracion':
        return 2;
      case 'registrarEmpresa':
        return 3;
      default:
        return 0;
    }
  }

  String _getOptionFromIndex(int index) {
    switch (index) {
      case 1:
        return 'crear';
      case 2:
        return 'Configuracion';
      case 3:
        return 'registrarEmpresa';
      default:
        return 'actualizar';
    }
  }

  Widget _buildContent() {
    switch (_selectedOption) {
      case 'crear':
        return _crearProyectoPanel();
      case 'actualizar':
        return AdminProjectsDone();
      case 'Configuracion':
        return _configuracionPanel();
      case 'registrarEmpresa':
        return _registrarEmpresaPanel();
      default:
        return const Center(child: Text('Seleccione una opción'));
    }
  }

  Widget _registrarEmpresaPanel() {
    return const Center(
      child: Text(
        'Formulario para Registrar Empresa',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _crearProyectoPanel() {
    return const Center(
      child: AddAndUpdateForm()
    );
  } 

 

  Widget _configuracionPanel() {
    return const Center(
      child: Text(
        'Configuración',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
