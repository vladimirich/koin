class FamilyDecorator < Draper::Decorator
  delegate_all
  decorates_association :users
end
