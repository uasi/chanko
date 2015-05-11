require "spec_helper"
require "chanko/test"

module Chanko
  describe Test do
    let(:view) do
      Class.new(ActionView::Base) do
        include Chanko::Invoker
        include Chanko::Helper
        include Chanko::UnitProxyProvider
      end.new
    end

    describe "#enable_unit" do
      it "forces to enable specified unit" do
        enable_unit(:inactive_unit)
        expect(view.invoke(:inactive_unit, :inactive, :type => :plain)).to eq("inactive")
      end
    end

    describe "#disable_unit" do
      it "forces to disable specified unit" do
        disable_unit(:example_unit)
        expect(view.invoke(:example_unit, :test)).to eq(nil)
      end
    end
  end
end
