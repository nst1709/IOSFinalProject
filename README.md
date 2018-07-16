# IOSFinalProject
Foodzone – A Restaurant locator application

Application Definition Statement:
Discover restaurants in Rochester area and view details and ratings about the restaurant for an appetizing dining experience.


Features Implemented:
The app will use the Zomato API to get all of the restaurant information.
• Launch screen when the app loads
• Name
• Photo
• Cuisine
• Rating
• Directions to a location
• Price
• URL to the zomato page of the restaurant
• Link to the menu of the restaurant
• Adding a restaurant as a favorite
• Delete restaurants from favorites
• Opening the detailed view of the restaurant from the favorites tab


Wish list of features to be implemented:
• Reviews
• Book a table
• Delivery options
• Directions to the location
• Filter options
• Login options
• Search options


Description of the classes:
* View Controllers: It contains each of the view controllers for each of the app screens
- The HomeVC is a TabBarController where the three categories are described. When the user clicks on either one of the categories, the data for that file is read and the ListVC TabBarController is pushed onto the screen.
- The ListVC uses a custom cell for each of the restaurants in the described category. When the user clicks on one of the restaurants, the detailVC TabBarController is pushed on to screen and the details for that restaurant are passed to the DetailVC file.
- DetailVC again uses two custom cells and one subtitle cell to display the information. The website is launched in safari if the “Visit Website” link is clicked. The “Get Directions” launches the map with directions to that restaurant. The “Add to Favourites” uses the Realm framework to create a restaurant object with the restaurant name and save that in the realm.
- FavouriteVC uses Realm to get all of the objects stored as favorites and displays it in a default cell. Tapping on a restaurant in the favorite list shows the detail view for that restaurant.

* Models:
- Restaurant.swift creates a restaurant object which sets the name, address, rating, cuisine, cost, menu, photos, url and location for each of the restaurant.
- Restaurants.swift file stores all of the restaurants in a restaurant list.

* TableViewCell:
- restaurantTableViewCell is used to create the custom cell for each of the cells used in the ListVC class. There are outlets created for the labels and images are created on the storyboard. Each cell in the ListVC is cast as a restaurantTableviewCell and the outlets are used to populate the labels.
- DetailedTableViewCell is used to create the custom cell for each of the cells used in the DetailVC class. There are outlets created for the labels and images are created on the storyboard. Each cell in the DetailVC is cast as a DetailedTableViewCell and the outlets are used to populate the labels.



Frameworks Used:
* Realm framework to store a restaurant marked as favorite


Tutorials Used:
* https://www.youtube.com/watch?v=GYV6pdFgVXw
* https://realm.io/docs/tutorials/realmtasks/


