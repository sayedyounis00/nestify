import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_cubit.dart';
import 'package:nestify/features/owner%20main/presentation/views/widgets/drop_down_owner.dart';
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
  String? houseTitle, location, price, category, reviewNum, description, bd, ba;
  String? selectedCategory,
      selectedLocation,
      selectedPrice,
      selectedBeds,
      selectedBath;

  @override
  void dispose() {
    selectedImage = null;
    selectedCategory = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.grey.withOpacity(.3),
            ),
            child: selectedImage == null
                ? const Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColor.primaryColor,
                    size: 30,
                  )
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
              Container(
                constraints: const BoxConstraints(minHeight: 50),
                child: CustomTextField(
                  prefix: const Icon(Icons.abc),
                  label: 'Property Name',
                  onChanged: (title) => houseTitle = title,
                ),
              ),
              const SpaceV(10),
              DropDownOwner(
                selectedValue: selectedLocation,
                upText: 'Location',
                allList: const [
                  'Egypt',
                  'Usa',
                  'Tanta',
                  'Alex',
                  'Sharm',
                ],
                onChanged: (String? value) {
                  selectedLocation = value!;
                  setState(() {});
                },
              ),
              const SpaceV(10),
              DropDownOwner(
                selectedValue: selectedPrice,
                upText: 'Price per night',
                allList: const [
                  '1000',
                  '2000',
                  '3000',
                  '4000',
                  '5000',
                  '6000',
                ],
                onChanged: (String? value) {
                  selectedPrice = value!;
                  setState(() {});
                },
              ),
              const SpaceV(10),
              Row(
                children: [
                  Expanded(
                    child: DropDownOwner(
                      selectedValue: selectedBeds,
                      upText: 'num of bed',
                      allList: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                      ],
                      onChanged: (String? value) {
                        selectedBeds = value!;
                        setState(() {});
                      },
                    ),
                  ),
                  const SpaceH(5),
                  Expanded(
                    child: DropDownOwner(
                      selectedValue: selectedBath,
                      upText: 'num of bath',
                      allList: const [
                        '1',
                        '2',
                        '3',
                        '4',
                      ],
                      onChanged: (String? value) {
                        selectedBath = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SpaceV(10),
        DropDownOwner(
          selectedValue: selectedCategory,
          upText: 'Category',
          allList: const [
            'Villa',
            'House',
            'Hotel',
            'Tent',
            'Camp',
          ],
          onChanged: (String? value) {
            selectedCategory = value!;
            setState(() {});
          },
        ),
        const SpaceV(10),
        CustomTextField(
          prefix: const Icon(Icons.monetization_on),
          label: 'description',
          onChanged: (desc) => description = desc,
        ),
        const SpaceV(10),
        CustomButton(
          text: 'Add Property',
          onPressed: () {
            if (addPropertyKey.currentState!.validate()) {
              String fullName =
                  BlocProvider.of<NavigateCubit>(context).user.fullName;
              BlocProvider.of<OwnerCubit>(context).addHouse(
                ownerName: fullName,
                category: selectedCategory ?? 'category',
                houseTitle: houseTitle ?? 'title',
                location: selectedLocation ?? 'place',
                bd: selectedBeds ?? 'bd',
                ba: selectedBath ?? 'ba',
                price: selectedPrice ?? 'price',
                imageUrl: imageUrl ??
                    'https://st2.depositphotos.com/2102215/46681/v/450/depositphotos_466819550-stock-illustration-image-available-icon-missing-image.jpg',
                ownernum: BlocProvider.of<NavigateCubit>(context).user.phone,
                description: description ?? 'desc',
              );
              Navigator.pop(context);
            } else {
              return;
            }
          },
          color: AppColor.primaryColor,
          width: double.infinity,
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
