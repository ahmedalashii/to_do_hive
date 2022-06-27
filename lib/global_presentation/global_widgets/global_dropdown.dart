import '../../constants/exports.dart';

class PrimaryDropDown extends StatelessWidget {
  final List<String> items;
  final String value;

  const PrimaryDropDown({
    Key? key,
    required this.items,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: ColorManager.primary,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
      ),
      child: DropdownButton(
          underline: const SizedBox.shrink(),
          isExpanded: true,
          value: value,
          borderRadius: BorderRadius.circular(8),
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: PrimaryText(value),
            );
          }).toList(),
          onChanged: (value) {}),
    );
  }
}
