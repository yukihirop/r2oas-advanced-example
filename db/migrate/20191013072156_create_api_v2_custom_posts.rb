class CreateApiV2CustomPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v2_custom_posts do |t|
      t.string :status
      t.string :content

      t.timestamps
    end
  end
end
