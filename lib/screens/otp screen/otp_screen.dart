import 'package:nedaj/export.dart';
import 'package:intl/intl.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OtpModel> otps = OtpModel.getOtpModels();
    otps.sort((a, b) => b.date.compareTo(a.date)); // Sort in descending order

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('otp'.tr,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                )),
      ),
      body: otps.isEmpty ? EmptyOtpPage() : _buildOtpList(context, otps),
    );
  }

  Widget _buildOtpList(BuildContext context, List<OtpModel> otps) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          Text(
            'List of Generated OTP\'s',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 26,
                ),
          ),
          Text(
            'Generated OTPs for your payment transactions.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 17,
                ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: otps.length,
              itemBuilder: (context, index) {
                final otp = otps[index];
                final dateString = _getDateString(otp.date);
                final showDateHeader = index == 0 ||
                    dateString != _getDateString(otps[index - 1].date);

                if (showDateHeader) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          dateString,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade600),
                        ),
                      ),
                      _buildOtpContainer(context, otps, index),
                    ],
                  );
                }
                return Container(); // Return an empty container for non-header items
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpContainer(
      BuildContext context, List<OtpModel> otps, int startIndex) {
    final currentDate = _getDateString(otps[startIndex].date);
    final otpsForDay =
        otps.where((otp) => _getDateString(otp.date) == currentDate).toList();

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: otpsForDay.asMap().entries.map((entry) {
          final index = entry.key;
          final otp = entry.value;
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/icons/otp_page_icon.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(otp.otp,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                subtitle: Text(
                    DateFormat('MMM d, yyyy h:mm a').format(otp.date),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                          fontSize: 15,
                        )),
                trailing: IconButton(
                  icon: Icon(Icons.copy, color: Constants.primaryColor),
                  onPressed: () => _copyToClipboard(context, otp.otp),
                ),
              ),
              if (index < otpsForDay.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(height: 1, color: Colors.grey.shade100),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  String _getDateString(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));

    if (date.isAfter(today)) {
      return 'Today';
    } else if (date.isAfter(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, y').format(date);
    }
  }

  void _copyToClipboard(BuildContext context, String otp) {
    Clipboard.setData(ClipboardData(text: otp));
  }
}

