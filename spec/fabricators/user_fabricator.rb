Fabricator :user do
  first_name 'Joe'
  last_name 'Cool'
  email 'joe@example.com'
  password 'password'
  password_confirmation 'password'
end

Fabricator :admin, from: :user do
  admin true
end

Fabricator :super_admin, from: :user do
  super_admin true
end
