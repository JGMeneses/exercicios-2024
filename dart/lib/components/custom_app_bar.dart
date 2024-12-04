import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.backgroundColor = const Color(0xFF456189),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
        Container(
          height: 80, // Defina a altura fixa
          width: double.infinity, // Preencherá horizontalmente
          color: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'Exibindo todas atividades',
              isDense: true, // Evita que o tamanho do input se ajuste ao conteúdo
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                width: 50, // Largura do fundo do ícone
                
                decoration: BoxDecoration(
                  color: fromCssColor('#306DC3'),
                  borderRadius: BorderRadius.circular(30), // Arredondamento do fundo
                ),
                child: const Icon(Icons.calendar_today, color: Colors.white, size: 28),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 18), // Ajusta o padding para afastar o ícone da borda
            ),
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150); // Ajuste de altura
}
