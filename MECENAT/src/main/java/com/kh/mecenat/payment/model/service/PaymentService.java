package com.kh.mecenat.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mecenat.payment.model.dao.PaymentDao;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 결제정보 추가
	public void insertPaymentInfo(Payment pay) {
		paymentDao.insertPaymentInfo(sqlSession, pay);
	}

	// 결제코드 얻기
	public int getPaymentNo(Payment pay) {
		return paymentDao.getPaymentNo(sqlSession, pay);
	}

	// 예매정보 추가
	public void insertPurchaseInfo(Purchase purchase) {
		paymentDao.insertPurchaseInfo(sqlSession, purchase);
	}
	
	// 임시 예매정보 삭제
	public void deleteTemporaryPurchaseInfo(Purchase purchase) {
		paymentDao.deleteTemporaryPurchaseInfo(sqlSession, purchase);
	}

}
