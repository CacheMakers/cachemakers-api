class Tag < ActiveRecord::Base
  belongs_to :group

  validates :name,
    inclusion: {in: [
           'science',
           'engineering',
           'math',
           'art',
           'mechanics',
           'electronics',
           'programming',
           'digitalDesign',
           '3dprinting',
           'robotics',
           'entrepreneurship'
    ]}
end
