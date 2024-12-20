import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:termosense/Models/func.dart';
import 'package:termosense/Models/sala.dart';
import 'package:termosense/Provider/adm/funcprovider.dart';
import 'package:termosense/Provider/adm/salaprovider.dart';
import 'package:termosense/Provider/adm/userambprovider.dart';
import 'package:termosense/Provider/login/loginuser.dart';
import 'package:termosense/pages/admin/autfunc.dart';
import 'package:termosense/pages/admin/editarfunc.dart';
import 'package:termosense/pages/admin/editarsala.dart';
import 'package:termosense/pages/admin/listsala.dart';
import 'package:termosense/pages/homepage.dart';
import 'package:termosense/pages/login.dart';
import 'package:termosense/pages/usuario/cadastro.dart';
import 'package:termosense/pages/admin/cadastrofunc.dart';
import 'package:termosense/pages/admin/listfunc.dart';
import 'package:termosense/pages/admin/cadsala.dart';
import 'package:termosense/pages/usuario/sala.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Logar()),
      ChangeNotifierProvider(create: (_) => AmbienteProvider()),
      ChangeNotifierProvider(create: (_) => FuncionarioProvider()),
      ChangeNotifierProvider(create: (_) => UsuarioAmbienteProvider()),

    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/login': (context) => const Login(),
        '/salas': (context) => const Sala(),
        '/cadastro': (context) => const Cadastro(),
        '/cadsala': (context) => const CadastroAmbiente(),
        '/cadfunc': (context) => const CadastroFunc(),
        '/listafunc': (context) => const ListaFuncionarios(),
        '/listasala': (context) => const ListaAmbientes(),
        '/autfunc': (context) => const AutorizarFuncionario(),
        '/editarsala': (context) {
          final ambiente =
              ModalRoute.of(context)!.settings.arguments as Ambiente;
          return Editarsala(ambiente: ambiente);
        },
        '/editarfunc': (context) {
          final funcionario = ModalRoute.of(context)!.settings.arguments as Funcionario;
          return Editarfunc(funcionario: funcionario);
        },
      },
      debugShowCheckedModeBanner: false,
    ),
  ));
}
