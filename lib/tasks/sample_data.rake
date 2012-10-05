namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    # Admin user
    admin = User.create!( name: "Example User",
                          email: "example@railstutorial.org",
                          password: "foobar",
                          password_confirmation: "foobar")
    admin.toggle!(:admin)

    # Create users
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "foobar"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end


    # Create links
    #url => domain_name/user_name
    99.times do |n|
      uri     = Faker::Internet.domain_name
      content = "Website_#{n}"
      Link.create!(content: content, uri: uri)
    end


    random = Random.new
    1000.times do |n|
      user = User.find(random.rand(1..99))
      link = Link.find(random.rand(1..99))

      linkages = user.linkages.find_by_link_id(link.id)

      if linkages.nil?
        user.linkages.build(link_id: link.id).save
      end

      #Linkage.find_or_create_by_user_id_and_link_id(user_id: user.id, link_id: link.id)

    end


  end
end