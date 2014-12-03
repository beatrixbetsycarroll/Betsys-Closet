require 'faker'

# USER
50.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "test")
end


# ITEM
# generate array of image names
item_types = %w(bag dress jacket jewelry pants scarf shirt shoe skirtsunglasses sweater)

all_images = Array.new
item_types.each_with_index do |item, index|
  type = item_types[index]
  10.times do |i|
    all_images << "#{type}#{i+1}.jpg"
    i += 1
  end
end

#generate an array that simply has all the types for each one the 110 items that will be created, so that we can use this array repeatedly to make tags make sense for what type of item it is
type_array = (item_types*10).sort


# create items
type_array_copy = type_array.dup

110.times do
  Item.create(user_id: rand(1..50), photo: "img/#{all_images.pop}", description: "#{type_array_copy.pop}")
end


# LIKE
# I can't make any duplicate likes, because no user is allowed to like the same thing twice.
# to accomplish this without over complicating things, lets just limit the number of likes per item to one for now. That way no one user can like the same thing twice because no thing is getting liked twice anyways.
# we will still let there be
# so lets create an array of numbers 1 through 110 in a random order that we can pop from when we are creating likes.
one_ten = *(1..110)
randomized_one_ten = one_ten.shuffle

30.times do
  Like.create(user_id: rand(1..50), item_id: randomized_one_ten.pop)
end

#ITEM_TAG_RELATIONSHIP
# create an array of tags such that the tags will match the pictures, so we can use this array in creating tag objects
type_array_copy = type_array.dup

110.times do |index|
  Tag.create(tag: "#{type_array_copy.pop}", item_id: index+1)
end

