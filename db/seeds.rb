# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker
Product.destroy_all
Article.destroy_all
Blog.destroy_all

100.times do
  product = Product.create(
      name: Company.bs.titleize,
      description: Hacker.phrases.join(' '),
      quantity: Number.digit,
      selling_price: Number.between(from= 1.00, to= 100.00).round(2),
      cost_of_products: Number.between(from= 1.00, to= 100.00).round(2),
      weight: Number.between(from= 1.00, to= 50.00).round(2),
      thumbnail: Avatar.image(slug= nil, size= '100x100', format= 'jpg'),
      full_image: Avatar.image(slug= nil, size= '400x400', format= 'jpg')
  )
  (rand(0..10)).times {
    comment = product.comments.create(
        author: Name.name,
        opinion: Hacker.phrases.join(' '),
        rating: Number.between(from= 1, to= 5).round(0),
    )
  }
end

100.times do
  article = Article.create(
      title: Company.bs.titleize,
      author: Name.name,
      published_date: Time.at(rand * Time.now.to_i),
      published: Number.between(from= 0, to= 1).round(0),
      content: Hacker.phrases.join(' '),
      thumbnail: Avatar.image(slug= nil, size= '100x100', format= 'jpg')
  )
end

100.times do
  blog = Blog.create(
      title: Company.bs.titleize,
      author: Name.name,
      published_date: Time.at(rand * Time.now.to_i),
      content: Hacker.phrases.join(' ')
  )
  (rand(0..10)).times {
    review = blog.reviews.create(
        author: Name.name,
        opinion: Hacker.phrases.join(' '),
        rating: Number.between(from= 1, to= 5).round(0),
        thumbnail: Avatar.image(slug= nil, size= '100x100', format= 'jpg')
    )
  }
end
admin_user = User.new( :email => 'dave.jones@scc.spokane.edu', :password => '42424242')
admin_user.admin = true
admin_user.save!
