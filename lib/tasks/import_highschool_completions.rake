require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_highschool_completions => :environment do

    csv_file_path = 'db/data/Koncal_sr_sola.csv'

    CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
      HighschoolCompletion.create!({
                        :code => row[0],
                        :name => row[1],
                    })
      puts "Row added!"
    end
  end
end