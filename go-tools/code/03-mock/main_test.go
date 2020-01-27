package main

import "testing"

func TestSMSService_SendChargeNotification(t *testing.T) {
	type args struct {
		value int
	}
	tests := []struct {
		name    string
		sms     SMSService
		args    args
		wantErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			sms := new(MockMessageService)
			sms.On("SendChargeNotification", 100).Return(nil)
			if err := sms.SendChargeNotification(tt.args.value); (err != nil) != tt.wantErr {
				t.Errorf("SMSService.SendChargeNotification() error = %v, wantErr %v", err, tt.wantErr)
			}

		})
	}
}

func TestMyService_ChargeCustomer(t *testing.T) {
	type fields struct {
		messageService MessageService
	}
	type args struct {
		value int
	}
	tests := []struct {
		name    string
		fields  fields
		args    args
		wantErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			a := MyService{
				messageService: tt.fields.messageService,
			}
			if err := a.ChargeCustomer(tt.args.value); (err != nil) != tt.wantErr {
				t.Errorf("MyService.ChargeCustomer() error = %v, wantErr %v", err, tt.wantErr)
			}
		})
	}
}

func Test_main(t *testing.T) {
	tests := []struct {
		name string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			main()
		})
	}
}
