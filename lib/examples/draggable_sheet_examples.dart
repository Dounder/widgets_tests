import 'package:flutter/material.dart';
import '../widgets/draggable_bottom_sheet.dart';

class DraggableSheetExamples extends StatelessWidget {
  const DraggableSheetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Sheet Examples'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Background content
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.purple[50],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swipe_up, size: 100, color: Colors.purple),
                  SizedBox(height: 20),
                  Text(
                    'Choose an example below!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Example selector sheet
          _buildExampleSelector(context),
        ],
      ),
    );
  }

  Widget _buildExampleSelector(BuildContext context) {
    final examples = [
      {
        'title': 'Basic List',
        'subtitle': 'Simple scrollable list',
        'widget': _buildBasicListExample(),
      },
      {
        'title': 'Custom Colors',
        'subtitle': 'Themed draggable sheet',
        'widget': _buildCustomColorExample(),
      },
      {
        'title': 'Grid Content',
        'subtitle': 'Grid view inside sheet',
        'widget': _buildGridExample(),
      },
      {
        'title': 'Form Content',
        'subtitle': 'Form with input fields',
        'widget': _buildFormExample(),
      },
      {
        'title': 'No Handle',
        'subtitle': 'Sheet without drag handle',
        'widget': _buildNoHandleExample(),
      },
    ];

    return DraggableBottomSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      backgroundColor: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: examples.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final example = examples[index];
          return ListTile(
            title: Text(
              example['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(example['subtitle'] as String),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _ExampleScreen(
                    title: example['title'] as String,
                    child: example['widget'] as Widget,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Example 1: Basic List
  Widget _buildBasicListExample() {
    return DraggableBottomSheet(
      builder: (context, scrollController) {
        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.amber[600]),
                title: Text('Item ${index + 1}'),
                subtitle: Text('Basic list item ${index + 1}'),
              ),
            );
          },
        );
      },
    );
  }

  // Example 2: Custom Colors
  Widget _buildCustomColorExample() {
    return DraggableBottomSheet(
      backgroundColor: Colors.deepPurple[100]!,
      handleColor: Colors.deepPurple,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple.withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Custom themed item ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  // Example 3: Grid Content
  Widget _buildGridExample() {
    return DraggableBottomSheet(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apps, size: 40, color: Colors.blue[600]),
                  const SizedBox(height: 8),
                  Text('Item ${index + 1}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Example 4: Form Content
  Widget _buildFormExample() {
    return DraggableBottomSheet(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Contact Form',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  // Example 5: No Handle
  Widget _buildNoHandleExample() {
    return DraggableBottomSheet(
      showHandle: false,
      backgroundColor: Colors.orange[100]!,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.orange[200],
            child: ListTile(
              leading: Icon(Icons.circle, color: Colors.orange[600]),
              title: Text('No handle item ${index + 1}'),
              subtitle: const Text('This sheet has no drag handle'),
            ),
          );
        },
      ),
    );
  }
}

class _ExampleScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const _ExampleScreen({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal[50],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.preview, size: 80, color: Colors.teal[300]),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
