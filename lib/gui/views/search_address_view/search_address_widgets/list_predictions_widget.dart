import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/provider/address_provider.dart';
import 'package:app_test/gui/widgets/activity_indicator.dart';
import 'package:app_test/data/models/googlePlace/google_place_autocomplete_model.dart';
import 'package:app_test/gui/views/search_address_view/search_address_controller.dart';

class ListPredictions extends StatelessWidget {
  const ListPredictions({Key? key, required this.controller}) : super(key: key);

  final SearchAddressController controller;

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isLoading,
      builder: (_, loading, child) {
        return loading ? const ActivityIndicator() : child!;
      },
      child: Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          itemCount: addressProvider.autocomplete?.predictions?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final PredictionModel prediction =
                addressProvider.autocomplete!.predictions!.elementAt(index);

            return ListTile(
              title: Text(prediction.description!),
              contentPadding: EdgeInsets.zero,
              onTap: () => SearchAddressController(context)
                  .selectedPrediction(prediction),
            );
          },
        ),
      ),
    );
  }
}
