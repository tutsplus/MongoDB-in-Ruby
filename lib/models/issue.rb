class Issue
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :description, type: String
end
