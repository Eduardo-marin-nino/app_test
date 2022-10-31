import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/gui/widgets/app_bar.dart';
import 'package:app_test/gui/widgets/button_generic.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:app_test/core/provider/address_provider.dart';

import 'search_address_controller.dart';
import 'search_address_widgets/list_predictions_widget.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  @override
  void initState() {
    context.read<AddressProvider>().autocompleteWithOutNotification = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SearchAddressController controller = SearchAddressController(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Buscar dirección"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
        child: Column(
          children: [
            TextFormInput(
              hintText: 'Ingresa una dirección',
              onChanged: controller.searchAddress,
            ),
            ListPredictions(
              controller: controller,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
        child: ButtonWidget(
          height: 50,
          label: 'Buscar en el mapa',
          onTap: controller.findAddressMap,
        ),
      ),
    );
  }
}
