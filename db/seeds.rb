# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)\

    require 'csv'
    require 'rest-client'
    require 'json'
    
    puts "hello seeds"

    csv_file_loc = Rails.root.join('lib/assets', 'test.csv')
    
    csv_file = File.open(csv_file_loc, "r")
    
    
    CSV.foreach(csv_file, {:col_sep => ",", :quote_char => '&', :headers => [:name, :artist, :year]}) do |row|
        artist_for_api = row[:artist]
        artist_for_api = artist_for_api.gsub(" ","+")
        
        name_for_api = row[:name]
        name_for_api = name_for_api.gsub(" ","+")
        

        album = Album.create do |a|
            #a.name = row[:name]
            url = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=b25b959554ed76058ac220b7b2e0a026&artist=" + artist_for_api + "&album=" + name_for_api + "&format=json"
            response = RestClient.get(url)
            albuminfo = JSON.parse(response)
            
            a.name = albuminfo['album']['name']
            a.artist = albuminfo['album']['artist']
            a.album_art_url_small = albuminfo['album']['image'][1]['#text']
            a.album_art_url_med = a.album_art_url_small = albuminfo['album']['image'][2]['#text']
            a.album_art_url_large = a.album_art_url_small = albuminfo['album']['image'][3]['#text']
            a.track_no = albuminfo['album']['tracks'].length
            #a.runtime = albuminfo['album']
            a.summary = albuminfo['album']['wiki']['content']
            a.year = row[:year]
        end

    end
