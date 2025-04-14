import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/services/send_email.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Contáctame',
                    speed: const Duration(milliseconds: 50),
                    textStyle: theme.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: isMobile
                    ? Column(
                        children: [
                          _buildContactInfoCard(),
                          const SizedBox(height: 20),
                          _buildFormCard(context),
                        ],
                      )
                    : IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildContactInfoCard()),
                            const SizedBox(width: 20),
                            Expanded(child: _buildFormCard(context)),
                          ],
                        ),
                      ),
              ),
              const SizedBox(height: 40),
              _buildFooter(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildContactInfoCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Información de contacto',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('ronald15043@hotmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('+57 316 821 1187'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Cali, Colombia'),
            ),
            ListTile(
              leading: Icon(Icons.web, color: Colors.orange),
              title: Text('https://github.com/Rodaverme'),
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.blueAccent),
              title: Text('linkedin.com/in/ronald-vera-15043/'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Envíame un mensaje',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo electrónico';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingresa un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: 'Asunto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el asunto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Mensaje',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu mensaje';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final isEmailSent = sendEmail(
                      name: nameController.text,
                      email: emailController.text,
                      subject: subjectController.text,
                      message: messageController.text,
                      );

                      if (isEmailSent == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Mensaje enviado con éxito!'),
                        ),
                      );
                      } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Error al enviar el mensaje. Por favor, inténtalo de nuevo.'),
                        ),
                      );
                      }
                      // Acción al enviar
                    }
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
            

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
        child: Text(
          '© 2025 Ronald Vera | Todos los derechos reservados',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
