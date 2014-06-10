# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
SUBJECTS = ["Fun", "Philosophy", "Science", "Pokemon", "Misc"]

Subject.delete_all
Article.delete_all
Section.delete_all


SUBJECTS.each do |subject|
	s = Subject.find_or_create_by(name: subject) 

	[1,2,3].each do |n|
    a = Article.create! title: "#{s.name}-Article#{n}", subject: s

		[1,2,3].each do |j|
			Section.create! content: "Lorem doller set ipsum blah blah blah"*40, article: a
		end
	end
end

User.find_or_create_by(email: "admin123@example.com") do |a|
  a.admin= true
  a.password = "secret"
  a.password_confirmation = "secret"
end

User.find_or_create_by(email: "anon123@example.com") do |a|
  a.password = "secret"
  a.password_confirmation = "secret"
end