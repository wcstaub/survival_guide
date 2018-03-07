# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subject.destroy_all
Resource.destroy_all
SubjectResources.destroy.all
User.destroy.all
Comment.destroy_all

subjects = Subject.create([
	{name: "HTML", icon: "html.png", description: "Standard markup language for creating web pages and web applications"},
	{name: "CSS", icon: "css.png", description: "Style sheet language used for describing the presentation of a document written in a markup language"}, 
	{name: "Bootstrap", icon: "bootstrap.jpg", description: "Open-source Javascript framework developed at Twitter. A combination of HTML, CSS, and Javascript code designed to help build user interface components"},
	{name: "Ruby", icon: "ruby.png", description: "Dynamic, object-oriented, general-purpose programming language. Designed and developed in the mid-1990s by Yukihiro 'Matz' Matsumoto in Japan"},
	{name: "Rails", icon: "rails.png", description: "Server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework"},
	{name: "SQL", icon: "sql.png", description: "Structured Query Language, a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS)"},
	{name: "Javascript", icon: "js.png", description:  "High-level, interpreted programming language used to make webpages interactive, one of the three core technologies of web content engineering alongside HTML and CSS"},
	{name: "jQuery", icon: "jquery.png", description: "Open source ross-platform JavaScript library designed to simplify the client-side scripting of HTML"},
	{name: "GitHub", icon: "github.png", description: "Web-based hosting service offering distributed version control and source code management using Git"},
	{name: "MVC", icon: "mvc.png", description: "Model View Controller, an architectural pattern dividing applications into three interconnected parts to separate data from the way it is presented to the user"},
	{name: "RubyGems", icon: "gems.png", description: "Package manager for Ruby providing a standard format for distributing, installing and managing Ruby libraries (gems)"},
	{name: "APIs", icon: "api.png", description: "Application Programming Interface, a set of clearly defined methods of communication between software components used to build application software"}
	])

Subject.all.each do |s|
	12.times do
		r = Resource.create(
			name: Faker::Resource.name,
			url: Faker::Resource.url,
			type: Faker::Resource.type,
			description: Faker::Resource.description,
			rank: Faker::Resource.rank,
			comment_ids: []
			)
		subject_resources.create(subject_id:s.id, resource_id: r.id)
		5.times do 
			c = Comment.create(
				body: Faker::Resource.body,
				resource_id: r.id,
				up: 1,
				down: 0,
				user_id: User.Create(
					email: Faker::User.email,
					name: Faker::User.name,
					role: "guest",
					comment_ids: []
				)
				User.find( c.user_id).comment_ids.push(c.id)
				r.comment_ids.push(c.id)
			)
		end
	end
end
