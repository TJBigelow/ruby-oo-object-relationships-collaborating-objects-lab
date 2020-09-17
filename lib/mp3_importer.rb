require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        # binding.pry
        Dir.entries(path).select{|f| f.end_with? '.mp3'}
    end

    def import
        files.each {|f| Song.new_by_filename(f)}
    end

end