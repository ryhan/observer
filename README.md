observer
========

Keeps an eye out for new tweets. Made by [Ryhan Hassan](https://github.com/ryhan 'Ryhan Hassan')

## Instructions

Once you've included `twitter_observer.js` and jQuery/Zepto, here's how to use observer.

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