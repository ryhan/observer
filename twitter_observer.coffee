###
TwitterObserver
Ryhan Hassan | ryhanh@me.com
###

class @TwitterObserver

  constructor: (q = "", cb = () -> false) ->
    last_tweet_time = 0
    query = q
    callback = cb

  watch: (interval = 5000) -> 
    @update()
    setInterval @update, interval

  update: -> fetch_data handle_data

  # Make API request
  fetch_data = (cb) ->
    api = "http://search.twitter.com/search.json?"
    params ="include_entities=true&q=#{query}&callback=?"
    $.getJSON api + params, cb

  # Convert API time string to ms
  getTime = (timeString) -> (new Date timeString).getTime()

  # Is this tweet new?
  is_new = (tweet) -> getTime tweet.created_at > last_tweet_time

  # Structure tweet meta data
  structure_data = (tweet) -> {user: tweet.from_user, text: tweet.text}

  # Parses API data
  handle_data = (d) ->
    updates = _.map _.filter(d.results, is_new), structure_data
    last_tweet_time = _.max _.map(_.pluck(d.results, 'created_at'), getTime)
    callback updates if updates.length > 0