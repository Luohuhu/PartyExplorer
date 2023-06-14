# PartyExplorer

PartyExplorer is a SwiftUI application designed for iOS devices. It presents a user-friendly interface that allows users to explore parties and manage their events. With this application, users can browse through a list of available parties, search for specific ones, and even generate new party events.

## App Structure

The architecture of the application adheres to the Model-View-ViewModel (MVVM) pattern, ensuring a clean separation of concerns. The primary components of the application include:

### Model

The `Party` struct represents each party event with properties:

- `id`: A unique identifier for each party.
- `name`: The name of the party.
- `imgURL`: A URL pointing to an image associated with the party.
- `price`: The price for attending the party.
- `startDate`: The date when the party starts.
- `endDate`: The optional date when the party ends.

### View

The views of the app are designed using SwiftUI's declarative interface:

- `ExploreView`: This is the main user interface of the application, displaying all available parties in a scrollable list. It also includes a search bar and an 'Add' button.
- `CardView`: This reusable component represents a single party. It displays the party's name, image, start and end dates, and price in a card-like view.

### ViewModel

`ExploreViewModel` manages the data to be displayed by `ExploreView`. It generates parties, adds new ones, and filters parties based on the user's search input.

## Features

- **Browse Parties:** The application showcases a list of available parties in a clean and engaging card-like design.
- **Party Details:** Each card displays pertinent details about a party - its name, image, start and end dates, and price.
- **Search for Parties:** Users can search for specific parties by their names. The list of parties updates in real-time according to the search query.
- **Random Party Generation:** Users can add new parties with randomly generated data to the list. These parties have random names, banner images, prices, and start/end dates.

## Preview



![preview.png](/Users/ewiniar/Desktop/UW/Poppin/PartyExplorer/preview.png)

## Installation

To run the PartyExplorer app, clone this repository and open `PartyExplorer.xcodeproj` in Xcode. Then, select a suitable iOS simulator or connect your iOS device to your Mac, select it as the target in Xcode, and click Run.

## License

PartyExplorer is licensed under the terms of the MIT license.
