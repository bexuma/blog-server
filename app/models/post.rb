class Post < ApplicationRecord
  validates_presence_of :title, :gtext
end
