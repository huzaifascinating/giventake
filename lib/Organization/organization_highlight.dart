import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class OrganizationHighlightPage extends StatefulWidget {
  const OrganizationHighlightPage({super.key});

  @override
  _OrganizationHighlightPageState createState() =>
      _OrganizationHighlightPageState();
}

class _OrganizationHighlightPageState extends State<OrganizationHighlightPage> {
  final TextEditingController _highlightNameController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image; // To store the selected image

  // Use file_picker to pick an image
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Ensure it only allows images
    );

    if (result != null) {
      // Get the selected file
      File file = File(result.files.single.path!);
      setState(() {
        _image = File(file.path); // Update _image with the selected file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Highlight'),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.image, color: Colors.blue[900]),
                  const SizedBox(width: 10),
                  const Text(
                    'Highlight Thumbnail',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage, // Open file picker when tapped
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue, // Blue border
                      style: BorderStyle.solid,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: Colors.blue[900],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Browse Files',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.text_fields, color: Colors.blue[900]),
                  const SizedBox(width: 10),
                  const Text(
                    'Highlight Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _highlightNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter highlight name...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.description, color: Colors.blue[900]),
                  const SizedBox(width: 10),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter description...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_highlightNameController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty &&
                          _image != null) {
                        // You can handle the data, e.g., save it to Firebase or a database
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Highlight added successfully')),
                        );
                        Navigator.pop(context); // Navigate back after saving
                      } else {
                        // Show a message if any field is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all fields')),
                        );
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Add Highlight',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
