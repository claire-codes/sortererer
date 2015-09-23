class Abc

	def order_list (unsorted_list)
		unsorted_list.sort_by { |word|
			word.downcase
		}
	end

end
