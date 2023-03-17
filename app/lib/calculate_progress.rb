class CalculateProgress
  def initialize(completed, total)
    @completed = completed
    @total = total
  end

  def call
    return 0 if total_is_zero?
    ((completed / total) * 100).round.to_i
  end

  private

  def completed
    @completed.count.to_f
  end

  def total
    @total.count.to_f
  end

  def total_is_zero?
    total.zero?
  end
end
