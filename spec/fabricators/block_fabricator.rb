Fabricator :block do
  header { Faker::Lorem.sentence(2) }
  subheader { Faker::Lorem.sentence(3) }
  text { Faker::Lorem.paragraph(10) }
end
