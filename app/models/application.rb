class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :enrollment
  belongs_to :highschool
  belongs_to :post_of_residence, class_name: 'Post'
  belongs_to :post_for_notification, class_name: 'Post'
  belongs_to :citizen

end