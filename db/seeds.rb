# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

subjects = ["Mathematik 1", "Modellierung 1", "Grundlagen digitaler Systeme"]
profs = ["Prof. Meinel", "Prof. Giese", "Dr. Wollowski"]

subjects.each_with_index do |subject,i|
	sub_entry = Subject.create :name => subject
	Prof.create :name => profs[i], :subject_id => sub_entry.id
end

events = ["Vorlesung", "Übung"]
events.each do |event|
	Event.create :name => event
end

handing_ins = ["Klausur", "Testat", "Präsentation", "Hausarbeit"]
handing_ins.each do |handing_in|
	HandingIn.create :name => handing_in
end