# This file uses Nat Tuck's Nu Mart as a reference, details see
# https://github.com/NatTuck/nu_mart/
defmodule MicroblogWeb.Authorization do
  def authorized?(nil), do: false
  def authorized?(user) do
    user.authorized
  end
end
