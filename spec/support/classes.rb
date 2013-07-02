class Post < ActiveRecord::Base
  audit_log

  belongs_to :user
end

class Comment < ActiveRecord::Base
  audit_log force: true

  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  belongs_to :branch
  has_many :acl_roles
  has_many :acl_groups, through: :acl_roles
end

class Branch < ActiveRecord::Base
  has_many :users
end

class Home < ActiveRecord::Base
  belongs_to :branch
end

class AclGroup < ActiveRecord::Base
  has_many :acl_roles
  has_many :users, through: :acl_roles
end

class AclRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :acl_group
end
