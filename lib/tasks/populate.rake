namespace :db do

  desc 'populate'
  task populate: :environment do
    User.delete_all
    Site.delete_all
    Page.delete_all

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
        Page.create(name: name, site: site, position: index)
      end

      @page = Page.where(name: 'Home').last

      Block.create(
        page: @page,
        header: 'A Standard Header',
        subheader: 'A Standard Subheader',
        text: 'Lorem ipsum lorem ipsum lorem ipsum'
      )
    end

    domain = Rails.env.development? ? 'localhost' : 'herokuapp.com'

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

    @site = Site.create(
      name: 'Blue Mountain Realty',
      domain: 'bluemountainprorealty.com',
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
