import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../cow_data/data/model/cows_model.dart';
import '../../../cow_data/presentation/control/cow_provider.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../../../core/widgets/first_row_title.dart';
import '../../../../../core/widgets/search_bar.dart';
import 'cow_status_rows.dart';

class CowStatus extends StatelessWidget {
  CowStatus({super.key});
  int? selectedCowStatus;
  double? minRange;
  double? maxRange;

  Future<List<CowModel>> fetchCows(CowProvider cowProvider) async {
    if (cowProvider.controller.text.isNotEmpty) {
      return await cowProvider.cowRepo.searchCows(cowProvider.controller.text);
    } else if (selectedCowStatus != null) {
      return await cowProvider.cowRepo.getFilteredCowsByStatus(selectedCowStatus!);
    } else {
      return await cowProvider.cowRepo.getAllCows();
    }
  }

  void applySearch(CowProvider cowProvider) {
    cowProvider.notifyListeners();
  }

  void applyStatusFilter(int status, CowProvider cowProvider) {
    selectedCowStatus = status;
    cowProvider.notifyListeners();
  }

  void clearFilters(CowProvider cowProvider) {
    selectedCowStatus = null;
    cowProvider.controller.clear();
    cowProvider.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final cowProvider = Provider.of<CowProvider>(context);

    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleRow(textTitle: "Cow Status"),
              Row(
                children: [
                  SearchBarCustom(
                    controller: cowProvider.controller,
                    onPressedSearch: () {},
                    onTap: () => applySearch(cowProvider),
                    w: 550,
                    h: 50,
                    keyboardType: TextInputType.text,
                    hintText: "Search...",
                  ),
                  PopupMenuButton<int>(
                    icon: Image.asset('assets/images/sort icon.png'),
                    onCanceled: () {
                      clearFilters(cowProvider);
                    },
                    onSelected: (int value) {
                      applyStatusFilter(value, cowProvider);
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  applyStatusFilter(0, cowProvider);
                                },
                                child: const Text(
                                  'only Normal cows',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  clearFilters(cowProvider);
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  applyStatusFilter(1, cowProvider);
                                },
                                child: const Text(
                                  'only Abnormal cows',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  clearFilters(cowProvider);
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              FutureBuilder<List<CowModel>>(
                future: fetchCows(cowProvider),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No cows found'),
                    );
                  } else {
                    final cows = snapshot.data!;
                    return SizedBox(
                      height: 770,
                      child: ListView.builder(
                        itemCount: cows.length,
                        itemBuilder: (BuildContext context, index) {
                          final cow = cows[index];
                          return CowStatusRows(
                            cow: cow,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}


