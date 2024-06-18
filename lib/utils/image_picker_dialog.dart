import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:musicmatch/utils/constants.dart';

class ImagePickerDialog extends StatefulWidget {
  final DateTime selectedDate;

  const ImagePickerDialog({super.key, required this.selectedDate});

  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  TextEditingController _timeController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            backgroundColor: Colors.green,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Iconsax.calendar,
                size: 24.0,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                "Fecha: ${DateFormat('dd/MM/yyyy').format(widget.selectedDate)}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: _timeController,
          readOnly: true,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            suffixIcon: Icon(Icons.access_time),
            hintText: '00:00:00',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.transparent,
            filled: true,
          ),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null) {
              setState(() {
                _timeController.text = pickedTime.format(context);
              });
            }
          },
        )
      ]),
      content: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(0.0),
              child:   Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _image == null
                ? Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Backgrounds/placeholder.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Image.file(_image!),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                backgroundColor: mainColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Iconsax.image,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Cargar Imagen',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Iconsax.map,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Fijar Ubicación',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                icon: const Icon(Iconsax.dollar_circle),
                labelText: 'Tarifa',
                hintText: '00.0',
                hintStyle: TextStyle(color: Colors.grey[400]),
                fillColor: Colors.transparent,
                filled: true,
              ),
            )
          ],
        ))
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CERRAR'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
