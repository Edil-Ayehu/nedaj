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
                  stationName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text(
                      'ID: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      stationID,
                      style: Theme.of(context).textTheme.bodyMedium,
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