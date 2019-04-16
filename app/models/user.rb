# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 #makes sure every user has a first name
  validates :first_name, :presence => true
  
  #counts number of bookmarks a particular user has, looks for user_id, command is var_name.bookmarks
  has_many :bookmarks, :class_name => "Bookmark", :foreign_key => "user_id"
  
  #counts number of bookmarks a movie has
  has_many :movies, :through => :bookmarks, :source => :movie
  
end
