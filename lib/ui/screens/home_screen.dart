import 'package:central_mobile/api/repository.dart';
import 'package:central_mobile/models/lecturer.dart';
import 'package:central_mobile/ui/widgets/Lecturer_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repository _repository = Repository();
  final List<Lecturer> _lecturers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getLecturers();
  }

  Future<void> _getLecturers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _repository.getLecturers();
      setState(() {
        _lecturers.addAll(result['data']);
      });
    } catch (e) {
      throw Exception('Failed to load lecturers');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildLecturerList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLecturerList() {
    return ListView.builder(
      itemCount: _lecturers.length,
      itemBuilder: (context, index) {
        if (index == _lecturers.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final lecturer = _lecturers[index];

        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card.filled(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                  onTap: () {
                    // Add your onTap code here!
                  },
                  child: Stack(children: [
                    LecturerLayout(lecturer: lecturer),
                    Positioned(
                        child: IconButton(
                      icon: const Icon(Icons.edit_rounded),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    )),
                    Positioned(
                        bottom: 2,
                        right: 2,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_rounded)))
                  ])),
            ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
