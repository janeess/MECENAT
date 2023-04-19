package com.kh.mecenat.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor//기본생성자
@AllArgsConstructor//모든필드 매개변수 생성자
@Data
public class Purchase {

	private int purchaseNo; //	PURCHASE_NO
	private String userId; //	USER_ID
    private String perfoTitle; // PERFO_TITLE
	private String hallName; // HALL_NAME
	private String seatList; //	SEAT_LIST
	private int paymentNo; //	PAYMENT_NO
	private int perfoNo; //	PERFO_NO
	private String customerserviceStatus; //	CUSTOMERSERVICE_STATUS
	private Date purchaseDate; //	PURCHASE_DATE
	private String reservationDate; //	RESERVATION_DATE
	private String perfoStartTime; //	PERFO_START_TIME
	private int seatPrice; //	SEAT_PRICE
	private String  changeName;//	CHANGE_NAME
}
