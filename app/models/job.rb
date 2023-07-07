class Job < ApplicationRecord
  include ActionView::Helpers::DateHelper
 
  paginates_per 8
  belongs_to :job_category
  has_one_attached :company_image
  validates :link_to_apply, format: { with: /\A[a-z]{4,5}[\:][\/]{2}[a-z]{3}[\.][a-z0-9]+[\.][a-z]{2,3}\z/,
             message: "only allows https protocol" }
  validates :title, :job_category, :employment_type, :location_type,
            :salary, :link_to_apply, :description, :max_positions,
            :qualification, :job_category_id, :company_image, presence: true

  VALID_STATUSES = ['Public','Archived']

  validates :status, inclusion: { in: VALID_STATUSES }



  EMPLOYMENT_TYPE = ['Full Time', 'Part Time', 'Hybrid', 'Remote job'].freeze
  QUALIFICATION = ['Intermediate', 'Graduated', 'Post Graduated'].freeze
  LOCATION_TYPE = ['Canada', 'US', 'UK', 'Asia','Africa','Australia',
                   'South & Central America','Europe','Mexico','India','Anywhere in the world'].freeze
  SALARY = ['₹13,000 - ₹17,000 a month', '₹25,000 - ₹30,000 a month', '₹30,000 - ₹35,000 a month',
            '₹35,000 - ₹40,000 a month','₹40,000 - ₹45,000 a month','₹45,000 - ₹50,000 a month'].freeze



  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "employment_type", "id", "job_category", "job_category_id", "link_to_apply", "location_type", "max_positions", "qualification", "salary", "title", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["job_category"]
  end

  def archived?
    status == 'Archived'
  end

  def date_status 
    date = Date.today
    month = Date.today.month 
    year = Date.today.year 
    year_calculation = year - self.created_at.to_date.year
    status = (date - self.created_at.to_date).to_i 
    
      if year != self.created_at.year 
        return ("#{year_calculation} year ago")  
      elsif month != self.created_at.month
        return ("#{self.created_at.strftime("%B")}")
      elsif date == self.created_at.to_date
        return ('Today')
      else
        return ("#{status} days")
     end
  end
end
