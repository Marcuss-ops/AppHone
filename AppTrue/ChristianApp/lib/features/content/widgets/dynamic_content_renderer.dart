import 'package:flutter/material.dart';

class DynamicContent {
  final String type;
  final Map<String, dynamic> fields;

  DynamicContent({required this.type, required this.fields});

  factory DynamicContent.fromJson(Map<String, dynamic> json) {
    return DynamicContent(
      type: json['type'] as String,
      fields: json['fields'] as Map<String, dynamic>,
    );
  }
}

class ContentSchemaEngine extends StatelessWidget {
  final DynamicContent content;

  const ContentSchemaEngine({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    // This is the bridge between "skeleton" and "meat"
    switch (content.type) {
      case 'card':
        return Card(
          child: Column(
            children: [
              if (content.fields['title'] != null) Text(content.fields['title']),
              if (content.fields['image_url'] != null) Image.network(content.fields['image_url']),
            ],
          ),
        );
      case 'action_button':
        return ElevatedButton(
          onPressed: () {},
          child: Text(content.fields['label'] ?? 'Action'),
        );
      case 'map_layer':
        // Placeholder for a map component
        return Container(height: 200, color: Colors.grey, child: const Center(child: Text('Map View')));
      default:
        return const SizedBox.shrink();
    }
  }
}
