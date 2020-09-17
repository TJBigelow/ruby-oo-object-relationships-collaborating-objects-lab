class Artist
    attr_accessor :name
    @@all = []
    def initialize (name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|i| i.artist == self}
    end

    def add_song(name)
        name.artist = self
        self.songs
    end

    def self.find_or_create_by_name(artist_name)
        self.all.find{|i| i.name == artist_name} || self.new(artist_name)
    end

    def print_songs
        songs.each {|i| puts i.name}
    end
end