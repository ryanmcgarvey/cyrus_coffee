defmodule Cyrus.Order do
  use Cyrus.Web, :model

  schema "orders" do
    field :name, :string
    field :instructions, :string
    field :status, :string

    timestamps
  end

  @required_fields ~w(name instructions status)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
