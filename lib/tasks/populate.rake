namespace :db do

  desc 'populate'
  task populate: :environment do
    User.delete_all
    Site.delete_all
    Page.delete_all
    Block.delete_all

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

    def create_pages_for(site)
      pages = ['Home', 'Neighborhoods', 'Property Search', 'Services', 'Company']

      pages.each_with_index do |name, index|
        Page.create(name: name, site: site, position: index, header: Faker::Lorem.sentence(1))
      end

      @page = Page.where(name: 'Home').last
    end

    def create_agents_for(site)
      agents = ['John Smith', 'Tim McGood', 'Sam Thompson']

      agents.each do |name|
        name = name.split(" ")
        Fabricate(:user, site: site, first_name: name.first,
          last_name: name.last, email: "#{name.first}@example.com")
      end
    end

    def random_image
      ['https://www.filepicker.io/api/file/8tOp8TPhQOOp6pMPg6M0',
       'https://www.filepicker.io/api/file/jGscHQawSCyY3ur6W5dz',
       'https://www.filepicker.io/api/file/v1q0SYClTO2k5TXzZj8C/convert?',
       'https://www.filepicker.io/api/file/pQwNEL4rRleDYaWf6b4z/convert?'].sample
    end

    def create_blocks_for(site)
      site.pages.each do |page|
        5.times do |i|
          Fabricate(:block,
                    page: page,
                    image_url: random_image,
                    image_align: ['left', 'right'].sample,
                    position: i
                   )
        end
      end
    end

    domain = Rails.env.development? ? 'localhost' : 'redwoodprorealty.com'
    @site = Site.create(
      name: 'Redwood Pro Realty',
      domain: domain,
      stylesheet_name: 'redwood',
      email: 'contact@redwoodprorealty.com',
      address: '1234 Forest Lane',
      city: 'Menlo Park',
      state: 'CA',
      zip: '90456',
      header_type: 'right',
      logo_url: 'https://www.filepicker.io/api/file/khot6jcwRvmdl4TAzK5n/convert?',
      phone: '(512) - 445 - 5555')
    create_pages_for(@site)
    create_agents_for(@site)
    create_blocks_for(@site)

    @site = Site.create(
      name: 'Blue Mountain Realty',
      domain: 'herokuapp.com',
      header_type: 'standard',
      stylesheet_name: 'blue_mountain',
      email: 'contact@bluemountainrealty.com',
      address: '1234 Maple Lane',
      city: 'Austin',
      state: 'TX',
      zip: '75205',
      facebook_url: 'https://www.facebook.com/pages/Longhorn-Central-Realty/245619928831057',
      twitter: 'vicramon',
      google_plus_url: 'https://plus.google.com/+VicRamon/',
      logo_url: 'https://www.filepicker.io/api/file/gDdFoNg0T4GuU8ZHWRxP/convert?',
      phone: '(512) - 445 - 5555')
    create_pages_for(@site)

  end

end
