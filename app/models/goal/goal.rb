# Goal class
# Fields:
#  [Integer]        id
#  [String]         name
#  [String]         photo_url
#  [Integer]        target
#  [Integer]        current
#  [DateTime]       deleted_at
#  [DateTime]       created_at
#  [DateTime]       updated_at
#  [User::User]     user
#  [Family::Child]  child
#  [[Goal::Action]][]  actions
class Goal::Goal < ActiveRecord::Base
  belongs_to :user, inverse_of: :goals, class_name: 'User::User'
  belongs_to :child, inverse_of: :goals, class_name: 'Family::Child'
  has_many   :actions, class_name: 'Goal::Action'

  # Generates a goal
  # @param [User::User]    user
  # @param [Family::Child] child
  # @param [Integer]       target
  # @param [String]        name
  def initialize(user, child, target, name)
    super()
    self.user = user
    self.child = child
    self.target = target
    self.name = name
    self.current = 0
  end
end