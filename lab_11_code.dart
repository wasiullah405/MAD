import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _currentIndex = 0;

  final List<String> images = [
    'https://picsum.photos/id/10/300/300',
    'https://picsum.photos/id/20/300/300',
    'https://picsum.photos/id/30/300/300',
    'https://picsum.photos/id/40/300/300',
    'https://picsum.photos/id/50/300/300',
    'https://picsum.photos/id/60/300/300',
    'https://picsum.photos/id/70/300/300',
    'https://picsum.photos/id/80/300/300',
  ];

  final List<Map<String, String>> albums = const [
    {'title': 'Camera', 'count': '42', 'image': 'https://picsum.photos/id/10/300/300'},
    {'title': 'Favorites', 'count': '12', 'image': 'https://picsum.photos/id/20/300/300'},
    {'title': 'Screenshots', 'count': '8', 'image': 'https://picsum.photos/id/30/300/300'},
    {'title': 'Nature', 'count': '20', 'image': 'https://picsum.photos/id/40/300/300'},
  ];

  void _addPhotoDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Photo URL'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter image URL'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    images.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final titles = ['Photos', 'Albums', 'Camera', 'Favorites'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        backgroundColor: Colors.green,
      ),
      body: _buildBody(),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _addPhotoDialog,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildGrid(images, true);
      case 1:
        return _buildAlbumsGrid();
      case 2:
        return _buildCameraScreen();
      case 3:
        return _buildGrid(images.sublist(0, images.length > 3 ? 3 : images.length), false);
      default:
        return _buildGrid(images, true);
    }
  }

  Widget _buildGrid(List<String> list, bool isPhotosTab) {
    return GridView.builder(
      padding: const EdgeInsets.all(6),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  image: list[index],
                  tag: 'img-$index',
                ),
              ),
            );
          },
          child: Hero(
            tag: 'img-$index',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                list[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAlbumsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: albums.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final album = albums[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  album['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              album['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              maxLines: 1,
            ),
            Text(
              '${album['count']} photos',
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCameraScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 60, color: Colors.green),
          const SizedBox(height: 12),
          const Text('Camera Screen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              setState(() {
                images.add('https://picsum.photos/id/85/300/300');
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Photo clicked and saved!')),
              );
            },
            child: const Text('Take Photo', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String image;
  final String tag;

  const DetailPage({
    super.key,
    required this.image,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Hero(
          tag: tag,
          child: Image.network(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
