require 'pry'
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        found = @@all.find {|artist| artist.name == name}
        if found
            found
        else
            self.new(name)
        end
    end

    def print_songs
        self.songs.select {|song| song.artist == self}
    end
end