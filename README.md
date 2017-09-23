# About
This is a simple hashmap made in ruby using primative types. The hashing function is not very complicated, it is just summing up the ASCII values of the characters in the string and mods them by the number of buckets to give us the bucket id in which our string will be stored. Check out ```spec/hashmap_spec.rb``` for my tests and to see how this puppy is implemented.

Easiest way to run the tests is to run ```rake spec``` from the root directory. You may need to ```bundle install``` before to make sure Rspec is installed properly.
