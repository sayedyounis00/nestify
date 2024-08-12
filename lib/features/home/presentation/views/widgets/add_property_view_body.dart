import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:nestify/features/home/data/add_property_data.dart';
import 'package:nestify/features/home/presentation/view%20model/house%20cubit/house_cubit.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class AddPropertyViewBody extends StatefulWidget {
  const AddPropertyViewBody({super.key});

  @override
  State<AddPropertyViewBody> createState() => _AddPropertyViewBodyState();
}

class _AddPropertyViewBodyState extends State<AddPropertyViewBody> {
  String? houseTitle,
      location,
      price,
      category,
      ownernum,
      reviewNum,
      description;
  String? bd, ba;
  @override
  void initState() {
    BlocProvider.of<HouseCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  PickImageFromGallary().pickImage();
                  UploadImageToFirebase().uploadImage();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  margin: const EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey,
                  ),
                  child: Variables.selectedImage == null
                      ? const Icon(Icons.add)
                      : Image.file(
                          File(Variables.selectedImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.abc),
                      label: ' Property Name',
                      onChanged: (title) => houseTitle = title,
                    ),
                  ),
                  const SpaceH(10),
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.room),
                      label: ' Property Loacation',
                      onChanged: (loca) => location = loca,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: ' Price per Night',
                  onChanged: (prc) => price = prc,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: ' Category',
                  onChanged: (cate) => category = cate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: ' ownernum',
                  onChanged: (ownerN) => ownernum = ownerN,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: ' reviewNum',
                  onChanged: (review) => reviewNum = review,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTextField(
                  prefix: const Icon(Icons.monetization_on),
                  label: ' description',
                  onChanged: (desc) => description = desc,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.bed),
                      label: ' num of bed',
                      onChanged: (numBed) => bd = numBed,
                    ),
                  ),
                  const SpaceH(10),
                  Expanded(
                    child: CustomTextField(
                      prefix: const Icon(Icons.house_rounded),
                      label: ' num of ba',
                      onChanged: (bath) => ba = bath,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomButton(
                  text: 'Add Property',
                  onPressed: () {
                    String fullName =
                        BlocProvider.of<HomeCubit>(context).user.fullName;
                    BlocProvider.of<HouseCubit>(context).addHouse(
                      ownerName: fullName,
                      category: category ?? 'category',
                      houseTitle: houseTitle ?? 'title',
                      location: location ?? 'place',
                      bd: bd ?? 'bd',
                      ba: ba ?? 'ba',
                      price: price ?? 'price',
                      imageUrl: Variables.imageUrl ??
                          'https://static.realting.com/uploads/images/3f1/445e22c2280ba1273ef81a36f446a.webp ',
                      ownernum: ownernum ?? 'ownerNum',
                      reviewNum: reviewNum ?? 'review',
                      description: description ?? 'desc',
                    );
                    setState(() {});
                    log('added to fire base');
                  },
                  color: AppColor.primaryColor,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addFilteredList() {}
}
