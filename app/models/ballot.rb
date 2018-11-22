class Ballot < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :candidate,        class_name: 'Candidate'
  belongs_to :election,         class_name: 'Election',
                                counter_cache: true
end
