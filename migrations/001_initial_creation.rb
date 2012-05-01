Sequel.migration do
  up do
    create_table(:communities) do
      String   :name, :null => false, :primary_key => true, :size => 8
      DateTime :dt,   :null => false
    end

    create_table(:forums) do
      String   :name, :null => false, :primary_key => true, :size => 8
      DateTime :dt, :null => false
      String   :community_name, :null => false, :size => 8

      foreign_key :community_name, :communities, :null => false
    end

    create_table(:thoughts) do
      String   :name, :null => false, :primary_key => true, :size => 8
      DateTime :dt,   :null => false
      String   :body, :null => false, :text => true
      String   :forum_name, :null => false, :size => 8

      foreign_key :forum_name, :forums,  :null => false
    end
  end
  
  down do
    drop_table(:thoughts)
    drop_table(:forums)
    drop_table(:communities)
  end
end
