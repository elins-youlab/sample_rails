# frozen_string_literal: true

module ApplicationHelper
  def gender_collection
    %i[male female].map do |gender|
      [translate_gender(gender), gender]
    end
  end

  def translate_gender(gender)
    t(gender, scope: 'activerecord.attributes.genders')
  end
end
