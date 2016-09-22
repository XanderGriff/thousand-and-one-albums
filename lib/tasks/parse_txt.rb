puts "hello"
       
File.expand_path File.dirname(__FILE__)       
       
#csv_file_loc = Rails.root.join('libassets', 'test.csv')
=begin
csv_file = File.open(csv_file_loc, "r")


CSV.foreach(csv_file, {:col_sep => ",", :quote_char => '&', :headers => [:name, :artist, :year]}) do |row|
    
    album = Album.create do |a|
        a.name = row[:name]
        puts "hello"
    end
end
=end