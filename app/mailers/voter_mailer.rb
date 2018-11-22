class VoterMailer < ApplicationMailer
  def invite(election, email, ballot, opts = {})
    @election, @ballot = election, ballot

    mail(to: email, subject: "Election Invitation", content_type: 'text/html')
  end
end
