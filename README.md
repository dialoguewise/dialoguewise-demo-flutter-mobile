<p align="center">
<a href="https://dialoguewise.com" target="_blank"><img src="https://github.com/dialoguewise/dialoguewise-demo/blob/master/screenshots/logo.PNG?raw=true"></a>
</p>  
<br/>
<h1 align="center">
Headless CMS for Flutter Mobile
</h1>  
<br/>

## About this repo

This is a demo app to show how you can integrate Dialogue Wise with your Flutter mobile apps. If you are new to Flutter checkout the [Flutter documentation](https://flutter.dev/docs) to understand more on how to get started.

## Prerequisite

You will need to download and install Flutter SDK.
More info can be found [here](https://flutter.dev/docs/get-started)

## Getting Started

Once you have your Flutter app setup will first need to import the Dialogue Wise package like in your dart file.

```
import 'package:dialogue_wise/dialogue_wise.dart';
```

Next, we need to prepare the payload by providing the Slug, API key and email hash.

```
var request = new DialogueWiseRequest();
request.slug = '[Your Slug]';
request.apiKey = '[Your API Key]';
request.emailHash='[The hash of your email]';
```

Now that you have the payload ready, all you need to do is to call the service with the payload.

```
var dialogueWiseService = new DialogueWiseService(new http.Client()); 
Map response = await dialogueWiseService.getDialogue(request);
```

You can now run the command pub dev to resolve all the dependencies and then run `dart main.dart` where `main.dart` is the file containing your code.

That’s it! You now have your content in the response variable and you just need to display it on your app.

<br/>

<img src="https://github.com/dialoguewise/dialoguewise-demo-flutter-mobile/blob/master/screenshot/flutter-mobile-app.png?raw=true" height="300"> 

## Tutorial

Check out our Youtube video for a step by step instructions on how to integrate Dialogue Wise.


[![Headless CMS for Flutter](https://img.youtube.com/vi/IjNN4qpC38w/0.jpg)](https://www.youtube.com/embed/IjNN4qpC38w?rel=0)
