class CandidateMailer < ApplicationMailer
  def invite(candidate, opts = {})
    @candidate = candidate

    mail(to: @candidate.email, subject: 'Election Invitation', content_type: 'text/html')
  end

  def follow_up(candidate, opts = {})
    @candidate = candidate

    mail(to: @candidate.email, subject: "Election follow up", content_type: 'text/html')
  end
end
