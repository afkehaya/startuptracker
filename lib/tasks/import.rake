namespace :import do 

		desc "Import startups from CSV" 
		task startups: :environment do
			filename = File.join Rails.root "startups.csv"
			counter = 0
			CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
				user = User.assign_from_row(row)
				if user.save
					counter += 1 
				else
					puts "#{startup.company} - #{startup.errors.full_messages.join(",")}" 
				end	
			end	
		puts "Imported #{counter} startups"
	end
end