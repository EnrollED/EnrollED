# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

user = User.new(username: 'admin', firstname: 'Admin', lastname: 'Strator', email: 'admin@example.com', password: 'Supergeslo1')

user.skip_confirmation!
user.save!

user.add_role :admin
user.add_role :admissions

csv_file_path = 'db/data/Drzava.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Country.create!({
                      :code => row[0],
                      :name => row[1],
                      :eu_member => (row[2] == 'D' ? true : false),
                  })
end
puts "Inserted countries"


csv_file_path = 'db/data/Drzavljan.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Citizen.create!({
                      :code => row[0],
                      :name => row[1],
                  })
end
puts "Inserted citizens"


csv_file_path = 'db/data/Obcina.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Municipality.create!({
                           :code => row[0],
                           :name => row[1],
                       })
end
puts "Inserted municipalities"


csv_file_path = 'db/data/Posta.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Post.create!({
                   :code => row[0],
                   :name => row[1],
               })
end
puts "Inserted posts"


csv_file_path = 'db/data/Element.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Element.create!({
                      :code => row[0],
                      :name => row[1],
                  })
end
puts "Inserted elements"


csv_file_path = 'db/data/Koncal_sr_sola.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  HighschoolCompletion.create!({
                                   :code => row[0],
                                   :name => row[1],
                               })
end
puts "Inserted highshool completion"


csv_file_path = 'db/data/Sr_sola.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Highschool.create!({
                         :code => row[0],
                         :name => row[1],
                     })
end
puts "Inserted highschools"


csv_file_path = 'db/data/Poklic.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  Profession.create!({
                         :code => row[0],
                         :name => row[1],
                     })
end
puts "Inserted professions"

csv_file_path = "db/data/Univerza.csv"
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  University.create!({
      :code => row[0],
      :name => row[1],
                     })
end
puts "Inserted universities"

csv_file_path = "db/data/VIS_zavod.csv"
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  HigherEducationInstitution.create!({
      :code => row[0],
      :name => row[1],
      :acronym => row[2],
      :municipality => Municipality.find_by_code(row[3]),
      :university => University.find_by_code(row[4]),
                                     })
end
puts "Inserted higher education institutions"

csv_file_path = "db/data/Vrsta_studija.csv"
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  TypeOfStudy.create!({
      :code => row[0],
      :name => row[1],
                      })
end
puts "Inserted type of study"

csv_file_path = "db/data/Nacin_studija.csv"
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  ModeOfStudy.create!({
                          :code => row[0],
                          :name => row[1],
                      })
end
puts "Inserted mode of study"

enrollment = Enrollment.new(name: '1. rok', study_year: '2016/17', start: '2016-05-15 10:23:54', end: '2016-07-15 10:23:54', created_at: Time.now, updated_at: Time.now, current: true)
enrollment.save!

enrollment2 = Enrollment.new(name: '1. rok', study_year: '2015/16', start: '2015-05-15 10:23:54', end: '2015-07-15 10:23:54', created_at: Time.now, updated_at: Time.now, current: false)
enrollment2.save!

csv_file_path = "db/data/Program.csv"
CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
  StudyProgram.create!({
                          :code => row[3],
                          :name => row[4],
                          :higher_education_institution => HigherEducationInstitution.find_by_code(row[2]),
                          :type_of_study => TypeOfStudy.find_by_code(row[0]),
                          :enrollment => Enrollment.find_by_study_year('2016/17')
                      })
end
puts "Inserted study program"

csv_file_path = 'db/data/KLASIUS-SRV.csv'
CSV.foreach(csv_file_path, {:headers=>:first_row, :col_sep  => ';'}) do |row|
  KlasiusSrv.create!({
                         :code => row[1],
                         :description_sl => row[2],
                         :description_en => row[3],
                         :parent => row[4],
                         :level => row[0]
                     })
end
puts "Inserted KlasiusSRV"

StudyProgramMode.create( study_program: StudyProgram.find_by_name('RAČUNALNIŠTVO IN INFORMATIKA'), mode_of_study: ModeOfStudy.all.find_by_name('REDNI'), number_of_places: '150', number_of_places_foreign: '10' )

