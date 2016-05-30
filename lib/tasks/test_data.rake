namespace :app do

  desc "Generate test data"
  task :generate_test_data => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:generate_test_groups"]



  # Checks and ensures task is not run in production.
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end


  task :generate_test_groups => [:environment] do
    Rake::Task['db:reset'].invoke # Clear test data
    titles = ["Cool Group", "Cooler Group", "Coolest Group"]
    description = "Test Group"
    locations = ["makeshop", "computerlab"]
    times = ["morning", "afternoon", "evening"]
    names = ["Jacob", "Jack", "Jim", "James"]
    tag_names =  [
             'science',
             'engineering',
             'math',
             'art',
             'mechanics',
             'electronics',
             'programming',
             'digitalDesign',
             '3dprinting',
             'robotics',
             'entrepreneurship'
    ]

    for i in 0..100
      title = titles[rand(titles.count)]
      name = names[rand(names.count)]
      location = locations[rand(locations.count)]
      time = times[rand(times.count)]
      group = Group.create(
        title: title,
        description: description,
        location: location,
        time: time,
        leader_email: "test#{i}@example.com",
        leader_name: name
      )
      tags = []
      for i in 0..3
        tags.push(Tag.new(name: tag_names[rand(tag_names.count)]))
      end
      group.tags |=  tags
      group.save
    end
  end
end
