require 'sequel'

DB = Sequel.connect('postgres://localhost/ts_dev')

# ---------------------------------------------------------------------
# A Thought is a single, short expression of an idea
# ---------------------------------------------------------------------
class Thought < Sequel::Model
end
