namespace :db do

  desc 'populate'
  task populate: :environment do
    User.delete_all

    super_admins = [
     ['Vic', 'Ramon', 'vic@vicramon.com'],
     ['Richie', 'Gill', 'richiegill@gmail.com']
    ]

    super_admins.each do |user|
      User.create(
        first_name: user[0],
        last_name: user[1],
        email: user[2],
        password: 'password',
        password_confirmation: 'password',
        super_admin: true)
    end

  end

end
