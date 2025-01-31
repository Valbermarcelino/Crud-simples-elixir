defmodule CrudAppWeb.UserController do
  use CrudAppWeb, :controller
  alias CrudApp.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    json(conn, users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    json(conn, user)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} -> json(conn, user)
      {:error, changeset} -> conn |> put_status(:unprocessable_entity) |> json(changeset)
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} -> json(conn, user)
      {:error, changeset} -> conn |> put_status(:unprocessable_entity) |> json(changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)
    send_resp(conn, :no_content, "")
  end
end
