# 📽️ **_Trending Movies with Sinatra_** 🎞️

## **_Usage_**
This app is the most ideal place for checking out all the new, trending, and upcoming media around the world! Explore all that my app has to offer and switch back and fourth throughout the tabs to discover popular movies, tv shows, and people!

## **_Installation_**
1. Fork the repository.
2. Set up codespaces, or vscode.
3. run `gem install 'sinatra'` in the command line. 
4. run `ruby app.rb` in the command line to deploy the website

## **_Additional Information_**
Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
