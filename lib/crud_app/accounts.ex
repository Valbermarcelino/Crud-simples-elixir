defmodule CrudApp.Accounts do
  alias CrudApp.Repo
  alias CrudApp.Accounts.User

  # Criar usuário
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  # Listar usuários
  def list_users do
    Repo.all(User)
  end

  # Buscar usuário por ID
  def get_user!(id), do: Repo.get!(User, id)

  # Atualizar usuário
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  # Deletar usuário
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end
end
