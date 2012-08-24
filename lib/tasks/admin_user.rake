namespace :db do
  namespace :seed do
    desc 'Seed roles to database'
    task :admin_user => :environment do
      puts "Seeding admin.."
      User.create(:email => 'qna@test.com',  :password => 'password')
    end
  end
end
