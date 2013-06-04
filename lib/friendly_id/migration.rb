class CreateSlugs < ActiveRecord::Migration

  def self.up
    create_table :slugs do |t|
      t.string     :slug,           :null => false
      t.integer    :sluggable_id,   :null => false
      t.string     :sluggable_type, :limit => 40
      t.datetime   :created_at
      t.deleted_at :boolean
    end
    add_index :slugs, :sluggable_id
    add_index :slugs, [:slug, :sluggable_type], :unique => true
    add_index :slugs, :sluggable_type
  end

  def self.down
    drop_table :slugs
  end
end
