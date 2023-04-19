package com.kh.mecenat.performance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.performance.model.vo.Performance;
import com.kh.mecenat.performance.model.vo.Review;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;
import com.kh.mecenat.reservation.model.vo.RentApplication;

@Repository
public class PerformanceDao {

	public ArrayList<Performance> selectListPerformance(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectPerformanceList");
	}

	public int insertPerformance(SqlSessionTemplate sqlSession, Performance p) {
		return sqlSession.insert("performanceMapperMana.insertPerformance", p);
	}

	public ArrayList<RentApplication> selectRentalApplication(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectRentalApplication");
	}

	public int performanceDao(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("reservationMapper.updateApproveStatus", rno);
	}

	public Performance selectListPerformance(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("performanceMapperMana.selectDetailPerformance", rno);
	}

	public int cancelPerformance(SqlSessionTemplate sqlSession, int rcode) {
		return sqlSession.update("reservationMapper.updateCancelStatus", rcode);
	}

	public RentApplication selectRentalApplicationR(SqlSessionTemplate sqlSession, int rno) {

		return sqlSession.selectOne("reservationMapper.selectRentalApplicationR", rno);
	}

	public int updateRentalAppStatus(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("reservationMapper.updateRentalAppStatus", rno);

	}

	// 서브메인 공연 리스트 조회
	public ArrayList<Performance> subMainPerformanceList(SqlSessionTemplate sqlSession, String sdate) {
		return (ArrayList) sqlSession.selectList("performanceMapperMana.subMainPerformanceList", sdate);
	}

	// 서브 메인 공연리스트 개수
	public int subMainPerformanceListCount(SqlSessionTemplate sqlSession, String sdate) {
		return sqlSession.selectOne("performanceMapperMana.subMainPerformanceListCount", sdate);
	}

	// 서브메인 공연 리스트 최신순 조회
	public ArrayList<Performance> subMainPerformanceSearchSort1(SqlSessionTemplate sqlSession, String sdate) {
		return (ArrayList) sqlSession.selectList("performanceMapperMana.subMainPerformanceSearchSort1", sdate);
	}

	// 서브메인 공연 리스트 관심순 조회
	public ArrayList<Performance> subMainPerformanceSearchSort2(SqlSessionTemplate sqlSession, String sdate) {
		return (ArrayList) sqlSession.selectList("performanceMapperMana.subMainPerformanceSearchSort2", sdate);
	}

	// 서브 메인페이지 내에서 공연 리스트 검색 조회
	public ArrayList<Performance> subMainPerformanceSearch(SqlSessionTemplate sqlSession, String searchWrd) {
		return (ArrayList) sqlSession.selectList("performanceMapperMana.subMainPerformanceSearch", searchWrd);
	}

	// 서브 메인페이지 내에서 검색어 리스트 개수 조회
	public int subMainPerformanceSearchCount(SqlSessionTemplate sqlSession, String searchWrd) {
		return sqlSession.selectOne("performanceMapperMana.subMainPerformanceSearchCount", searchWrd);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int rno) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectReviewList", rno);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("performanceMapperMana.insertReview", r);
	}

	public ArrayList<Performance> selectPlayPerformance(SqlSessionTemplate sqlSession, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectPlayPerformance", null, rowBounds);
	}

	public ArrayList<Performance> selectPlayPerformance(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectListNew");
	}

	public ArrayList<Performance> selectListgenre(SqlSessionTemplate sqlSession, String genreName) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectListgenre", genreName);
	}

	public int nopePerformance(SqlSessionTemplate sqlSession, int rcode) {
		return sqlSession.update("reservationMapper.nopePerformance", rcode);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("performanceMapperMana.selectListCount");
	}

	public ArrayList<Performance> selectPlayEndPerformance(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectPlayEndPerformance", null, rowBounds);
	}

	public int selectEndListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("performanceMapperMana.selectEndListCount");
	}

	public int updateStatus(SqlSessionTemplate sqlSession, Performance p) {
		return sqlSession.update("performanceMapperMana.updateStatus", p);
	}

	public int performanceDelete(SqlSessionTemplate sqlSession, int rcode) {
		return sqlSession.update("performanceMapperMana.performanceDelete", rcode);
	}

	public ArrayList<Performance> selectEndPlayPerformance(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList) sqlSession.selectList("performanceMapperMana.selectEndPlayPerformance", null, rowBounds);
	}

	public ArrayList<Purchase> selectDateList(SqlSessionTemplate sqlSession, Payment p) {
		return (ArrayList) sqlSession.selectList("reservationMapper.selectDateList", p);
	}
	
	public ArrayList<Performance> dayList(SqlSessionTemplate sqlSession, String sdate) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.dayList", sdate);
	}


	public ArrayList<Performance> genreList(SqlSessionTemplate sqlSession, String genre) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.genreList", genre);
	}


	public ArrayList<Performance> genreAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("performanceMapperMana.genreAllList");
	}

	public ArrayList<Payment> selectPaymentList(SqlSessionTemplate sqlSession, Performance p) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("paymentMapper.selectPaymentList", p);
	}

	public Purchase selectPurchaseOne(SqlSessionTemplate sqlSession, int purchaseNo) {
		// TODO Auto-generated method stub
		return (Purchase) sqlSession.selectOne("reservationMapper.selectPurchaseOne", purchaseNo);
	}

	public Performance selectPerformanceOne(SqlSessionTemplate sqlSession, int paymentNo) {
		// TODO Auto-generated method stub
		return (Performance) sqlSession.selectOne("performanceMapperMana.selectPerformanceOne", paymentNo);
	}

	public Payment selectPaymentone(SqlSessionTemplate sqlSession, Purchase p) {
		// TODO Auto-generated method stub
		return (Payment) sqlSession.selectOne("paymentMapper.selectPaymentone", p);
	}

	public int updatePaymentone(SqlSessionTemplate sqlSession, Payment pm) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentMapper.updatePaymentone", pm);
	}

	public int updatePurchaseone(SqlSessionTemplate sqlSession, Purchase pc) {
		// TODO Auto-generated method stub
		return sqlSession.update("reservationMapper.updatePurchaseone", pc);
	}

	public ArrayList<Purchase> adminAnswerRefund(SqlSessionTemplate sqlSession, String a) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("reservationMapper.adminAnswerRefund", a);
	}



}
