import 'package:flutter/material.dart';
import 'package:petnymble/widgets/pet_category.dart';
import 'package:petnymble/provider/pet_provider.dart';
import 'package:petnymble/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var search = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Call loadState() when the screen/widget is initialized
    Provider.of<PetProvider>(context, listen: false).loadState();
    Provider.of<ThemeProvider>(context, listen: false).loadTheme();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          '    Hi Nymble',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Provider.of<ThemeProvider>(context).getTheme == lightMode
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme()
                      },
                      child: const Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme()
                      },
                      child: const Icon(
                        Icons.dark_mode,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.orange,
                  ),
                  Text(
                    'Wayanad, kerala',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                "Let's Find Your Companion",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              TabBar(labelColor: Colors.orange,
                controller: _tabController,
                tabs: const [
                  Tab(text: 'DOG'),
                  Tab(text: 'CAT'),
                  Tab(text: 'BIRDS'),
                  Tab(text: 'FISH'),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: size.height - 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PetCategory(title: 'DOG', search: search),
                    PetCategory(title: 'CAT', search: search),
                    PetCategory(title: 'BIRDS', search: search),
                    PetCategory(title: 'FISH', search: search),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
