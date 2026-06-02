import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const BahPocApp());
}

class BahPocApp extends StatelessWidget {
  const BahPocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAH POC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F4F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6F084E),
          primary: const Color(0xFF6F084E),
          secondary: const Color(0xFFEBC340),
        ),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}

class ServiceCategory {
  final String title;
  final IconData icon;
  final List<String> items;

  const ServiceCategory({
    required this.title,
    required this.icon,
    required this.items,
  });
}

const categories = [
  ServiceCategory(
    title: 'Lifestyle',
    icon: Icons.local_activity_outlined,
    items: ['Food Deals', 'Events', 'Travel', 'Memberships'],
  ),
  ServiceCategory(
    title: 'Payment',
    icon: Icons.payments_outlined,
    items: ['Transfer Money', 'QR Payment', 'Bill Payment', 'Top Up'],
  ),
  ServiceCategory(
    title: 'Remittance',
    icon: Icons.public_outlined,
    items: ['Send Overseas', 'Exchange Rate', 'Beneficiaries'],
  ),
  ServiceCategory(
    title: 'Investments',
    icon: Icons.trending_up_outlined,
    items: ['Gold Investment', 'Unit Trust', 'Portfolio'],
  ),
  ServiceCategory(
    title: 'Fitness',
    icon: Icons.fitness_center_outlined,
    items: ['Gym Pass', 'Health Rewards', 'Wellness Deals'],
  ),
  ServiceCategory(
    title: 'Promotions',
    icon: Icons.campaign_outlined,
    items: ['Latest Deals', 'Cashback', 'Vouchers'],
  ),
  ServiceCategory(
    title: 'Financing Profile',
    icon: Icons.account_balance_wallet_outlined,
    items: ['Eligibility', 'Personal Financing', 'Home Financing'],
  ),
  ServiceCategory(
    title: 'Accounts',
    icon: Icons.account_balance_outlined,
    items: ['Balance Check', 'Transaction History', 'Statements'],
  ),
  ServiceCategory(
    title: 'Community',
    icon: Icons.groups_outlined,
    items: ['Donations', 'Events', 'Local Causes'],
  ),
];

const weekendDeals = [
  PromoDeal(
    title: 'Weekend Deals',
    subtitle: 'Exclusive rewards, vouchers, and lifestyle offers.',
    imageUrl: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da',
  ),
  PromoDeal(
    title: 'Dining Offers',
    subtitle: 'Enjoy deals from selected restaurants and cafes.',
    imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
  ),
  PromoDeal(
    title: 'Travel Rewards',
    subtitle: 'Discover staycation and travel promotions.',
    imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
  ),
];

class PromoDeal {
  final String title;
  final String subtitle;
  final String imageUrl;

