module ApplicationHelper
  def election_final_message(candidate)
    if candidate.election_has_ended? && candidate.election.is_the_winner?(candidate)
      "Congratulations. You have being elected."
    else
      link_to "Click here to see the result", election_url(candidate.election), class: "btn btn-primary btn-xl"
    end
  end
end
