namespace :slurp do
  desc "TODO"
  task users: :environment do

    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "users.csv"))
    user_csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    user_csv.each do |row|
      u = User.new
      u.
      u.save
    end

    puts csv_text
  end

end
