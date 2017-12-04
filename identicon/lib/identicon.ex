defmodule Identicon do

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end



  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map( &mirror_row/1 )
  end

  def mirror_row(row) do
    [first, second | _ ] = row
    row ++ [second, first]
  end

  defp pick_color(%Identicon.Image{hex: [ r, g, b | _ ]} = image) do
    %Identicon.Image{ image | color: {r, g, b} }
  end

  defp hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  
    %Identicon.Image{hex: hex}
  end

end
