# MoviesDBApp
MoviesDBApp
## Description  

Building an ios app that displays a list of now playing, popular, and upcoming
movies from The Movie Database (TMDb) API and allows users to view details of
each movie upon clicking.

MoviesDB is an iOS application that supports three different targets: 
1. **MoviesDB** - General movie database.
2. **ArabicMoviesDB** - A version of the app focused on Arabic movies.
3. **AnmiMoviesDB** - A version of the app focused on anime movies.

Each target has its own build schemes, configuration files, Info.plist, and asset catalog to customize the app accordingly.

---

## Project Structure

### Targets
- **MoviesDB**
- **ArabicMoviesDB**
- **AnmiMoviesDB**

### Schemes
Each target has two schemes for development and production:
- **MoviesDB-Dev**
- **MoviesDB-Production**
- **AnmiMoviesDB-Dev**
- **AnmiMoviesDB-Production**
- **ArabicMoviesDB-Dev**
- **ArabicMoviesDB-Production**

### Configuration Files (.xcconfig)
The project utilizes xcconfig files for different environments:
- **AnmiMoviesDev.xcconfig** - Configuration for AnmiMoviesDB Development
- **AnmiMoviesProduction.xcconfig** - Configuration for AnmiMoviesDB Production
- **ArabicMoviesDev.xcconfig** - Configuration for ArabicMoviesDB Development
- **ArabicMoviesProduction.xcconfig** - Configuration for ArabicMoviesDB Production
- **Development.xcconfig** - General Development settings
- **Release.xcconfig** - General Release settings

### Info.plist Files
Each target has its own `Info.plist` file to customize settings such as:
- Bundle Identifier
- Display Name
- App-Specific Configurations

### Asset Catalogs
Each target has its own asset catalog to store images, icons, and other resources specific to that app version.


## Features  
- **Dynamic Content**: Displays updated content for now playing, popular, and upcoming
movies.  
- **MVVM Architecture**: Ensures maintainable and testable code structure.  
- **Modern UI**:  
  - SwiftUI for a seamless and declarative interface on one screen.  
- **Swift Concurrency**: Handles asynchronous tasks efficiently using `async/await`.  
- **Organize the app's codebase following Domain-Driven Design principles, separating
  concerns into domain, data, and presentation layers.
- **Define domain models representing movie entities and use cases for fetching movie dat
---

## Tech Stack  
- **Languages**: Swift  
- **UI Frameworks**: SwiftUI  
- **Architecture**: MVVM  
- **Concurrency**: Async/Await  
- **Testing**: XCTest for UI and Unit Tests  


## Installation  
1. Clone the repository:  
   ```bash
   git clone git@github.com:AhmedibnAdam/MoviesDBApp.git
