![](https://github.com/bhavilad/PopularArticlesApp/blob/main/PopularArticlesApp/Resource/homepage.png)

![Swift5](https://img.shields.io/badge/Interface-Swift5-orange)
![Architecture](https://img.shields.io/badge/Clean%20Architecure-MVVM-green)
 

# Popular articals app

Popular articals app is and latest news app build in iOS application built to describe the use of *Clean Architecure* and *MVVM* with *Swift*.


## Table of Contents  
- [Requirements](#requirements)
- [What you can learn?](#whatyoucanlearn)
- [Technical Background](#techbackground)
- [Dependencies](#dependencies)
- [Project Structure](#projectstructure)
- [Features](#features)

<a name="requirements"/>

## Requirements

iOS 14+
Xcode 12.5 and Up


<a name="whatyoucanlearn"/>

## What you can learn?
- You can learn Technologies like
  - Swift
  - Swift Package Dependancies
- You can learn various Design patterns from this project such as
  - Dependency injection
  - Repository, UseCase

<a name="techbackground"/>

## Technical Background
- PopularArticles App is made using Swift as the Core interface with MVVM + Clearn Architecture.. 
- **Alamofire** is used to execute API and get articles.
- **Kingfisher** is used to download images.
- This project was built in the mindset of modularity and good coding patterns. Multiple design patterns like Dependency injection, Repository pattern etc.

<a name="dependencies"/>

## Dependencies

This project uses SPM (Swift Package Manager) as Dependency manager.

 - [Alamofire](https://github.com/Alamofire/Alamofire)
 - [Kingfisher](https://github.com/onevcat/Kingfisher)

<a name="projectstructure"/>

## Project Structure

    PopularTimesApp         # Root Group
    .
    ├── Utilities           # Utilities for Reusable views and extensions
    ├── Extensions          # Some useful extensions
    ├── Presentation        # Contains Swift Views and View Models
    |   └── Views           # Swift Views/UI
    |   └── ViewModel       # Viewmodels for Presenters 
    ├── Domain              # Model files
    |   └── Model           # Entity
    |   └── Usecase         # Usecase can validate and process repository
    ├── Data              # Model files
    |   └── Repository      # Repository files use for api execution
    ├── Network Manager     # Reachability and Networking files
    ├── Test cases          # Test cases for Mock networking
    └── Supporting files    # Misc. files like Appdelegate, SceneDelegate.
