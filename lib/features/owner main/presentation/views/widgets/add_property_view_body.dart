import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/home/presentation/view%20model/house%20cubit/house_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/search/drop_down_menu.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';

class AddPropertyViewBody extends StatefulWidget {
  const AddPropertyViewBody({super.key});

  @override
  State<AddPropertyViewBody> createState() => _AddPropertyViewBodyState();
}

class _AddPropertyViewBodyState extends State<AddPropertyViewBody> {
  final addPropertyKey = GlobalKey<FormState>();
  static XFile? selectedImage;
  static String? imageUrl;
  String? houseTitle, location, price, category, reviewNum, description;
  String? bd, ba;
  String? selectedCategory;

  @override
  void dispose() {
    selectedImage = null;
    selectedCategory = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            pickAndUploadImage();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey,
            ),
            child: selectedImage == null
                ? const Icon(Icons.add)
                : Image.file(
                    File(selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Form(
          key: addPropertyKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.abc),
                      label: 'Property Name',
                      onChanged: (title) => houseTitle = title,
                    ),
                  ),
                  const SpaceH(10),
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.room),
                      label: 'Property Loacation',
                      onChanged: (loca) => location = loca.toLowerCase(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: 'Price per Night',
                  onChanged: (prc) => price = prc,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: 'description',
                  onChanged: (desc) => description = desc,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.bed),
                      label: 'num of bed',
                      onChanged: (numBed) => bd = numBed,
                    ),
                  ),
                  const SpaceH(10),
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.house_rounded),
                      label: 'num of ba',
                      onChanged: (bath) => ba = bath,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Expanded(
            child: DropDownMenu(
              selectedValue: selectedCategory,
              upText: 'Category',
              allList: const [
                'Villa',
                'House',
                'Hotel Room',
              ],
              onChanged: (String? value) {
                selectedCategory = value!;
                setState(() {});
              },
            ),
          ),
          //  CustomTextField(
          //   prefix: const Icon(Icons.monetization_on),
          //   label: 'Category',
          //   onChanged: (cate) => category = cate.toLowerCase(),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomButton(
            text: 'Add Property',
            onPressed: () {
              if (addPropertyKey.currentState!.validate()) {
                String fullName =
                    BlocProvider.of<NavigateCubit>(context).user.fullName;
                BlocProvider.of<HouseCubit>(context).addHouse(
                  ownerName: fullName,
                  category: selectedCategory ?? 'category',
                  houseTitle: houseTitle ?? 'title',
                  location: location ?? 'place',
                  bd: bd ?? 'bd',
                  ba: ba ?? 'ba',
                  price: price ?? 'price',
                  imageUrl: imageUrl ??
                      'https://st2.depositphotos.com/2102215/46681/v/450/depositphotos_466819550-stock-illustration-image-available-icon-missing-image.jpg ',
                  ownernum: BlocProvider.of<NavigateCubit>(context).user.phone,
                  reviewNum: reviewNum ?? 'review',
                  description: description ?? 'desc',
                );
                Navigator.pop(context);
              } else {
                return;
              }
            },
            color: AppColor.primaryColor,
            width: double.infinity,
          ),
        )
      ],
    );
  }

  void pickAndUploadImage() async {
    try {
      var returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnedImage != null) {
        setState(() {
          selectedImage = XFile(returnedImage.path);
        });

        final storage = FirebaseStorage.instanceFor(
            bucket: 'gs://nestify-8f4b4.appspot.com');
        var refStorage = storage.ref().child('images/${selectedImage!.name}');
        var uploadTask = refStorage.putFile(File(selectedImage!.path));
        var snapshot = await uploadTask.whenComplete(() => null);
        final downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        throw ('No image selected');
      }
    } catch (e) {
      throw ('Error uploading image: $e');
    }
  }
}
