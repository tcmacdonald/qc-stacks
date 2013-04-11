Sequel.migration do
  up do
    create_table(:subscribers) do
      primary_key :id
      String :name, null: false
      String :email, null: false
      index :email, unique: true
    end
  end

  down do
    drop_table(:subscribers)
  end
end
