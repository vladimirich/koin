module Web
  class OperationForm
    include ActiveModel::Model
    include Virtus.model

    attribute :description, String
    attribute :operation_type, String
    attribute :amount, Float
    attribute :source_id, Integer
    attribute :user, User

    validates :description, presence: true
    validates :operation_type, presence: true
    validates :amount, presence: true
    validates :source_id, presence: true
    validates :user, presence: true

    def save
      if valid?
        persist!
        true
      else
        false
      end
    end

    private

    def persist!
      Operation.transaction do
        operation = user.operations.create!(
          description: description,
          operation_type: operation_type,
          amount: amount,
          source_id: source_id
        )
        if operation.operation_type.debet?
          source.increment!(:balance, operation.amount)
        else
          source.decrement!(:balance, operation.amount)
        end
      end
    end

    def source
      @source ||= Source.find(source_id)
    end
  end
end
