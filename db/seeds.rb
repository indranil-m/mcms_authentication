# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 #writting seeds 


               User.create!(:email => 'admin@mcms.com' ,:password => 'admin123' )

                Role.create!(:title => 'superuser')


                u = User.find_by_email('admin@mcms.com')


                r = Role.find_by_title('superuser')


                RolesUser.create!(:user_id => u.id , :role_id => r.id)

      