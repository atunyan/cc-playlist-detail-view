#  PlaylistDetailView

## Summary
Build a single view application that fetches a playlist and its tracks from given `url` with given `id` and shows the details of a playlist.


### Requirements

- iOS 12.0+
- Xcode 10.1
- Swift 4.0+


### Installing

Project does not use any third party dependency manager.  Before running project add below keys with values in  ```Info.plist``` 
**client_id** -  `ApiClientId` 
**client_secret** -  `ApiClientSecret` 


### Application

Application is written in Swift. MVVM+C architecture pattern was used. 

Coodrinator responsible for app navigation, for that `playlistId` being injected to help easly connect PlaylistDetail screen with previous one - Playlists.

UI components in Storyboard are configured to have dynamic height. However header label is limited to 3 lines.
 

### Testing
Due to time constraints and not required no tests. However code is written with testability in mind.

