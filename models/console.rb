require('pry-byebug')
require('pg')
require_relative('Artist')
require_relative('Album')


Artist1 = Artist.new({ 'name' => 'Oasis'})
Artist2 = Artist.new({ 'name' => 'Blur'})

Artist1.save
Artist2.save

Album1 = Album.new({ 'title' => 'Definitely Maybe', 'genre' => 'Rock', 'artist_id' => Artist1.id })
Album2 = Album.new({ 'title' => 'Blur', 'genre' => 'Rock', 'artist_id' => Artist2.id })
Album3 = Album.new({ 'title' => 'Be Here Now', 'genre' => 'Rock', 'artist_id' => Artist1.id })

Album1.save
Album2.save
Album3.save

binding.pry

nil