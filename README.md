
# BBDB
This app is based on https://www.bobsburgersapi.com API.\
View and favorite information about characters, episodes, credits, and more from the animated series "Bob's Burgers".\
An app also has a machine learning model that will predict which Bob's Burgers character you look like.

I'v made this project for educational purposes, to use it as a reference for SwiftUI functionality.
The main functionality that was applied in this project are described below.

Views:
- Spacer()
- Text (.font, .padding, .background, .clipShape)
- Color (.ignoresSafeArea)
- RoundedRectangle (.stroke)
- Image (.resizable, .scaledToFill, .scaledToFit, .frame, .rotationEffect, .opacity, .ignoresSafeArea, .onAppear, withAnimation, .renderingMode, .foregroundColor)
- AsyncImage (.frame, .background, .clipShape, .overlay)
- Link
- ZStack, VStack, HStack (.containerRelativeFrame, .padding, .background, .opacity, .clipShape, .overlay, .padding, .font, .onAppear)
- ForEach
- TabView (.accentColor, .frame, .padding, .tabItem, .toolbarBackground, .tabViewStyle)
- NavigationStack (.toolbar, .onAppear)
- ToolbarItem
- ScrollView (.containerRelativeFrame, .padding, .background, .clipShape)

Extensions for:
- Font
- Image
- Date
- UserDefaults

Useful functionality:
- String Catalog (Localizable for En and Ru with adaptive fonts)\
 https://developer.apple.com/documentation/Xcode/localizing-and-varying-text-with-a-string-catalog
- Date (.now, .distance, .distantPast)
- Networking (URL, URLSession)
- UserDefaults (.set, .data)
- SwiftData (.modelContainer, @Environment(\.modelContext), @Query, .insert )

This project contains almost everything I know at the moment about SwiftUI and Swift programming.

Disclaimer:
The project was made for educational purposes only.
