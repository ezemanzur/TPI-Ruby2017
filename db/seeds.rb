	# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.destroy_all
Evaluation.destroy_all
Course.destroy_all
User.destroy_all

User.create(email: "admin@admin.com", password: "1234567", password_confirmation: "1234567" )
c1 = Course.create(name: "Cursada- Ruby",year: (Date.today.year))
c2 = Course.create(name: "Cursada- Ruby",year: (1.year.from_now.year))
c3 = Course.create(name: "Cursada- Ruby",year: (2.year.from_now.year))

3.times do |i|
  Evaluation.create(title: "Evaluacion #{i}",min_grade: rand(4..9),date: (i.month.from_now + 1.years),course: c1)
end
4.times do |i|
  Evaluation.create(title: "Evaluacion #{i}",min_grade: rand(4..9),date: (i.month.from_now + 2.years),course: c2)
end

6.times do |i|
  Student.create!(name: "Nombre #{i}", lastname: "Apellido #{i}", dni: (i+35610398), number: "#{i}",course: c1)
end
10.times do |i|
  Student.create!(name: "Nombre #{i}", lastname: "Apellido #{i}", dni: (i+35610398), number: "#{i}",course: c2)
end 
c1.evaluations.each do |e|
	e.update set_grade: true
	e.grades.each do |g|
		if rand(0..5) > 1
			g.update grade: rand(0..20)
		end
	end
end
