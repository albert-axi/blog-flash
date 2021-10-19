class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.match?(/^The\w*/)
      record.errors[:title] << "Title should begin with a 'The'."
    end
  end
end