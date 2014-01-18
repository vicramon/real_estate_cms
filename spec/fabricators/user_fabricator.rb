Fabricator :user do
  first_name 'Joe'
  last_name 'Cool'
  email 'joe@example.com'
  password 'password'
  password_confirmation 'password'
end

Fabricator :super_admin, from: :user do
  super_admin true
end
