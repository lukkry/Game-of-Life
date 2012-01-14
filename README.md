# Game of Life

# Description
This is a simple implementation of the popular cellular automaton - Game of Life.  
For more information, please read this: http://en.wikipedia.org/wiki/Conway's_Game_of_Life  

# Details
In this implementation world is considered as a cylinder, so left and right edge are connected. It means that first and last cell in a row are neighbours.  


# Demo
There is an Sinatra app, so you can see how it works in your browser.  
Application uses MongoDB to save every world state, so firstly install it.  
When your mongoDB is ready to use, just go to sinatra_app dir and type  

```ruby
bundle install  
ruby homepage.rb
```
