import 'package:flutter/material.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';

class CountrySelectionDialog extends StatefulWidget {
  final List<CountryData> countries;
  final Function(CountryData) onCountrySelected;

  const CountrySelectionDialog({
    super.key,
    required this.countries,
    required this.onCountrySelected,
  });

  @override
  State<CountrySelectionDialog> createState() => _CountrySelectionDialogState();
}

class _CountrySelectionDialogState extends State<CountrySelectionDialog> {
  CountryData? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Country"),
      content: DropdownButtonFormField<CountryData>(
        value: _selectedCountry,
        hint: const Text("Choose a country"),
        isExpanded: true,
        items: widget.countries.map((country) {
          return DropdownMenuItem<CountryData>(
            value: country,
            child: Text(country.countryName ?? ""),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedCountry = value;
          });
        },
      ),
      actions: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonButtonWidget.button(
              width: MediaQuery.of(context).size.width * 0.25,
              onTap: () {

                Navigator.pop(context);
              },
              buttonColor: redCA0,
              text: "Cancel",
            ),
            CommonButtonWidget.button(
              width: MediaQuery.of(context).size.width * 0.25,
              onTap: () {
                if (_selectedCountry != null) {
                  widget.onCountrySelected(_selectedCountry!);
                  Navigator.pop(context);
                }
              },
              buttonColor: primary,
              text: "Select",
            ),

          ],
        )


      ],
    );
  }
}
