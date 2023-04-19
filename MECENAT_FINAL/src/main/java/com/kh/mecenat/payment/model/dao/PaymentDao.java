package com.kh.mecenat.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;

@Repository
public class PaymentDao {

	// 결제정보 추가
	public void insertPaymentInfo(SqlSessionTemplate sqlSession, Payment pay) {
		sqlSession.insert("paymentMapper.insertPaymentInfo", pay);
	}
	
	// 결제코드 얻기
	public int getPaymentNo(SqlSessionTemplate sqlSession, Payment pay) {
		return sqlSession.selectOne("paymentMapper.getPaymentNo", pay);
	}

	// 예매정보 추가
	public void insertPurchaseInfo(SqlSessionTemplate sqlSession, Purchase purchase) {
		sqlSession.insert("paymentMapper.insertPurchaseInfo", purchase);
	}

	public void deleteTemporaryPurchaseInfo(SqlSessionTemplate sqlSession, Purchase purchase) {
		sqlSession.delete("paymentMapper.deleteTemporaryPurchaseInfo", purchase);
	}

}
