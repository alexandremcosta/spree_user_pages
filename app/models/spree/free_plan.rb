class Spree::FreePlan
  def name
    Spree.t(:free_plan)
  end

  def free?
    true
  end
end
