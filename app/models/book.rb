# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  isbn           :string
#  title          :string
#  author         :string
#  publisher      :string
#  date_published :date
#  description    :text
#  img_url        :string
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Book < ActiveRecord::Base

  include AlgoliaSearch
  algoliasearch do
    attribute :isbn, :title, :author, :img_url
    searchableAttributes ['title', 'author', 'unordered(isbn)', 'unordered(img_url)']
  end

  has_many :reservations

end
