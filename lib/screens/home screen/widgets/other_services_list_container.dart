import 'package:nedaj/export.dart';

class OtherServicesListContainer extends StatelessWidget {
  OtherServicesListContainer({
    super.key,
  });

  // Fetch services from Service model
  final List<Service> services = Service.getServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Column(
            children: [
              OtherServiceContainer(
                icon: service.icon,
                title: service.title,
                description: service.description,
                onTap: service.onTap,
              ),
              Gap(5),
              if (index != services.length - 1)
                Divider(
                  color: Colors.grey.shade300,
                ),
              Gap(5),
            ],
          );
        },
      ),
    );
  }
}