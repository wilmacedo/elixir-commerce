defmodule Comercio.ProcutsTest do
  use Comercio.DataCase

  alias Comercio.Procuts

  describe "foods" do
    alias Comercio.Procuts.Food

    import Comercio.ProcutsFixtures

    @invalid_attrs %{category: nil, img: nil, name: nil, price: nil}

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Procuts.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Procuts.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{category: "some category", img: "some img", name: "some name", price: "120.5"}

      assert {:ok, %Food{} = food} = Procuts.create_food(valid_attrs)
      assert food.category == "some category"
      assert food.img == "some img"
      assert food.name == "some name"
      assert food.price == Decimal.new("120.5")
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Procuts.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      update_attrs = %{category: "some updated category", img: "some updated img", name: "some updated name", price: "456.7"}

      assert {:ok, %Food{} = food} = Procuts.update_food(food, update_attrs)
      assert food.category == "some updated category"
      assert food.img == "some updated img"
      assert food.name == "some updated name"
      assert food.price == Decimal.new("456.7")
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Procuts.update_food(food, @invalid_attrs)
      assert food == Procuts.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Procuts.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Procuts.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Procuts.change_food(food)
    end
  end
end
