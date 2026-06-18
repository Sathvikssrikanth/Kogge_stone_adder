module ks_adder (
    input           clk,
    input           rst,
    input  [15:0]   a,
    input  [15:0]   b,
    input 	        cin,
    output  [15:0] sum,
    output         cout
);

    wire          clk;
    wire          rst;
    wire  [15:0]  a;
    wire  [15:0]  b;
    wire          cin;
    reg  [15:0]   sum;
    reg           cout;

    //Considering internal ks_adder PG variables
    reg [15:0] p;
    reg [15:0] g;
    reg [15:0] p1;
    reg [15:0] g1;
    reg [15:0] p2;
    reg [15:0] g2;
    reg [15:0] p3;
    reg [15:0] g3;

    //Internal Carry register
    reg [15:0] c_int;

    //Temporary registers used to clock the inputs and iutputs
    reg  [15:0]  a_temp;
    reg  [15:0]  b_temp;
    reg          cin_temp;
    reg  [15:0] sum_temp;
    reg          cout_temp;

    //Sequential Block to clock the inputs
    always@(posedge clk, posedge rst)
    begin
	if(rst)
	begin
    	a_temp <= 16'b0;
	    b_temp <= 16'b0;
 	    cin_temp <= 1'b0;
	end
	else 
	begin
	    a_temp <= a;
	    b_temp <= b;
 	    cin_temp <= cin;
	end
    end

    //Sequantial Block to clock the Outputs
    always@(posedge clk, posedge rst)
    begin
	if(rst)
	begin
	    sum <= 16'b0;
            cout <= 1'b0;
	end
	else
	begin
	    sum <= sum_temp;
	    cout <= cout_temp;
	end
    end

    //Adder Combinational Block
    always@(a_temp or b_temp or cin_temp)
    begin
	//Initializing all values to 0
        p    = 16'b0;
        g    = 16'b0;
        p1   = 16'b0;
        g1   = 16'b0;
        p2   = 16'b0;
        g2   = 16'b0;
        p3   = 16'b0;
        g3   = 16'b0;
        c_int = 16'b0;
        sum_temp = 16'b0;
        cout_temp = 1'b0;

	//PG Block computation
	p=a_temp^b_temp;
	g=a_temp&b_temp;

	//Computations for level1 of ks_adder
	g1[0]=(g[0]);
	p1[0]=(p[0]);

	g1[1]=(p[1]&g[0])|g[1];
	p1[1]=(p[1]&p[0]);

	g1[2]=(p[2]&g[1])|g[2];
	p1[2]=p[2]&p[1];

	g1[3]=(p[3]&g[2])|g[3];
	p1[3]=p[3]&p[2];

	g1[4]=(p[4]&g[3])|g[4];
	p1[4]=p[4]&p[3];

	g1[5]=(p[5]&g[4])|g[5];
	p1[5]=p[5]&p[4];

	g1[6]=(p[6]&g[5])|g[6];
	p1[6]=p[6]&p[5];

	g1[7]=(p[7]&g[6])|g[7];
	p1[7]=p[7]&p[6];

	g1[8]=(p[8]&g[7])|g[8];
	p1[8]=p[8]&p[7];

	g1[9]=(p[9]&g[8])|g[9];
	p1[9]=p[9]&p[8];

	g1[10]=(p[10]&g[9])|g[10];
	p1[10]=p[10]&p[9];

	g1[11]=(p[11]&g[10])|g[11];
	p1[11]=p[11]&p[10];

	g1[12]=(p[12]&g[11])|g[12];
	p1[12]=p[12]&p[11];

	g1[13]=(p[13]&g[12])|g[13];
	p1[13]=p[13]&p[12];

	g1[14]=(p[14]&g[13])|g[14];
	p1[14]=p[14]&p[13];

	g1[15]=(p[15]&g[14])|g[15];
	p1[15]=p[15]&p[14];

	//Computations for Level2 of ks_adder
	g2[0]=g1[0];
	p2[0]=p1[0];

	g2[1]=g1[1];
	p2[1]=p1[1];

	g2[2]=(p1[2]&g1[0])|g1[2];
	p2[2]=p1[2]&p1[0];

	g2[3]=(p1[3]&g1[1])|g1[3];
	p2[3]=p1[3]&p1[1];

	g2[4]=(p1[4]&g1[2])|g1[4];
	p2[4]=p1[4]&p1[2];

	g2[5]=(p1[5]&g1[3])|g1[5];
	p2[5]=p1[5]&p1[3];

	g2[6]=(p1[6]&g1[4])|g1[6];
	p2[6]=p1[6]&p1[4];

	g2[7]=(p1[7]&g1[5])|g1[7];
	p2[7]=p1[7]&p1[5];

	g2[8]=(p1[8]&g1[6])|g1[8];
	p2[8]=p1[8]&p1[6];

	g2[9]=(p1[9]&g1[7])|g1[9];
	p2[9]=p1[9]&p1[7];

	g2[10]=(p1[10]&g1[8])|g1[10];
	p2[10]=p1[10]&p1[8];

	g2[11]=(p1[11]&g1[9])|g1[11];
	p2[11]=p1[11]&p1[9];

	g2[12]=(p1[12]&g1[10])|g1[12];
	p2[12]=p1[12]&p1[10];

	g2[13]=(p1[13]&g1[11])|g1[13];
	p2[13]=p1[13]&p1[11];

	g2[14]=(p1[14]&g1[12])|g1[14];
	p2[14]=p1[14]&p1[12];

	g2[15]=(p1[15]&g1[13])|g1[15];
	p2[15]=p1[15]&p1[13];

	//Computations for Level3 of ks_adder
	g3[0]=g2[0];
	p3[0]=p2[0];

	g3[1]=g2[1];
	p3[1]=p2[1];

	g3[2]=g2[2];
	p3[2]=p2[2];

	g3[3]=g2[3];
	p3[3]=p2[3];

	g3[4]=(p2[4]&g2[0])|g2[4];
	p3[4]=p2[4]&p2[0];

	g3[5]=(p2[5]&g2[1])|g2[5];
	p3[5]=p2[5]&p2[1];

	g3[6]=(p2[6]&g2[2])|g2[6];
	p3[6]=p2[6]&p2[2];

	g3[7]=(p2[7]&g2[3])|g2[7];
	p3[7]=p2[7]&p2[3];

	g3[8]=(p2[8]&g2[4])|g2[8];
	p3[8]=p2[8]&p2[4];

	g3[9]=(p2[9]&g2[5])|g2[9];
	p3[9]=p2[9]&p2[5];

	g3[10]=(p2[10]&g2[6])|g2[10];
	p3[10]=p2[10]&p2[6];

	g3[11]=(p2[11]&g2[7])|g2[11];
	p3[11]=p2[11]&p2[7];

	g3[12]=(p2[12]&g2[8])|g2[12];
	p3[12]=p2[12]&p2[8];

	g3[13]=(p2[13]&g2[9])|g2[13];
	p3[13]=p2[13]&p2[9];

	g3[14]=(p2[14]&g2[10])|g2[14];
	p3[14]=p2[14]&p2[10];

	g3[15]=(p2[15]&g2[11])|g2[15];
	p3[15]=p2[15]&p2[11];

	//Final Carry generation for each stage (Level 4 of the adder)
	c_int[0]=g3[0];
	c_int[1]=g3[1];
	c_int[2]=g3[2];
	c_int[3]=g3[3];
	c_int[4]=g3[4];
	c_int[5]=g3[5];
	c_int[6]=g3[6];
	c_int[7]=g3[7];
	c_int[8]=(p3[8]&g3[0])|g3[8];
	c_int[9]=(p3[9]&g3[1])|g3[9];
	c_int[10]=(p3[10]&g3[2])|g3[10];
	c_int[11]=(p3[11]&g3[3])|g3[11];
	c_int[12]=(p3[12]&g3[4])|g3[12];
	c_int[13]=(p3[13]&g3[5])|g3[13];
	c_int[14]=(p3[14]&g3[6])|g3[14];
	c_int[15]=(p3[15]&g3[7])|g3[15];

	//Sum Generation stage
	sum_temp[0]=p[0]^cin_temp;
	sum_temp[1]=p[1]^c_int[0];
	sum_temp[2]=p[2]^c_int[1];
	sum_temp[3]=p[3]^c_int[2];
	sum_temp[4]=p[4]^c_int[3];
	sum_temp[5]=p[5]^c_int[4];
	sum_temp[6]=p[6]^c_int[5];
	sum_temp[7]=p[7]^c_int[6];
	sum_temp[8]=p[8]^c_int[7];
	sum_temp[9]=p[9]^c_int[8];
	sum_temp[10]=p[10]^c_int[9];
	sum_temp[11]=p[11]^c_int[10];
	sum_temp[12]=p[12]^c_int[11];
	sum_temp[13]=p[13]^c_int[12];
	sum_temp[14]=p[14]^c_int[13];
	sum_temp[15]=p[15]^c_int[14];
	cout_temp =c_int[15];         //Final Carry output		 

    end

endmodule
