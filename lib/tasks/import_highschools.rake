require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_highschools => :environment do

    csv_file_path = 'db/data/Sr_sola.csv'

    CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
      Highschool.create!({
                        :code => row[0],
                        :name => row[1],
                    })
      puts "Row added!"
    end
  end
end