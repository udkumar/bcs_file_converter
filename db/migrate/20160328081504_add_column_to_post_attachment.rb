class AddColumnToPostAttachment < ActiveRecord::Migration
  def change
    add_column :post_attachments, :convert_t, :string
  end
end
