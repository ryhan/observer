observer
========

Keeps an eye out for new tweets. Made by [Ryhan Hassan](https://github.com/ryhan 'Ryhan Hassan').

## What is this I don't even

Instead of pulling tweets from the twitter api yourself, be lazy and use this little tool to watch for tweets containing some term. There are better ways to do this, but hey, yolo.

All you need to do is set a query and a callback. Every time new tweets pop up related to the query, observer will pass an array of tweets back to your callback.

## Instructions

Once you've included `twitter_observer.js`, Underscore, and jQuery/Zepto, here's how to use observer.

```javascript
// Set what terms we want to check for, and a callback that handles new tweets.
var termToObserve = "kittens"
var myCallback = function(tweets){ console.log(tweets); }

// Create the observer
(new twitterObserver(termToObserve, myCallback)).watch()
```

Optionally, you can also 

- Specify how often observer should check for new tweets by passing an integer representing milliseconds to `watch()`, and
- Force observer to check for new tweets at any point using `update()`

```javascript
var myKittenObserver = new twitterObserver(termToObserve, myCallback);

// Check for new kitten tweets once a minute.
myKittenObserver.watch(60000);

// Check for new kitten tweets immediately.
myKittenObserver.update();
```