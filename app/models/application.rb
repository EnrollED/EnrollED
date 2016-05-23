class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :enrollment
  belongs_to :highschool
  belongs_to :post_of_residence, class_name: 'Post'
  belongs_to :post_for_notification, class_name: 'Post'
  belongs_to :country_of_birth, class_name: 'Country'
  belongs_to :country_of_residence, class_name: 'Country'
  belongs_to :highschool_country, class_name: 'Country'
  belongs_to :citizen
  belongs_to :municipality
  belongs_to :highschool_completion

  validates :sex, :phone, :place_of_residence, :firstname_for_notification, :lastname_for_notification, :place_for_notification, :date_of_birth, :highschool_finished_date,  presence: true

  validates :phone, :numericality => true

  include ActiveModel::Validations
  validates_with ValidateApplicationForm

end