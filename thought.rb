require 'sequel'

DB = Sequel.connect('postgres://127.0.0.1/ts_dev')

# ---------------------------------------------------------------------
# A Thought is a single, short expression of an idea
# ---------------------------------------------------------------------
class Thought < Sequel::Model
end
