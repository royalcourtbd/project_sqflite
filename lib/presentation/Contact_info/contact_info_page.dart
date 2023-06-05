import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<Map<String, dynamic>> _item = [];
  final shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    refreshItem();
  }

  void refreshItem() {
    final data = shoppingBox.keys.map((key) {
      final item = shoppingBox.get(key);
      return {'key': key, 'name': item['name'], 'number': item['number']};
    }).toList();

    setState(() {
      _item = data.reversed.toList();
      print(_item.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> item) async {
    await shoppingBox.add(item);
    refreshItem();
  }

  Future<void> _updateItem(int key, Map<String, dynamic> item) async {
    await shoppingBox.put(key, item);
    refreshItem();
  }

  Future<void> _deleteItem(int key) async {
    await shoppingBox.delete(key);
    refreshItem();
  }

  void _showForm(BuildContext context, int? itemKey) async {
    if (itemKey != null) {
      final existingitem =
          _item.firstWhere((element) => element['key'] == itemKey);
      _nameController.text = existingitem['name'];
      _numberController.text = existingitem['number'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Number'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItem({
                    'name': _nameController.text.trim(),
                    'number': _numberController.text.trim(),
                  });
                }

                if (itemKey != null) {
                  _updateItem(itemKey, {
                    'name': _nameController.text.trim(),
                    'number': _numberController.text.trim(),
                  });
                }

                _nameController.clear();
                _numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(itemKey == null ? 'Save' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Info')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: _item.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  leading: Text(_item[index]['key'].toString()),
                  title: Text(_item[index]['name']),
                  subtitle: Text(_item[index]['number']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showForm(context, _item[index]['key']);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deleteItem(_item[index]['key']),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
