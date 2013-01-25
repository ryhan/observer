###
TwitterObserver
Ryhan Hassan | ryhanh@me.com
###

class @TwitterObserver

  last_tweet_time = 0
  query = ""
  callback = () -> return false

  constructor: (q, cb) ->
    query = q
    callback = cb

  observe: (interval = 5000) -> 
    @update()
    setInterval(@update, interval)

  update: -> fetch_data handle_data

  # Make API request
  fetch_data = (cb) ->
    api = "http://search.twitter.com/search.json?"
    params ="include_entities=true&q=#{query}&callback=?"
    $.getJSON(api + params, cb)

  # Convert API time string to ms
  getTime = (timeString) -> 
    return (new Date(timeString)).getTime()

  # Is this tweet new?
  is_new = (tweet) -> 
    return (getTime(tweet.created_at) > last_tweet_time)

  # Structure tweet meta data
  structure_data = (tweet) -> 
    return {user: tweet.from_user, text: tweet.text}

  # Parses API data
  handle_data = (d) ->
    updates = _.map(_.filter(d.results, is_new), structure_data)
    last_tweet_time = _.max(_.map(_.pluck(d.results, 'created_at'), getTime))
    
    if (updates.length > 0)
      callback(updates)