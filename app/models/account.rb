class Account < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :lockable, :confirmable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  # def timeout_in
  #   if self.poll_manager?
  #     6.hours
  #   else # voter
  #     30.minutes
  #   end
  # end
end
