import 'package:flutter/material.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final List<String> sportsList = [
    'football',
    'volleyball',
    'handball',
    'tennis'
  ];
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode(); // To track focus state
  List<String> filteredList = []; // Stores matching sports

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged); // Listen for text changes
    focusNode.addListener(_onFocusChange); // Listen for focus changes
  }

  @override
  void dispose() {
    controller.removeListener(_onTextChanged);
    focusNode.removeListener(_onFocusChange);
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // When the text field is focused, show all sports
  void _onFocusChange() {
    if (focusNode.hasFocus) {
      setState(() {
        filteredList = List.from(sportsList); // Show full list on focus
      });
    } else {
      setState(() {
        filteredList = []; // Hide list when not focused
      });
    }
  }

  // Filter sports list based on input text
  void _onTextChanged() {
    final query = controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredList =
            List.from(sportsList); // Show full list if input is empty
      } else {
        filteredList = sportsList
            .where((sport) => sport.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode, // Pass the FocusNode here
                  decoration: const InputDecoration(
                      hintText: 'Search a sport',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              if (filteredList.isNotEmpty) _buildSuggestionsList(),
            ],
          ),
        ),
      ),
    );
  }

  // Custom widget to display matching sports
  Widget _buildSuggestionsList() {
    return ListView.builder(
      shrinkWrap: true, // Ensures the list takes minimal space
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(filteredList[index]),
            leading: const Icon(Icons.sports_basketball_outlined),
            onTap: () {
              controller.text = filteredList[index]; // Set selected value
              focusNode.unfocus(); // Unfocus the text field
              setState(() {
                filteredList = []; // Clear list after selection
              });
            },
          ),
        );
      },
    );
  }
}
