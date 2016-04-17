require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_elements => :environment do

    csv_file_path = 'db/data/Element.csv'

    CSV.foreach(csv_file_path, {:headers=>:first_row}) do |row|
      Element.create!({
                        :code => row[0],
                        :name => row[1],
                    })
      puts "Row added!"
    end
  end
end