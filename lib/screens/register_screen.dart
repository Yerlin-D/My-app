import 'package:flutter/material.dart';
import './user_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _acceptTerms = false;

  void _register() {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      // Guardar datos del usuario
      saveUserData(_emailController.text, _nameController.text);
      // Redirigir a la pantalla de categorías
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Imagen agregada aquí
                  Image.network(
                    'https://i.pinimg.com/736x/95/f3/4e/95f34e9bc588226a8c91a1be5bbebd67.jpg', // Reemplaza con la URL de tu imagen
                    height: 80, // Altura de la imagen en píxeles
                    width: 80, // Ancho de la imagen en píxeles
                    fit: BoxFit.cover, // Ajuste de la imagen
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Crear una cuenta',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _acceptTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            _acceptTerms = value ?? false;
                          });
                        },
                      ),
                      Text('Aceptar términos y condiciones'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _register,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Registrarse'),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botón para regresar al login
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Regresa a la pantalla anterior (login)
                      },
                      child: Text(
                        '¿Ya tienes una cuenta? Inicia sesión',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
