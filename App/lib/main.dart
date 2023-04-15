import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Item {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  final String title = 'My App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _items = [
    Item(
      id: '1',
      name: 'New York',
      description: 'Place',
      imageUrl: 'https://i.imgur.com/R8dUpdc.jpg',
    ),
    Item(
      id: '2',
      name: 'California',
      description: 'Place',
      imageUrl: 'https://i.imgur.com/Xx4pDaB.jpg',
    ),
    Item(
      id: '3',
      name: 'Florida',
      description: 'Place',
      imageUrl: 'https://i.imgur.com/gc9YLH8.jpg',
    ),
    Item(
      id: '4',
      name: 'Chicago',
      description: 'Place',
      imageUrl: 'https://i.imgur.com/9DCDXpC.png',
    ),
    Item(
      id: '5',
      name: 'Boston',
      description: 'Place',
      imageUrl: 'https://i.imgur.com/6kE4yjV.jpg',
    ),
  ];

  void _addNewItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddItemScreen()))
        .then((newItem) {
      if (newItem != null) {
        setState(() {
          _items.add(newItem);
        });
      }
    });
  }

  void _editItem(Item item) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditItemScreen(item)))
        .then((editedItem) {
      if (editedItem != null) {
        setState(() {
          int itemIndex = _items.indexWhere((item) => item.id == editedItem.id);
          _items[itemIndex] = editedItem;
        });
      }
    });
  }

  void _deleteItem(Item item) {
    setState(() {
      _items.removeWhere((currentItem) => currentItem.id == item.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Items'),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewItem,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.imageUrl),
          ),
          title: Text(item.name),
          subtitle: Text(item.description),
          onTap: () => _editItem(item),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteItem(item),
          ),
        );
      },
    );
  }
}

class EditItemScreen extends StatefulWidget {
  final Item item;

  EditItemScreen(this.item);

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item.name);
    _descriptionController =
        TextEditingController(text: widget.item.description);
    _imageUrlController = TextEditingController(text: widget.item.imageUrl);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Item editedItem = Item(
                      id: widget.item.id,
                      name: _nameController.text,
                      description: _descriptionController.text,
                      imageUrl: _imageUrlController.text,
                    );
                    Navigator.of(context).pop(editedItem);
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _name = '';
    _description = '';
    _imageUrl = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
                onSaved: (value) => _imageUrl = value!,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pop(Item(
                      id: UniqueKey().toString(),
                      name: _name,
                      description: _description,
                      imageUrl: _imageUrl,
                    ));
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
