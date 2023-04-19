package com.kh.mecenat.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor//기본생성자
@AllArgsConstructor//모든필드 매개변수 생성자
@Data
public class Payment {

	private int paymentNo;//	PAYMENT_NO
	private String userId;//	USER_ID
	private String paymentMethod;//	PAYMENT_METHOD
	private Date paymentDate;//	PAYMENT_DATE
	private String paymentDetailTime; // PAYMENT_DETAIL_TIME
	private String paymentStatus;//	PAYMENT_STATUS
	private int paymentAmount;//	PAYMENT_AMOUNT
	private String depositName;//	DEPOSIT_NAME
	private String depositBank;//	DEPOSIT_BANK
	private String cardCompanyCode;//	CARDCOMPANY_CODE
	private String cardNo;//	CARD_NO
	
	private int perfoNo;
	private String perfoTitle;
	private String hallName;
}
