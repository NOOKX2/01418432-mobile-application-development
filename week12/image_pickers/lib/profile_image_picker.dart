import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image; // เก็บไฟล์รูปที่ผู้ใช้เลือกหรือถ่าย
  final ImagePicker _picker = ImagePicker();

  // ฟังก์ชันเลือกภาพจากแหล่งที่กำหนด (Gallery หรือ Camera)
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1024,
    );

    // ถ้าผู้ใช้เลือกภาพสำเร็จ
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // แสดงแถบด้านล่าง (bottom sheet) ให้ผู้ใช้เลือกแหล่งรูปภาพ
  void _showImageSourceActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('เลือกจาก Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('ถ่ายภาพ'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50), //
        GestureDetector(
          onTap: _showImageSourceActionSheet, //
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.shade300,
            // ถ้ามีรูปแล้ว แสดงรูปจากไฟล์
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? const Icon(Icons.person, size: 60, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'แตะเพื่อเปลี่ยนรูปโปรไฟล์', //
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}