# rubocop:disable Style/GuardClause

module TypesHelper
  def calculate_budget(budget, total)
    if budget.present?
      left = budget - total
      "Initial Budget #{budget} €. Money Left #{left} €"
    end
  end
end

# rubocop:enable Style/GuardClause
