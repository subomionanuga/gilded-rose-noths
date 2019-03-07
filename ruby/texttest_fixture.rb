#!/usr/bin/ruby -w
# require File.join(File.dirname(__FILE__), 'gilded_rose')
require "./lib/gilded_rose"
require "./lib/item"
require "./lib/aged_brie"
require "./lib/sulfuras"
require "./lib/backstage_passes"
require "./lib/conjured"

puts "OMGHAI!"
items = [
  NormalItem.new("+5 Dexterity Vest", 10, 20),
  AgedBrie.new(2, 0),
  NormalItem.new("Elixir of the Mongoose", 5, 7),
  Sulfuras.new(0, 80),
  Sulfuras.new(-1, 80),
  BackstagePasses.new(15, 20),
  BackstagePasses.new(10, 9),
  BackstagePasses.new(5, 49),
  # This Conjured item does not work properly yet
  Conjured.new("Conjured Mana Cake", 2, 12), # <-- :O
]

days = 8
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
