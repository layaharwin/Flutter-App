# Flutter-App
## Tasks
Create a responsive Flutter app that displays a list of items and allows the user to add, edit, and delete
items from the list.
1. The app should have a home screen that displays a list of items.
2. The list should be responsive and display differently on different screen sizes.
3. Each item in the list should display the item's name, description, and image.
4. The user should be able to add a new item to the list by tapping a button on the home screen.
5. The add item screen should have fields for the item's name, description, and image.
6. The user should be able to edit an existing item by tapping on it in the list and navigating to an
edit screen.
7. The edit screen should allow the user to update the item's name, description, and image.
8. The user should be able to delete an item from the list by swiping left or right on the item.
9. The app should have a search bar on the home screen that allows the user to search for items by
name or description.
10. The app should have a filter button on the home screen that allows the user to filter the list by a
selected category.
11. The app should have a settings screen that allows the user to change the app's theme color and
font size.

## Report 
### Tasks Completed:
1. The app should have a home screen that displays a list of items.
2. The list should be responsive and display differently on different screen sizes.
3. Each item in the list should display the item's name, description, and image.
4. The user should be able to add a new item to the list by tapping a button on the home screen.
5. The add item screen should have fields for the item's name, description, and image.
6. The user should be able to edit an existing item by tapping on it in the list and navigating to an
edit screen.
7. The edit screen should allow the user to update the item's name, description, and image.
8. The user should be able to delete an item from the list by swiping left or right on the item.

### Code Explanation
The code is a Flutter application that allows the user to manage a list of items. The main screen shows a list of items with their names, descriptions, and images. Each item in the list has a delete button to remove it from the list and an edit button to update its details.

The application consists of three screens:

- HomePage: displays the list of items and allows the user to add new items.
- AddItemScreen: allows the user to enter the details of a new item.
- EditItemScreen: allows the user to edit the details of an existing item.

The main function calls the MyApp widget to start the app. The MyApp widget is a stateless widget that creates an instance of MaterialApp with a title and a home property that creates a HomePage widget.

The HomePage widget is a StatefulWidget that creates a list of Item objects and displays them in a ListView widget. The list of items can be modified by adding, editing, or deleting items. The HomePage widget also has a FloatingActionButton that calls the _addNewItem function when pressed.

The _addNewItem function creates a new screen using Navigator to push a new AddItemScreen onto the stack of screens. The AddItemScreen is a StatefulWidget that allows users to add a new item to the list of items by entering the item's name, description, and image URL. When the user saves the new item, it is added to the list of items in HomePage.

The HomePage widget also has two other functions: _editItem and _deleteItem. These functions are called when the user taps on an item in the list or when the user taps on the delete icon for an item in the list. _editItem and _deleteItem create new screens using Navigator to push EditItemScreen or AlertDialog, respectively.

The EditItemScreen is a StatefulWidget that allows users to edit the name, description, and image URL of an item in the list. When the user saves the changes, the updated item is sent back to HomePage to replace the old item.

The AlertDialog is a dialog that pops up to confirm that the user wants to delete an item from the list. When the user confirms the delete action, the item is removed from the list.

### Concepts Used: 
In terms of important concepts, this code uses Flutter's MaterialApp, Scaffold, ListView, ListTile, FloatingActionButton, TextEditingController, Form, TextFormField, ElevatedButton, CircleAvatar, Navigator, and GlobalKey. It also demonstrates the use of StatefulWidget and setState to manage state changes in the app.

### What I knew in this task
I knew concepts like Flutter's MaterialApp, Scaffold, ListTile, FloatingActionButton, Form, ElevatedButton, CircleAvatar, and GlobalKey that helped me in the task 

###  What I had to research

Research was needed to understand the Navigator class and its methods, as well as the ListView.builder widget and its itemBuilder property. Additionally, some knowledge of the TextEditingController class was required to understand how the TextFormFields were initialized with the current values of the item being edited.

### Results(Screenshots):
Landing Page:
Initially the page has 5 items when you load the app. Here the list represents places in the US.

<img width="268" alt="Screen Shot 2023-04-15 at 1 26 28 AM" src="https://user-images.githubusercontent.com/41572834/232185133-470be6d9-e2d2-4511-9856-856079cece9a.png">
By clicking on any item, you can edit the particular item's attributes like name, description or image url. 

<img width="266" alt="Screen Shot 2023-04-15 at 1 27 15 AM" src="https://user-images.githubusercontent.com/41572834/232185179-d6bf0747-2943-4f30-8c08-36da2cab1479.png">
Name of "New York" was updated as "New York city" as shown below:

<img width="267" alt="Screen Shot 2023-04-15 at 1 27 51 AM" src="https://user-images.githubusercontent.com/41572834/232185200-f6ff2002-2c51-4d62-87f8-4a713c7c93f4.png">

We can add new items by clicking the + sign at the bottom of the image. On clicking the following screen pops up. Details for adding a new item "Texas" is   shown below:

<img width="265" alt="Screen Shot 2023-04-15 at 1 28 36 AM" src="https://user-images.githubusercontent.com/41572834/232185315-8f93a314-a54c-459d-800e-ee130b2ea54c.png">

After the new item is added, the landing page looks the following:

<img width="268" alt="Screen Shot 2023-04-15 at 1 29 01 AM" src="https://user-images.githubusercontent.com/41572834/232185346-8e2fbd9a-0617-4aa3-ab5e-5274a3fb6f9a.png">
There is also an option to delete items from the list. For this you can use the delete sign next to every item. I deleted three items namely Boston, Chicago and Texas. Now the updated list looks the following:

<img width="264" alt="Screen Shot 2023-04-15 at 1 29 42 AM" src="https://user-images.githubusercontent.com/41572834/232185396-e5004b24-3018-4d4c-be2c-2c5b1d1c2f26.png">

This is the overall working of the flutter app. 


