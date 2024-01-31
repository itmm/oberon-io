MODULE MyOut;

	VAR out: ARRAY 100 OF CHAR; j: INTEGER;

	PROCEDURE Write(ch: CHAR);
	BEGIN
		out[j] := ch; INC(j)
	END Write;

	PROCEDURE WriteInt(x, n: INTEGER);
		VAR i: INTEGER; a: ARRAY 16 OF CHAR; neg: BOOLEAN;
	BEGIN
		i := 0; neg := x < 0;
		IF neg THEN
			DEC(n);
			IF x < -2147483647 THEN
				a[i] := "8"; INC(i); x := 214748364
			ELSE x := -x END
		END;
		REPEAT
			a[i] := CHR(ORD("0") + x MOD 10); INC(i); x := x DIV 10
		UNTIL x = 0;

		WHILE n > i DO Write(" "); DEC(n) END;
		IF neg THEN Write("-") END;
		REPEAT DEC(i); Write(a[i]); UNTIL i <= 0
	END WriteInt;
BEGIN
	j := 0; WriteInt(0, 0); Write(CHR(0)); ASSERT(out = "0");
	j := 0; WriteInt(123, 2); Write(CHR(0)); ASSERT(out = "123");
	j := 0; WriteInt(-123, 0); Write(CHR(0)); ASSERT(out = "-123");
	j := 0; WriteInt(-123, 6); Write(CHR(0)); ASSERT(out = "  -123");
	j := 0; WriteInt(-2147483647 - 1, 0); Write(CHR(0)); ASSERT(out = "-2147483648")
END MyOut.
