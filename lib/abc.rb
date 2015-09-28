class Abc

	def order_list (unsorted_list)
		sorted_array = from_textarea_to_array(unsorted_list).sort_by { |word|
			word.downcase
		}
		from_array_to_textarea(sorted_array)
	end

	def from_textarea_to_array(textarea)
		textarea.split("\n")
	end

	def from_array_to_textarea(array)
		array.join("\n")
	end

end
