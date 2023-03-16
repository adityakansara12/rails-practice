module BirthdateValidate
  private

  def birthdate_cannot_be_in_the_future
    return unless birthdate.present? && birthdate > Date.today

    errors.add(:birthdate, "can't be in the future")
  end
end
