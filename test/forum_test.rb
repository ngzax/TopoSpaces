require File.dirname(__FILE__) + '/test_helper'

def app
  TopoSpace
end

Forum.instance_eval {
  def All
    f = Array.new
    f << {A: 0}
    f << {B: 0}
    h = {"forums" => f}
    h.to_json
  end
}

describe "Forums" do
  it "Can return a list of Forums at /f" do
    get "/f"
    assert last_response.ok?
    last_response.wont_be_empty
  end
  
  it "Returns a list of Forums as JSON" do
    get "/f"
    last_response.body.must_include "{\"forums\":[{\"A\":0},{\"B\":0}]}"
  end
end

