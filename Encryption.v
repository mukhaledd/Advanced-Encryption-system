module Encryption#( parameter Nk = 4,parameter Nr = Nk+6 )(in,key,out);
input [0:127] in;
input [0:32*Nk-1] key;
output [0:127] out;

  

wire [0:127] states [0:Nr] ;
wire [0:127] next_subBytes;
wire [0:127] next_shiftRows;
wire [0:128*(Nr+1)-1] fullK;



Key_Expansion #(Nk,Nr) ke(key, fullK);


addRoundKey ark1 (in, fullK[0:127],states[0]);

genvar i;

generate 

	for(i = 1; i < Nr; i = i + 1) begin: encryptionSteps
		encryptionRound er (states[i-1], fullK[128*i +: 128], states[i]);
		end

endgenerate


Byte_sub bs (states[Nr-1], next_subBytes);
shiftRows shr (next_subBytes, next_shiftRows);
addRoundKey ark2 (next_shiftRows  , fullK[128*Nr +: 128], states[Nr]);

assign out = states[Nr];

endmodule




