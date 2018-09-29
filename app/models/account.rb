class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :lockable, :confirmable

  # def timeout_in
  #   if self.poll_manager?
  #     6.hours
  #   else # voter
  #     30.minutes
  #   end
  # end
end
