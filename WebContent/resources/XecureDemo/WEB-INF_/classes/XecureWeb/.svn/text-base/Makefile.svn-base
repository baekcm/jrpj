include Makefile.conf

TARGET = enc_server_response.class enc_server_res_xw.class sign_result.class

all: demo ibs_demo 

demo: $(TARGET)

ibs_demo:
	cd ibs; make all
	cd ibs/pri_cert; make all
	cd ibs/pub_cert; make all

clean:
	-rm -f *.class
	cd ibs; make clean
	cd ibs/pri_cert; make clean
	cd ibs/pub_cert; make clean

