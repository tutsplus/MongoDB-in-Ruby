class Issue
  STATUSES = %i(new open needs_info cannot_duplicate closed)

  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  validates_presence_of :name, :description

  field :name, type: String
  field :description, type: String
  field :status, type: Symbol, default: :new

  embeds_many :comments
  belongs_to :project
end
