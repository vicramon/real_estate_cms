Fabricator :block do
  header { Faker::Lorem.sentence(5) }
  subheader { Faker::Lorem.sentence(7) }
  text { Faker::Lorem.paragraph(10) }
end
