class Car < ActiveRecord::Base
  belongs_to :driver, class_name: 'User', foreign_key: :user_id
  belongs_to :garage
end
