user = User.create(email: 'user@joinrespectful.com', password: 'test1234', password_confirmation: 'test1234', first_name: 'Respectful', last_name: 'User', phone_number: '999-999-999')
Admin.create!(email: 'admin@joinrespectful.com', password: 'test1234')
passing_locs = ['home', 'hospital', 'hospice', 'other']
religion_culture_types = ['Catholic', 'Buddhist', 'Jewish', 'Chinese']
service_spaces = ['funeral home', 'worship space', 'another space']
worship_spaces = ['Jewish Temple', 'Holy Cross Church', 'Chapel of Christ', 'Thai Temple']

streets = ['Larking Fork', 'Windy Road', 'Willow Ave']
cities = ['Oakland', 'San Pablo', 'Piedmont']
zips = ['94612', '94710', '94609']
# addresses = []
# 11.times do |i|
#   addresses << Address.create do |a|
#     a.line1 = (i * 10).to_s + ' ' + streets.sample
#     a.city = cities.sample
#     a.state = 'California'
#     a.zip = zips.sample
#   end
# end

5.times do |i|
  Religion.create do |r|
    r.name = religion_culture_types.sample + "#{i}"
  end

  Culture.create do |c|
    c.name = religion_culture_types.sample + "#{i}"
  end

  WorshipSpace.create do |w|
    w.name = worship_spaces.sample
    w.address = Address.create(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
  end

end



passing = Passing.create do |p|
  p.user = user
  p.first_name = "John"
  p.last_name = "Doe"
  p.relation = 'parent'
  p.date_of_birth = Date.yesterday
  p.date_of_passing = Date.today
  p.location_of_passing = passing_locs.sample
  p.passing_address = Address.create(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
end

burial_plan = BurialPlan.create do |b|
  b.passing = passing
  b.public_service = true
  b.open_casket = true
  b.private_viewing = true
  b.religious_cultural_service = true
  b.religion_culture_type = religion_culture_types.sample
  b.type_of_service_space = service_spaces.sample
  b.create_service_space_address(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
  b.create_burial_space_address(line1: rand(100).to_s + ' ' + 'San Pablo', city: 'Oakland', state: 'California', zip: '94612')
  b.worship_space_in_mind = true
  b.worship_space = worship_spaces.sample
  b.burial_space_in_mind = true
  b.burial_space_owned = true
  b.completed = true
  b.sent = true
end



cremation_plan = CremationPlan.create do |c|
  c.passing = passing
  c.public_service = false
  c.open_casket = false
  c.private_viewing = false
  c.religious_cultural_service = true
  c.religion_culture_type = religion_culture_types.sample
  c.type_of_service_space = service_spaces.sample
  c.worship_space_in_mind = true
  c.worship_space = worship_spaces.sample
  c.create_service_space_address(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
  c.present_during_cremation = true
  c.place_of_ash_storage = 'temple'
  c.ash_storage_space_in_mind = true
  c.create_ash_storage_address(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
  c.ash_storage_space_owned = false
  c.ash_transit_type = 'mail delivery'
  c.create_ash_delivery_address(line1: rand(100).to_s + ' ' + streets.sample, city: cities.sample, state: 'California', zip: zips.sample)
  c.completed = true
  c.sent = true
end

BurialCemeteryPlan.create do |b|
  b.burial_plan = burial_plan
  b.cemetery_section = 'religous'
  b.cemetery_section_name = religion_culture_types.sample
  b.liner_vault_preference = 'vault'
  b.headstone_preference = 'upright'
  b.double_plot = 'yes'
  b.type_of_double_plot = 'side-by-side'
end

BurialMausoleumPlan.create do |b|
  b.burial_plan = burial_plan
  b.type_of_mausoleum = ['outdoor', 'indoor'].sample
  b.mausoleum_section = 'cultural'
  b.mausoleum_section_name = religion_culture_types.sample
  b.height = 'medium'
  b.double_plot = 'maybe'
end

5.times do |i|
  Lead.create do |l|
    l.name = ['john doe', 'jane doe'].sample + ' ' + i.to_s
    l.phone_number =  '(999) 999-9999'
  end
end


