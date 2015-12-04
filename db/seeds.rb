# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['ordinateur', 'écran', 'souris', 'casque', 'clé USB'].each do |type|
  Category.create(label: type)
end

[
  'Quentin Bordage': 'quentin',
  'Julien Boulenguer': 'julien',
  'Blandine Freté': 'blandine',
  'François Blanchard': 'francois',
  'Victor Thépaut': 'victor',
  'Marie Jocelyn': 'mariej',
  'Lucie Thiollière': 'lucie',
  'Lucas Khidichian': 'lucas',
  'Ludivine Chotard': 'ludivine',
  'Walid Seoudi': 'walid',
  'Tristan Latrasse': 'tristan',
  'Jean-Baptiste Beck': 'jean-baptiste',
  'Mathilde Odin': 'mathilde',
  'Alix Dumarest': 'alix',
  'Benoit Miegeville': 'benoit',
  'Kenneth Grand': 'kenneth',
  'Eléonore Péron': 'eleonore',
  'Thibault Egron': 'thibault',
  'Marina Starkova': 'marina',
  'Cwiosna Roques': 'cwiosna',
  'Yasmine Benhammada': 'yasmine'
].each do |person|
  person.each { |k, v| User.create(name: k, email: v + '@brandandcelebrities.com') }
end
