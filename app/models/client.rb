class Client < ApplicationRecord
  
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services
end
