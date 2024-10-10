import 'package:nedaj/export.dart';

class StationContainer extends StatelessWidget {
  final String stationName;
  final String stationID;
  final String stationImageUrl;
  const StationContainer({
    super.key,
    required this.stationName,
    required this.stationID,
    required this.stationImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(stationImageUrl),
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stationName,textScaler: TextScaler.linear(1),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'ID: ',textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                    Text(
                      stationID,textScaler: TextScaler.linear(1),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
