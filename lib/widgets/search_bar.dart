import 'package:cosysta_mt/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.onSearchTap,
    this.controller,
    // this.centerHintText = true,
    // this.isPassword = false,
    // this.keyboardType,
  });

  final TextEditingController? controller;
  final ValueChanged<String> onSearchTap;
 

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
    final inputDecoration = InputDecoration(
      hintText: 'Search',
      hintStyle: AppTheme.textStyles.textFieldHintText,
      alignLabelWithHint: true,
      filled: true,
      suffixIcon: Icon(Icons.search),
      fillColor: const Color(0xFFF1F2F6),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
    return TextFormField(
      onChanged: widget.onSearchTap,
      controller: widget.controller,
      decoration: inputDecoration,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}

