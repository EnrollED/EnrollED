require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_citizens => :environment do

    csv_file_path = 'db/data/Drzavljan.csv'

    CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
      Citizen.create!({
                        :code => row[0],
                        :name => row[1],
                    })
      puts "Row added!"
    end
  end
end