import 'package:flutter/material.dart';

void main() {
  runApp(const AdvertisementApp());
}

class AdvertisementApp extends StatelessWidget {
  const AdvertisementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advertisement App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Lao Sans Pro'),
      // Set initial route to sign-in (assuming you have this)
      // Change to '/home' if you want to test directly
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainNavigationWrapper(),
        '/map': (context) => const MapViewPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/billboard-detail': (context) => const BillboardDetailPage(),
      },
    );
  }
}

// Main Navigation Wrapper with Bottom Navigation
class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;
  bool _showMapOverlay = false;

  final List<Widget> _pages = [const HomePage(), const DashboardPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          // Map overlay
          if (_showMapOverlay) const MapViewPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(4, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(
              'Campaign',
              Icons.campaign,
              0,
              _currentIndex == 0,
            ),
            Container(
              width: 1,
              height: 30,
              color: Colors.black.withOpacity(0.25),
            ),
            _buildBottomNavItem(
              'Dashboard',
              Icons.dashboard,
              1,
              _currentIndex == 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
    String title,
    IconData icon,
    int index,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _showMapOverlay = false; // Hide map when switching tabs
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? const Color(0xFF3B9DAC) : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (isActive)
            Container(
              width: 134,
              height: 5,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3550),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
        ],
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(context),
                const SizedBox(height: 20),

                // Ad Categories Section
                _buildSectionHeader('Ad Categories'),
                const SizedBox(height: 20),
                _buildCategoriesGrid(context),
                const SizedBox(height: 30),

                // Map Button
                _buildMapButton(context),
                const SizedBox(height: 20),

                // Trending Ads Section
                _buildSectionHeader('Trending Ads'),
                const SizedBox(height: 20),
                _buildTrendingAds(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://placehold.co/16x16/ff0000/ffffff?text=📍",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Chennai, TN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Handle profile/menu tap
          },
          child: Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/26x26/cccccc/333333?text=👤",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF110C26),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.89,
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    final categories = [
      {
        'name': 'Billboards',
        'image': 'https://placehold.co/86x86/4CAF50/ffffff?text=📋',
      },
      {
        'name': 'Print Media',
        'image': 'https://placehold.co/86x86/2196F3/ffffff?text=📰',
      },
      {
        'name': 'Digital',
        'image': 'https://placehold.co/86x86/FF9800/ffffff?text=💻',
      },
      {
        'name': 'Cinema',
        'image': 'https://placehold.co/86x86/9C27B0/ffffff?text=🎬',
      },
      {
        'name': 'Metro',
        'image': 'https://placehold.co/86x86/F44336/ffffff?text=🚇',
      },
      {
        'name': 'Influencer',
        'image': 'https://placehold.co/86x86/E91E63/ffffff?text=👥',
      },
      {
        'name': 'BTL',
        'image': 'https://placehold.co/86x86/607D8B/ffffff?text=🎯',
      },
      {
        'name': 'CAB',
        'image': 'https://placehold.co/86x86/795548/ffffff?text=🚗',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryItem(context, categories[index]);
      },
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    Map<String, String> category,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle category selection
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${category['name']} selected')));
      },
      child: Column(
        children: [
          Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: NetworkImage(category['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category['name']!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMapButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/map');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://placehold.co/16x16/4CAF50/ffffff?text=🗺️",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Map',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingAds(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildAdCard(context, index);
      },
    );
  }

  Widget _buildAdCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/billboard-detail');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 216,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://placehold.co/345x216/2196F3/ffffff?text=Billboard+${index + 1}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City Center Billboard',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'VR Mall, Anna Nagar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '₹75,000/week',
                            style: TextStyle(
                              color: Color(0xFF43946C),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 17,
                                height: 17,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://placehold.co/17x17/FFD700/333333?text=⭐",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Map View Page
class MapViewPage extends StatelessWidget {
  const MapViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/400x800/E8F5E8/4CAF50?text=Interactive+Map",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top gradient overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),

          // Bottom gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),

          // Search bar
          Positioned(
            top: 60,
            left: 20,
            right: 70,
            child: Container(
              height: 51,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFEEEEEE)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x7FD3D1D8),
                    blurRadius: 60,
                    offset: Offset(0, 40),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your Location..',
                    style: TextStyle(
                      color: Color(0x7F606679),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Filter button
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFEEEEEE)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x7FD3D1D8),
                    blurRadius: 60,
                    offset: Offset(0, 40),
                  ),
                ],
              ),
              child: const Icon(Icons.tune, color: Color(0x843B9DAC)),
            ),
          ),

          // Billboard card
          Positioned(
            bottom: 100,
            left: 24,
            right: 24,
            child: _buildMapBillboardCard(context),
          ),

          // Back button
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapBillboardCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/billboard-detail');
      },
      child: Container(
        height: 106,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F493D83),
              blurRadius: 32,
              offset: Offset(0, 16),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 79,
              height: 92,
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://placehold.co/79x94/2196F3/ffffff?text=📋",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        color: Color(0xFF3B9DAC),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'City Center Billboard',
                      style: TextStyle(
                        color: Color(0xFF110C26),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Color(0xFF747688),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'VR Mall, Anna Nagar',
                          style: TextStyle(
                            color: Color(0xFF747688),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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

// Billboard Detail Page
class BillboardDetailPage extends StatefulWidget {
  const BillboardDetailPage({super.key});

  @override
  State<BillboardDetailPage> createState() => _BillboardDetailPageState();
}

class _BillboardDetailPageState extends State<BillboardDetailPage> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlay
            _buildImageSection(),

            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAboutSection(),
                  const SizedBox(height: 30),
                  _buildDescriptionsSection(),
                  const SizedBox(height: 30),
                  _buildUploadSection(),
                  const SizedBox(height: 30),
                  _buildFormFields(),
                ],
              ),
            ),

            // Bottom section with total and add to bag
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: double.infinity,
      height: 384,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            "https://placehold.co/390x384/2196F3/ffffff?text=City+Center+Billboard",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Dark overlay at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),

          // Text overlay
          const Positioned(
            bottom: 20,
            left: 34,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'City Center Billboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'VR Mall, Anna Nagar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Date selection buttons
          Positioned(
            bottom: -10,
            left: 17,
            child: _buildDateButton(
              'Start date',
              startDate,
              () => _selectStartDate(),
            ),
          ),
          Positioned(
            bottom: -10,
            right: 17,
            child: _buildDateButton(
              'End date',
              endDate,
              () => _selectEndDate(),
            ),
          ),

          // Back button
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateButton(String label, DateTime? date, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            date != null ? '${date.day}/${date.month}/${date.year}' : label,
            style: const TextStyle(
              color: Color(0xFF3B9DAC),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Impressions : 2.5M',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionsSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descriptions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Lighting : Non - Lit',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Landmark : VR mall',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'ID : 461102',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Impressions : 2.5M',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'If you have your own design\nplease upload here.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.54,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            // Handle file upload
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('File upload feature coming soon!')),
            );
          },
          child: Container(
            width: 133,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload a file',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.upload_file, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: List.generate(4, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Form Field',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      width: double.infinity,
      height: 67,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(4, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Rs.75,000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Added to bag!')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B9DAC),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to bag',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }
}

// Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(),
                const SizedBox(height: 20),

                // Campaign Overview Section
                _buildSectionHeader('Campaign Overview'),
                const SizedBox(height: 20),
                _buildMetricsGrid(),
                const SizedBox(height: 20),

                // Chart Section
                _buildChartSection(),
                const SizedBox(height: 20),

                // Summary Section
                _buildSummarySection(context),
                const SizedBox(height: 30),

                // Campaign Details Section
                _buildSectionHeader('Campaign Details'),
                const SizedBox(height: 20),
                _buildCampaignDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: 23,
          height: 23,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://placehold.co/23x23/cccccc/333333?text=🔔",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF110C26),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.89,
        ),
      ),
    );
  }

  Widget _buildMetricsGrid() {
    final metrics = [
      {
        'title': 'Reach',
        'value': '4500 - 6000',
        'subtitle': 'Estimated Audience Reach',
        'color': const Color(0xFFF0F6FE),
        'valueColor': const Color(0xFF2A4DD0),
        'icon': Icons.people,
      },
      {
        'title': 'Visibility',
        'value': '78%',
        'subtitle': 'Impression Rate',
        'color': const Color(0xFFF9F5FE),
        'valueColor': const Color(0xFF2A4DD0),
        'icon': Icons.visibility,
      },
      {
        'title': 'Conversion',
        'value': '3.2%',
        'subtitle': 'Average Conversion Rate',
        'color': const Color(0xFFF2FDF5),
        'valueColor': const Color(0xFF2A4DD0),
        'icon': Icons.trending_up,
      },
      {
        'title': 'Leads',
        'value': '250-400',
        'subtitle': 'Expected Lead Generation',
        'color': const Color(0xFFFEFBED),
        'valueColor': const Color(0xFFA85923),
        'icon': Icons.star,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 1.98,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        return _buildMetricCard(metrics[index]);
      },
    );
  }

  Widget _buildMetricCard(Map<String, dynamic> metric) {
    return Container(
      decoration: BoxDecoration(
        color: metric['color'],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                metric['title'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(metric['icon'], size: 18, color: metric['valueColor']),
            ],
          ),
          Text(
            metric['value'],
            style: TextStyle(
              color: metric['valueColor'],
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
          Text(
            metric['subtitle'],
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Mock chart area
          Container(
            width: double.infinity,
            height: 148,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1F000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Performance Chart\n(Interactive chart would go here)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Chart labels
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jan',
                style: TextStyle(
                  color: Color(0xFF47569E),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Feb',
                style: TextStyle(
                  color: Color(0xFF47569E),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Mar',
                style: TextStyle(
                  color: Color(0xFF47569E),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Apr',
                style: TextStyle(
                  color: Color(0xFF47569E),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'May',
                style: TextStyle(
                  color: Color(0xFF47569E),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Spends',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              '₹1,50,000',
              style: TextStyle(
                color: Color(0xFF43946C),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'User Ratings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 17,
                  height: 17,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://placehold.co/17x17/FFD700/333333?text=⭐",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  '4.8/5',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // Handle detailed report
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Detailed report feature coming soon!'),
              ),
            );
          },
          child: const Text(
            'View Detailed Report',
            style: TextStyle(
              color: Color(0xFF4E46DC),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.85,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignDetails() {
    final campaigns = [
      {'name': 'Facebook Ad', 'duration': '7 days'},
      {'name': 'Instagram Ad', 'duration': '21 days'},
      {'name': 'Billboards', 'duration': '60 days'},
      {'name': 'Metro Ads', 'duration': '30 days'},
    ];

    return Column(
      children: campaigns.map((campaign) {
        final isFirst = campaigns.indexOf(campaign) == 0;
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                campaign['name']!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isFirst ? 20 : 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                campaign['duration']!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isFirst ? 20 : 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
