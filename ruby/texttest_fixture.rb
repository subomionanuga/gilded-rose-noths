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
  NormalItem.new(name = "+5 Dexterity Vest", sell_in = 10, quality = 20),
  AgedBrie.new(sell_in = 2, quality = 0),
  NormalItem.new(name = "Elixir of the Mongoose", sell_in = 5, quality = 7),
  Sulfuras.new(sell_in = 0, quality = 80),
  Sulfuras.new(sell_in = -1, quality = 80),
  BackstagePasses.new(sell_in = 15, quality = 20),
  BackstagePasses.new(sell_in = 10, quality = 49),
  BackstagePasses.new(sell_in = 5, quality = 49),
  # This Conjured item does not work properly yet
  Conjured.new(name = "Conjured Mana Cake", sell_in = 2, quality = 12), # <-- :O
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
