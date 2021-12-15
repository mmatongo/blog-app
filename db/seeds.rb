# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  user = User.create(
	  name: "user#{i}",
	  bio: "I am user#{i}",
	  email: "user#{i}@email.com",
	  password: "password",
	  password_confirmation: "password",
	  confirmed_at: Date.today
  	)
	5.times do |j|
		post = user.posts.create(
			title: "post#{j}",
			body: "I am post#{j}"
		)
		user.likes.create(post: post)
			3.times do |j|
				post.comments.create(
					body: "comment#{j}",
					user: user
				)
			end
		end
end
