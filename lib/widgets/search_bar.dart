import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    required this.onSearchTap,
    this.controller,
    // this.centerHintText = true,
    // this.isPassword = false,
    // this.keyboardType,
  });

  final TextEditingController? controller;
  final VoidCallback onSearchTap;
 

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        // Add your desired decoration properties here
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}

