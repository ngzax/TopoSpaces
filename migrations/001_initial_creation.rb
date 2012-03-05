Sequel.migration do
  up do
    create_table(:thoughts) do
      String   :name, :null => false, :primary_key => true
      DateTime :dt,   :null => false
      String   :body, :text => true
    end
  end
  
  down do
    drop_table(:thoughts)
  end
end
