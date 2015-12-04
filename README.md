# MapDemo

1. Go to the Google Developers Console (https://console.developers.google.com).
2. Select a project, or create a new one.
3. Enable the Google Maps SDK for iOS, and optionally the Google Places API for iOS: Open the API Library in the Google Developers Console. If prompted, select a project or create a new one. Select the Enabled APIs link in the API section to see a list of all your enabled APIs. Make sure that the API is on the list of enabled APIs. If you have not enabled it, select the API from the list of APIs, then select the Enable API button for the API.

4. In the sidebar on the left, select Credentials.
5. If your project doesn't already have an iOS API key, create one now by selecting Add credentials > API key > iOS key.
6. In the resulting dialog, enter your app's bundle identifier. For example: com.example.hellomap. Click Create.

7. Your new iOS API key appears in the list of API keys for your project. An API key is a string of characters, something like this:

 AIzaSyBdVl-cTICSwYKrZ95SuvNw7dbMuDt1KG0

+ Add your API key to your AppDelegate.m as follows:
+ Add the following import statement:
+ @import GoogleMaps;
+ Add the following to your application:didFinishLaunchingWithOptions: method, replacing YOUR_API_KEY with your API key:
+ [GMSServices provideAPIKey:@"YOUR_API_KEY"];



