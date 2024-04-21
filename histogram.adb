---------------------------------------------------
---------------------------------------------------
-- histogram.adb - Display data file as Histogram
-- 13/04/24 - 19/04/24
-- jason bou-samra [ParagonSoft]
---------------------------------------------------

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure histogram is

-- hidden message

S	: String := "histogram (ada verson) jason bou-samra 19/04/2024";

-- declare the necessary variables

N	: Integer := 10000;			-- number of samples (data points)
nbin	: Integer := Integer(sqrt(Float(N)));	-- number of bins ~ sqrt(N) (or nearest integer value if not perfect square)
hist 	: array (1 .. nbin) of float;		-- histogram array	-- put(xmin);
x	: array (1 .. N) of float;		-- array of data points
xmax, xmin : Float;				-- minimum & maximum x data point values
summ	: Float;				-- used to normalise data
dx	: Float;				-- dx = (xmax - xmin) / nbin (delta value)
i, j	: Integer;				-- index variables

fR, fW	: File_Type;
FNr	: constant String := "gauss.dat";	-- in-file (read)
FNw	: constant String := "gauss.out";	-- out-file (write)

begin

-- file operations (read)

Open (fR, In_File, FNr);			-- open read file
i	:= 1;

	while not End_Of_File (fR) loop		-- read data file into memory
		x(i) := float'Value(Get_line(fR));
		i := i + 1;
   end loop;
Close (fR);					-- close read file

-- search for xmin

i 	:= 1;
xmin	:= x(1);

	for i in 1 .. N loop
		if x(i) < xmin then
			xmin := x(i);
		end if;
	end loop;

-- search for xmax

i	:= 1;
xmax	:= x(1);

	for i in 1 .. N loop
		if x(i) > xmax then
			xmax := x(i);
		end if;
	end loop;

-- calculate dx

dx	:= (xmax - xmin) / Float(nbin);

-- Compute Histogram

j	:= 1;

	for j in 1 .. nbin loop
		hist(j) := 0.0;
		i := 1;
		for i in 1 .. N loop
			if ((x(i) >= (xmin + Float(j - 1) * dx) and x(i) < xmin + Float(j) * dx)) then
				hist(j) := hist(j) + 1.0;
			end if;
		end loop;
	end loop;

-- Normalise
i	:= 0;
summ	:= 0.0;

	for i in 1 .. nbin loop
		summ := summ + hist(i);
	end loop;

i	:= 0;

	for i in 1 .. nbin loop
		hist(i) := hist(i) / summ;
	end loop;

-- file operations (write)

Create (fW, Out_File, FNw);

i	:= 1;					-- write memory into data file

	for i in 1 .. nbin loop
		Put (fW, "  ");
		Put (fW, Float'Rounding(xmin + Float(i) * dx),3,4,0);
		Put (fW, "        ");
		Put (fW, hist(i),3,4,0);
		New_Line(fW, 1);
	end loop;
	Close (fW);				-- close write file

Put_Line ("...histogram written to file " & FNw);

end histogram;