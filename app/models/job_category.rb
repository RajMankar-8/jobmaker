class JobCategory < ApplicationRecord
 paginates_per 8
 has_many :jobs
 validates :name, presence: true


 def self.ransackable_associations(auth_object = nil)
  ["jobs"]
end

def self.ransackable_attributes(auth_object = nil)
  ["created_at", "id", "name", "updated_at"]
end

end
