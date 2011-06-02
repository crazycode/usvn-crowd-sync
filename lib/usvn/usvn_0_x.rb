
#  usvn_users;
# +-----------------+--------------+------+-----+---------+----------------+
# | Field           | Type         | Null | Key | Default | Extra          |
# +-----------------+--------------+------+-----+---------+----------------+
# | users_id        | int(11)      | NO   | PRI | NULL    | auto_increment |
# | users_login     | varchar(255) | NO   | UNI | NULL    |                |
# | users_password  | varchar(64)  | NO   |     | NULL    |                |
# | users_lastname  | varchar(100) | YES  |     | NULL    |                |
# | users_firstname | varchar(100) | YES  |     | NULL    |                |
# | users_email     | varchar(150) | YES  |     | NULL    |                |
# | users_is_admin  | tinyint(1)   | NO   |     | NULL    |                |
# | users_secret_id | varchar(32)  | NO   |     | NULL    |                |
# +-----------------+--------------+------+-----+---------+----------------+
class User
  include DataMapper::Resource
  storage_names[:default] = 'usvn_users'

  property :id, Serial, :field => 'users_id'
  property :login, String, :field => 'users_login'
  property :password, String, :field => 'users_password'
  property :lastname, String, :field => 'users_lastname'
  property :firstname, String, :field => 'users_firstname'
  property :email, String, :field => 'users_email'
  property :secret_id, String, :field => 'users_secret_id'
  property :is_admin, Integer, :field => 'users_is_admin'

end

# usvn_groups
# +--------------------+---------------+------+-----+---------+----------------+
# | Field              | Type          | Null | Key | Default | Extra          |
# +--------------------+---------------+------+-----+---------+----------------+
# | groups_id          | int(11)       | NO   | PRI | NULL    | auto_increment |
# | groups_name        | varchar(150)  | NO   | UNI | NULL    |                |
# | groups_description | varchar(1000) | YES  |     | NULL    |                |
# +--------------------+---------------+------+-----+---------+----------------+

class Group
  include DataMapper::Resource
  storage_names[:default] = 'usvn_groups'

  property :id, Serial, :field => 'groups_id'
  property :name, String, :field => 'groups_name'
  property :description, String, :field => 'groups_description'

  def self.create_or_update(names)
    groups = []
    names.each do |name|
      if name =~ /^[a-zA-Z0-9\-\_]+$/
        g = Group.first(:name => name)
        if g.nil?
          g = Group.create(:name => name)
        end
        groups << g
      end
    end
    groups
  end

end

# usvn_users_to_groups
# +-----------+------------+------+-----+---------+-------+
# | Field     | Type       | Null | Key | Default | Extra |
# +-----------+------------+------+-----+---------+-------+
# | users_id  | int(11)    | NO   | PRI | NULL    |       |
# | groups_id | int(11)    | NO   | PRI | NULL    |       |
# | is_leader | tinyint(1) | NO   |     | NULL    |       |
# +-----------+------------+------+-----+---------+-------+
class GroupUser
  include DataMapper::Resource
  storage_names[:default] = 'usvn_users_to_groups'

  property :users_id, Integer, :key => true
  property :groups_id, Integer, :key => true
  property :is_leader, Integer
end
