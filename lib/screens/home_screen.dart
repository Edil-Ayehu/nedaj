import 'package:nedaj/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch transaction history from Transaction model
    final List<Transaction> transactionHistory =
        Transaction.getSampleTransactions();

    // Fetch services from Service model
    final List<Service> services = Service.getServices();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton( 
        onPressed: () {},
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
          size: 30, 
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFF07AF47),
                    Color(0XFF00471B),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Profile pic avatar
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D'),
                      ),
                      Gap(10),
                      // User full name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                          ),
                          Text(
                            'Full Name',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                  Gap(15),
                  Container(
                    height: 50,
                    width: size.width * 0.35,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      'Account is Linked',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                    )),
                  ),
                  Gap(15),
                  Text(
                    'Collected Points',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    'Collected Points',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30),
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Services
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainServiceContainer(
                          title: 'Stand By',
                          description: 'Set all process before arriving',
                          icon: Icons.qr_code_scanner,
                          onTap: () {},
                        ),
                        MainServiceContainer(
                          title: 'Direct Pay',
                          description: 'Pay by fuel station ID',
                          icon: Icons.qr_code_scanner,
                          onTap: () {},
                        ),
                        MainServiceContainer(
                          title: 'Pay by QR',
                          description: 'Directly pay by station QR',
                          icon: Icons.qr_code_scanner,
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Text('Other Services'),
                    SizedBox(height: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
                    ),
                    SizedBox(height: 18),
                    Text('Recent History'),
                    SizedBox(height: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: transactionHistory.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionHistory[index];
                          return Column(
                            children: [
                              TransactionContainer(
                                transactionId: transaction.transactionId,
                                fuelType: transaction.fuelType,
                                amount: transaction.amount,
                                date: transaction.date,
                              ),
                              Gap(8),
                              if (index != transactionHistory.length - 1)
                                Divider(
                                  color: Colors.grey.shade300,
                                ),
                              Gap(8),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
