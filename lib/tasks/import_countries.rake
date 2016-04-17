require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_countries => :environment do

    csv_file_path = 'db/data/Drzava.csv'

    CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
      Country.create!({
                        :code => row[0],
                        :name => row[1],
                        :eu_member => (row[2] == 'D' ? true : false),
                    })
      puts "Row added!"
    end
  end
end