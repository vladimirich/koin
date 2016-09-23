class OperationDecorator < Draper::Decorator
  delegate_all

  def operation_type_sign
    operation_type.debet? ? "+" : "-"
  end

  def human_amount
    return "-" if !amount || amount.zero?
    "#{amount.to_f / 100}p."
  end
end
