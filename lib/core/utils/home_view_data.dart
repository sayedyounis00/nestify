import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/discover_view_body.dart';
import 'package:nestify/features/home/presentation/views/widgets/fav_view_body.dart';
import 'package:nestify/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:nestify/features/home/presentation/views/widgets/messanger_view_body.dart';

class Views{
    static final List<Widget> viewsBody = [
    const HomeViewBody(),
    const DiscoverViewBody(),
    const FavViewBody(),
    const MessangerViewBody(),
  ];
}