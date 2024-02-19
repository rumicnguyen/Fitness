import 'package:fitness_app/src/network/data/enum/storage/storage_folder.dart';
import 'package:fitness_app/src/network/data/storage/firebase_storage_reference.dart';
import 'package:fitness_app/src/network/model/workout/workout.dart';
import 'package:fitness_app/src/router/coordinator.dart';
import 'package:fitness_app/src/themes/colors.dart';
import 'package:fitness_app/src/themes/styles.dart';
import 'package:flutter/material.dart';

class MostPopularItem extends StatefulWidget {
  const MostPopularItem({
    super.key,
    required this.item,
  });

  final MWorkout item;

  @override
  State<MostPopularItem> createState() => _MostPopularItemState();
}

class _MostPopularItemState extends State<MostPopularItem> {
  String image = '';

  Future syncData() async {
    FirebaseStorageReference ref = FirebaseStorageReference();
    final result = await ref.get(
      folder: StorageFolder.workouts,
      data: widget.item.thumbnail,
    );
    if (result.isSuccess && result.data != null) {
      setState(() {
        image = result.data!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    image = '';
    syncData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppCoordinator.showWorkoutDetailsScreen(id: widget.item.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gray,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
            opacity: 0.4,
          ),
        ),
        child: Center(
          child: Text(
            widget.item.name,
            style: AppStyles.mostB,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
