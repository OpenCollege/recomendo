desc "Tasks to be run on release phase of Heroku"

task :release do

  system 'rails db:migrate'

  if ENV['HEROKU_PR_NUMBER'].present?
    puts "Review app detected: PR ##{ENV['HEROKU_PR_NUMBER']}"
    system 'rails db:seed'
    puts "Finished seeding Review App: #{ENV['HEROKU_APP_NAME']}"
  end

end
