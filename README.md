The design is only a approximation as implementing a pixel-perfect UI in a short amount of time requires some kind of design documentation. So colors, sizes and paddings are only set to rough approximations. 

The development consisted of:
- setting up a quick and dirty mvvm application with - clean code structure in mind - to provide the json as an easily accesivle data source
- creating a very basic ui only consisting of the overview and the detail view with some basic elements and a navigation between them
- styling a product cell for the products overview
- placing the cells on the overview and styling the overview
- styling the detail page with all required ui funcitonality
- some minor restructuring

No libraries were used as SwiftUI reached a state to solve most UI challenges without help of third party packages

A next step would be to set up a style library component with an impelementation of a given CI design documentation and changing all parts of the UI accordingly and then set up some kind of UI testing
