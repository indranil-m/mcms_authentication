#default data for mcms_authentication

User.create!(:email => "admin@mcms.com" ,:password => "admin123" )
Role.create!(:title => 'superuser')

u = User.find_by_email('admin@mcms.com')

r = Role.find_by_title('superuser')

RolesUser.create!(:user_id => u.id , :role_id => r.id) #writting seeds 



      