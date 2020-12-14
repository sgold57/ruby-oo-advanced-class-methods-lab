require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(title)
    all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if !self.find_by_name(title)
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end


  def self.parse_song(string)
    parsed = string.split(' - ')
    parsed
  end

  def self.new_from_filename(song)
    track = song.delete_suffix(".mp3")
    track_parsed = parse_song(track)
    artist_name = track_parsed[0]
    track_name = track_parsed[1]

    song = self.new_by_name(track_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song)
    new_from_filename(song).save
  end

  def self.destroy_all
    self.all.clear
  end
  

    




end
