-module(h1_tests).
-include_lib("eunit/include/eunit.hrl").

p01_test_() ->
	[	
		?_assertEqual(f, p01:last([a,b,c,d,e,f])),
		?_assertEqual([], p01:last([[], [], []])),
		?_assertEqual("last", p01:last(["first", "last"])),
		?_assertEqual(2, p01:last([2])),	
		?_assertException(error, function_clause, p01:last([]))
	].

p02_test_() ->
	[	
		?_assertEqual([e, f], p02:but_last([a,b,c,d,e,f])),
		?_assertEqual([[], []], p02:but_last([[], [], []])),
		?_assertEqual(["first", "second"], p02:but_last(["first", "second"])),
		?_assertException(error, function_clause, p02:but_last([1])),
		?_assertException(error, function_clause, p02:but_last([]))
	].

p03_test_() ->
	[	
		?_assertEqual(d, p03:element_at([a,b,c,d,e,f], 4)),
		?_assertEqual(undefined, p03:element_at([a,b,c,d,e,f], 10)),
		?_assertEqual(1, p03:element_at([1], 1)),
		?_assertEqual(undefined, p03:element_at(["a", "b"], -1))
	].

p04_test_() ->
	[	
		?_assertEqual(0, p04:len([])),
		?_assertEqual(4, p04:len([a,b,c,d])),
		?_assertEqual(2, p04:len([[1], [[[2]]]])),
		?_assertEqual(6, p04:len(["a", "b", "c", "d", "e", "f"]))
	].

p05_test_() ->
	[	
		?_assertEqual([3,2,1], p05:reverse([1,2,3])),
		?_assertEqual([], p05:reverse([])),
		?_assertEqual([[[[2]]], [1]], p05:reverse([[1], [[[2]]]])),
		?_assertEqual([<<"a">>], p05:reverse([<<"a">>]))
	].

p06_test_() ->
	[	
		?_assertEqual(true, p06:is_palindrome([1,2,3,2,1])),
		?_assertEqual(true, p06:is_palindrome([])),
		?_assertEqual(true, p06:is_palindrome([a])),
		?_assertEqual(true, p06:is_palindrome([c,c,c])),
		?_assertEqual(false, p06:is_palindrome([a,b,c])),
		?_assertEqual(false, p06:is_palindrome([2,2,2,2,2,3])),
		?_assertEqual(false, p06:is_palindrome([3,2,2,2,3,2]))
	].

p07_test_() ->
	[	
		?_assertEqual([a,b,c,d,e], p07:flatten([a,[],[b,[c,d],e]])),
		?_assertEqual([a,b,c,d,e,f,g,h,i,j,k], p07:flatten([[a,[b,c,[d,e,[[[]]]],f],g],h,[i,[j]],k])),
		?_assertEqual([1,2,3,4,5], p07:flatten([[1],2,[],[],[[[[3]]], [[[4,[5]]]]]])),
		?_assertEqual([1,2,3,4,5], p07:flatten([1,2,3,4,5])),
		?_assertEqual("one two", p07:flatten(["one", " ", "two"])),
		?_assertEqual([1], p07:flatten([1])),
		?_assertEqual([], p07:flatten([]))
	].

p08_test_() ->
	[	
		?_assertEqual([a,b,c,a,d,e], p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
		?_assertEqual([[a]], p08:compress([[a],[a]])),
		?_assertEqual([[a],[b]], p08:compress([[a],[b]])),
		?_assertEqual([a], p08:compress([a,a,a,a,a,a])),
		?_assertEqual([], p08:compress([]))
	].

p09_test_() ->
	[	
		?_assertEqual([[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]], p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
		?_assertEqual([[a,a,a,a]], p09:pack([a,a,a,a])),
		?_assertEqual([[a]], p09:pack([a])),
		?_assertEqual([], p09:pack([]))
	].

p10_test_() ->
	[	
		?_assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
		?_assertEqual([{4,a}], p10:encode([a,a,a,a])),
		?_assertEqual([{1,a}], p10:encode([a])),
		?_assertEqual([], p10:encode([]))
	].