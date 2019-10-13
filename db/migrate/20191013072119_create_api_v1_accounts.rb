class CreateApiV1Accounts < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_accounts do |t|
      t.string :status
      t.string :content

      t.timestamps
    end
  end
end
