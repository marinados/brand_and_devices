Category.destroy_all
User.destroy_all
Device.destroy_all

['Ordinateur', 'Ecran', 'Souris', 'Casque', 'Clé USB'].each do |type|
  Category.create(label: type)
end

User.destroy_all
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
