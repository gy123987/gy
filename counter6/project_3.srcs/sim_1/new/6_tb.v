//ģ6�������Ĳ����ļ�
`timescale 1ns/1ps
module counter6_tb;
 
reg clk, rst_n, en;
wire[3:0] dout;
wire co;
 
//ʱ���������Ϊ2ns
always
begin
	#1 clk = ~clk;
end
 
//��ʼ��
initial
begin
	clk = 1'b0;
	rst_n = 1'b1;
	en = 1'b0;
	#2 rst_n = 1'b0;
	#2 rst_n = 1'b1; en = 1'b1;    //����ʹ���ź���Ч���Ҳ���λ
	
 
end
 
counter6 u1(.clk(clk), .rst_n(rst_n), .en(en), .dout(dout), .co(co));
 
endmodule
 