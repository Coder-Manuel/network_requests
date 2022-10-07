
# network_requests

An easy-to-use flutter http network requests handler with more functionality than http but more simpler than dio.

Platform  | Supported
------------- | -------------
Android  | ✅
iOS  | ✅
Web  | ✅
Windows  | ✅
Linux  | ✅
Mac  | ✅

## Features

* Interceptors
  > The package adds functionality to add interceptors to http requests.

* Safe Logging
  > The package offers safe logging where logs only happen on an active dart debug vm.

* Error Handling
  > The package offers error handling out of the box to handle __almost all http errors__.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Platform specific configuration

### Android

To allow your application to access the Internet, add the following permission to your AndroidManifest.xml file:

``` xml
    <uses-permission android:name="android.permission.INTERNET"/>
```

## Usage

```dart
import 'package:network_requests/network_requests.dart' as req;

final client = req.NetworkRequest.instance;

// * Add auth header interceptor.
// * Ideally this should be done on the main method before doing any network calls.
client.addInterceptor(AuthHeaderInterceptor());

final url = Uri.https('example.com', 'whatsit/create');
final response = await client.post(url, body: {'name': 'doodle', 'color': 'blue'});

print(response.status);
print(response.message);
print(response.data);
```

## Additional information

The below shows the structure of the __ApiResponse__ class returned from every API call.

Name | Description| Type
| :--- | :--- | :---
status  | The status code returned from the api call | `int`
message  | The status code message received from the api call | `String`
success  | The success status of api call, will be true if the request is successful and false if vice-versa | `bool`
data  | The data received from the api call | `Object`
exception  | The error received from the api call | `Object`
