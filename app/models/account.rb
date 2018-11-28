class Account < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :lockable, :confirmable

  has_many :elections,            class_name: "Election"

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def after_confirmation
    RegisterManagerOnBlockchainWorker.perform_async(self.id)
  end

  # def timeout_in
  #   if self.poll_manager?
  #     6.hours
  #   else # voter
  #     30.minutes
  #   end
  # end
end
