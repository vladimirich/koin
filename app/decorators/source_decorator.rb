class SourceDecorator < Draper::Decorator
  delegate_all

  def human_balance
    return "-" if !balance || balance.zero?
    "#{balance.to_f / 100}p."
  end
end
