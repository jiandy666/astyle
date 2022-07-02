:: Parameter Explain
::	A1		Allman style uses broken braces
::	t		indent=tab
::	N		indent namespaces
::	p		Insert space padding around operators
::	xg		Insert space padding after commas
::	H		Insert space padding between a header (e.g. 'if', 'for', 'while'...) and the following paren
::	k3		align pointer 2 name
::	xj
::	O		keep one line blocks. e.g.
::				if (isFoo)
::				{ isFoo = false; cout << isFoo << endl; }
::	o		keep one line statements. e.g.
::				if (isFoo)
::				{
::					isFoo = false; cout << isFoo << endl;
::				}
::	xC200	max code length = 200

astyle -A1tNpxgHk3xjOoxC200 %*