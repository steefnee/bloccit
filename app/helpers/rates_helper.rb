module RatesHelper
  def rating_to_buttons(rating)
    raw rating.map { |l| link_to l.severity, rating_path(id: l.id), class: 'btn-xs btn-primary'}
  end
end
