defmodule SampleApp.UserView do
  use SampleApp.Web, :view

  alias SampleApp.User
  alias SampleApp.Helpers.Gravatar

  def gravatar_for(%User{email: email}) do
    Gravatar.get_gravatar_url(email, 50)
  end
end
