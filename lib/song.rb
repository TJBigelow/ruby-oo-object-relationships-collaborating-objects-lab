require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize (name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        array = filename.split(' - ')
        array.each {|value| value.delete_suffix!('.mp3')}
        song = Song.new(array[1])
        song.artist = Artist.find_or_create_by_name(array[0])
        song
      end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end