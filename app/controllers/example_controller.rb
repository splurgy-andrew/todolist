class ExampleController < ApplicationController
  def index
    @examples = Example.all
  end

  def about
  end
end