  const PromoDeal({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  // void _goToHome(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (_) => const HomeScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bah_logo.png',
                  width: 180,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    ),
  );
},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF6F084E),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    ),
  );
},
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResult {
  final String label;
  final ServiceCategory category;

  SearchResult(this.label, this.category);
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final name = nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(userName: name),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bah_logo.png',
                  width: 120,
                ),

                const SizedBox(height: 42),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _login,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF6F084E),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({
    super.key,
    required this.userName,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  List<SearchResult> results = [];

  @override
  void initState() {
    super.initState();

    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _search(String value) {
    final query = value.toLowerCase().trim();

    if (query.isEmpty) {
      setState(() {
        results = [];
      });
      return;
    }

    final found = <SearchResult>[];

    for (final category in categories) {
      if (category.title.toLowerCase().contains(query)) {
        found.add(SearchResult(category.title, category));
      }

      for (final item in category.items) {
        if (item.toLowerCase().contains(query)) {
          found.add(SearchResult(item, category));
        }
      }
    }

    setState(() {
      results = found.take(5).toList();
    });
  }

  void _openCategory(ServiceCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryScreen(category: category),
      ),
    );
  }

void _selectSearchResult(SearchResult result) {
  final selectedCategory = result.category;

  searchController.clear();

  setState(() {
    results = [];
  });

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => CategoryScreen(category: selectedCategory),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(onSelected: _openCategory),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F4F6),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF6F084E),
        ),
      ),
 body: Stack(
  children: [
    Positioned(
      top: -80,
      right: -120,
      child: IgnorePointer(
        child: Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/images/bg_pattern.png',
            width: 500,
          ),
        ),
      ),
    ),

    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 430),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 40),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello, ${widget.userName}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF6F084E),
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'How can I help you today?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                TextField(
                  focusNode: searchFocusNode,
                  controller: searchController,
                  onChanged: _search,
                  decoration: InputDecoration(
                    hintText: 'Search transfer, accounts, deals...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                QuickShortcutArea(
                  onSelected: _openCategory,
                ),

                const SizedBox(height: 28),

                const WeekendDealsCarousel(),

                const SizedBox(height: 28),

                const WeatherIndicatorCard(),

                const SizedBox(height: 28),

                const PrayerTimeCard(),

                const SizedBox(height: 40),
              ],
            ),

            if (results.isNotEmpty)
              Positioned(
                top: 205,
                left: 20,
                right: 20,
                child: Material(
                  color: Colors.white,
                  elevation: 14,
                  shadowColor: Colors.black26,
                  borderRadius: BorderRadius.circular(18),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: results.map((result) {
                      return ListTile(
                        leading: Icon(
                          result.category.icon,
                          color: const Color(0xFF6F084E),
                        ),
                        title: Text(result.label),
                        subtitle: Text(result.category.title),
                        onTap: () {
                          _selectSearchResult(result);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  ],
),
    );
  }
}

class WeekendDealsCarousel extends StatefulWidget {
  const WeekendDealsCarousel({super.key});

  @override
  State<WeekendDealsCarousel> createState() => _WeekendDealsCarouselState();
}

class _WeekendDealsCarouselState extends State<WeekendDealsCarousel> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 145,
          child: PageView.builder(
            controller: _controller,
            itemCount: weekendDeals.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final deal = weekendDeals[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(deal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black45,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          deal.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          deal.subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(weekendDeals.length, (index) {
            final isActive = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF6F084E)
                    : Colors.black26,
                borderRadius: BorderRadius.circular(99),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(ServiceCategory category) onSelected;

  const AppDrawer({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'BAH!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF6F084E),
                ),
              ),
              subtitle: Text('Bruneian at Heart'),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: categories.map((category) {
                  return ListTile(
                    leading: Icon(
                      category.icon,
                      color: const Color(0xFF6F084E),
                    ),
                    title: Text(category.title),
                    onTap: () {
                      Navigator.pop(context);
                      onSelected(category);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final ServiceCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: const Color(0xFFF4F4F6),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Icon(
                category.icon,
                size: 54,
                color: const Color(0xFF6F084E),
              ),
              const SizedBox(height: 16),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose a service below.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 28),
              ...category.items.map((item) {
                return Card(
                  color: Colors.white,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(item),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickShortcutArea extends StatelessWidget {
  final Function(ServiceCategory category) onSelected;

  const QuickShortcutArea({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      categories.firstWhere((c) => c.title == 'Payment'),
      categories.firstWhere((c) => c.title == 'Accounts'),
      categories.firstWhere((c) => c.title == 'Promotions'),
      categories.firstWhere((c) => c.title == 'Lifestyle'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Shortcuts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF6F084E),
          ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shortcuts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final shortcut = shortcuts[index];

            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => onSelected(shortcut),
              child: Column(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6F084E).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      shortcut.icon,
                      color: const Color(0xFF6F084E),
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    shortcut.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class WeatherIndicatorCard extends StatefulWidget {
  const WeatherIndicatorCard({super.key});

  @override
  State<WeatherIndicatorCard> createState() => _WeatherIndicatorCardState();
}

class _WeatherIndicatorCardState extends State<WeatherIndicatorCard> {
  bool isLoading = true;
  String location = 'Bandar Seri Begawan';
  String condition = 'Loading weather...';
  double? temperature;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    const latitude = 4.9031;
    const longitude = 114.9398;

    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current=temperature_2m,weather_code'
      '&timezone=Asia%2FBrunei',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Weather request failed');
      }

      final data = jsonDecode(response.body);
      final current = data['current'];

      setState(() {
        temperature = (current['temperature_2m'] as num).toDouble();
        condition = weatherCodeToText(current['weather_code']);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        condition = 'Weather unavailable';
        temperature = null;
        isLoading = false;
      });
    }
  }

  String weatherCodeToText(dynamic code) {
    switch (code) {
      case 0:
        return 'Clear sky';
      case 1:
      case 2:
      case 3:
        return 'Partly cloudy';
      case 45:
      case 48:
        return 'Foggy';
      case 51:
      case 53:
      case 55:
        return 'Drizzle';
      case 61:
      case 63:
      case 65:
        return 'Rainy';
      case 80:
      case 81:
      case 82:
        return 'Rain showers';
      case 95:
      case 96:
      case 99:
        return 'Thunderstorm';
      default:
        return 'Weather update';
    }
  }

  IconData weatherIcon() {
    if (condition.toLowerCase().contains('rain')) {
      return Icons.water_drop_outlined;
    }

    if (condition.toLowerCase().contains('thunder')) {
      return Icons.thunderstorm_outlined;
    }

    if (condition.toLowerCase().contains('cloud')) {
      return Icons.wb_cloudy_outlined;
    }

    return Icons.wb_sunny_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final tempText = temperature == null ? '--°' : '${temperature!.round()}°C';

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF6F084E).withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              weatherIcon(),
              color: const Color(0xFF6F084E),
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isLoading ? 'Getting local weather...' : condition,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              tempText,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF6F084E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrayerTimeCard extends StatefulWidget {
  const PrayerTimeCard({super.key});

  @override
  State<PrayerTimeCard> createState() => _PrayerTimeCardState();
}

class _PrayerTimeCardState extends State<PrayerTimeCard> {
  bool isLoading = true;
  String nextPrayer = 'Loading...';
  String nextPrayerTime = '--:--';
  Map<String, String> prayerTimes = {};

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes();
  }

  Future<void> fetchPrayerTimes() async {
    const latitude = 4.9031;
    const longitude = 114.9398;

    final url = Uri.parse(
      'https://api.aladhan.com/v1/timings'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&method=3'
      '&timezonestring=Asia/Brunei',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Prayer time request failed');
      }

      final data = jsonDecode(response.body);
      final timings = data['data']['timings'];

      final cleanTimes = {
        'Fajr': cleanTime(timings['Fajr']),
        'Dhuhr': cleanTime(timings['Dhuhr']),
        'Asr': cleanTime(timings['Asr']),
        'Maghrib': cleanTime(timings['Maghrib']),
        'Isha': cleanTime(timings['Isha']),
      };

      final next = getNextPrayer(cleanTimes);

      setState(() {
        prayerTimes = cleanTimes;
        nextPrayer = next['name']!;
        nextPrayerTime = next['time']!;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        nextPrayer = 'Unavailable';
        nextPrayerTime = '--:--';
        isLoading = false;
      });
    }
  }

  String cleanTime(dynamic value) {
    return value.toString().split(' ').first;
  }

  Map<String, String> getNextPrayer(Map<String, String> times) {
    final now = DateTime.now();

    for (final entry in times.entries) {
      final parts = entry.value.split(':');
      final prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerDateTime.isAfter(now)) {
        return {
          'name': entry.key,
          'time': entry.value,
        };
      }
    }

    return {
      'name': 'Fajr',
      'time': times['Fajr'] ?? '--:--',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF6F084E),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: isLoading
          ? const Text(
              'Loading prayer times...',
              style: TextStyle(color: Colors.white),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Prayer Times',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.mosque_outlined,
                      color: Color(0xFFEBC340),
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Next: $nextPrayer',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      nextPrayerTime,
                      style: const TextStyle(
                        color: Color(0xFFEBC340),
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: prayerTimes.entries.map((entry) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        '${entry.key} ${entry.value}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }
}