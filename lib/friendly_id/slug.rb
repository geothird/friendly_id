module FriendlyId
  # A FriendlyId slug stored in an external table.
  #
  # @see FriendlyId::History
  class Slug < ActiveRecord::Base
    acts_as_paranoid column_type: 'boolean'
    self.table_name = "friendly_id_slugs"
    belongs_to :sluggable, :polymorphic => true

    def to_param
      slug
    end

  end
end
