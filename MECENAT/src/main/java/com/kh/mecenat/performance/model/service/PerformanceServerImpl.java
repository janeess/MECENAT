package com.kh.mecenat.performance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.performance.model.dao.PerformanceDao;
import com.kh.mecenat.performance.model.vo.Performance;
import com.kh.mecenat.performance.model.vo.Review;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;
import com.kh.mecenat.reservation.model.vo.RentApplication;

@Service
public class PerformanceServerImpl implements PerformanceService {
	@Autowired
	private PerformanceDao performanceDao;

	@Autowired
	private SqlSessionTemplate SqlSession;

	@Override
	public ArrayList<Performance> selectListPerformance() {
		return performanceDao.selectListPerformance(SqlSession);
	}

	@Override
	public int insertPerformance(Performance p) {
		return performanceDao.insertPerformance(SqlSession, p);
	}

	@Override
	public ArrayList<RentApplication> selectRentalApplication() {
		return performanceDao.selectRentalApplication(SqlSession);
	}

	@Override
	public int approvePerformance(int rno) {
		return performanceDao.performanceDao(SqlSession, rno);
	}

	@Override
	public Performance selectListPerformance(int rno) {
		return performanceDao.selectListPerformance(SqlSession, rno);
	}

	// 서브메인 공연 리스트 조회
	@Override
	public ArrayList<Performance> subMainPerformanceList(String sdate) {
		return performanceDao.subMainPerformanceList(SqlSession, sdate);
	}

	// 서브 메인 공연리스트 개수
	@Override
	public int subMainPerformanceListCount(String sdate) {
		return performanceDao.subMainPerformanceListCount(SqlSession, sdate);
	}

	// 서브메인 공연 리스트 최신순 조회
	@Override
	public ArrayList<Performance> subMainPerformanceSearchSort1(String sdate) {
		return performanceDao.subMainPerformanceSearchSort1(SqlSession, sdate);
	}

	// 서브메인 공연 리스트 관심순 조회
	@Override
	public ArrayList<Performance> subMainPerformanceSearchSort2(String sdate) {
		return performanceDao.subMainPerformanceSearchSort2(SqlSession, sdate);
	}

	// 서브 메인페이지 내에서 공연 리스트 검색 조회
	@Override
	public ArrayList<Performance> subMainPerformanceSearch(String searchWrd) {
		return performanceDao.subMainPerformanceSearch(SqlSession, searchWrd);
	}

	// 서브 메인페이지 내에서 검색어 리스트 개수 조회
	@Override
	public int subMainPerformanceSearchCount(String searchWrd) {
		return performanceDao.subMainPerformanceSearchCount(SqlSession, searchWrd);
	}

	@Override
	public ArrayList<Review> selectReviewList(int rno) {
		// TODO Auto-generated method stub
		return performanceDao.selectReviewList(SqlSession, rno);
	}

	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return performanceDao.insertReview(SqlSession, r);
	}

	@Override
	public int cancelPerformance(int rcode) {
		return performanceDao.cancelPerformance(SqlSession, rcode);
	}

	@Override
	public RentApplication selectRentalApplicationR(int rno) {
		return performanceDao.selectRentalApplicationR(SqlSession, rno);
	}

	@Override
	public int updateRentalAppStatus(int rno) {
		return performanceDao.updateRentalAppStatus(SqlSession, rno);
	}

	@Override
	public ArrayList<Performance> selectPlayPerformance(PageInfo pi) {
		return performanceDao.selectPlayPerformance(SqlSession, pi);
	}

	@Override
	public ArrayList<Performance> selectListgenre(String genreName) {
		// TODO Auto-generated method stub
		return performanceDao.selectListgenre(SqlSession, genreName);
	}

	@Override
	public int selectListCount() {
		return performanceDao.selectListCount(SqlSession);
	}

	@Override
	public ArrayList<Performance> selectPlayEndPerformance(PageInfo pi) {
		return performanceDao.selectPlayEndPerformance(SqlSession, pi);
	}

	@Override
	public int selectEndListCount() {
		return performanceDao.selectEndListCount(SqlSession);
	}

	// ?
	@Override
	public int updateStatus(Performance p) {
		return performanceDao.updateStatus(SqlSession, p);
	}

	// ?
	@Override
	public int performanceDelete(int rcode) {
		return performanceDao.performanceDelete(SqlSession, rcode);
	}

	// ?
	@Override
	public int nopePerformance(int rcode) {
		return performanceDao.nopePerformance(SqlSession, rcode);
	}

	@Override
	public ArrayList<Purchase> selectDateList(Payment p) {
		return performanceDao.selectDateList(SqlSession, p);
	}

	@Override
	public ArrayList<Performance> selectListNew() {
		return null;
	}

	@Override
	public ArrayList<Performance> selectEndPlayPerformance(PageInfo piEnd) {
		return performanceDao.selectEndPlayPerformance(SqlSession, piEnd);
	}
	@Override
	public ArrayList<Performance> dayList(String sdate) {
		// TODO Auto-generated method stub
		return performanceDao.dayList(SqlSession, sdate);
	}
	
	@Override
	public ArrayList<Performance> genreList(String genre) {
		// TODO Auto-generated method stub
		return performanceDao.genreList(SqlSession, genre);
	}



	@Override
	public ArrayList<Performance> genreAllList() {
		// TODO Auto-generated method stub
		return performanceDao.genreAllList(SqlSession);
	}

	@Override
	public ArrayList<Payment> selectPaymentList(Performance p) {
		// TODO Auto-generated method stub
		return performanceDao.selectPaymentList(SqlSession, p);
	}

	@Override
	public Purchase selectPurchaseOne(int purchaseNo) {
		// TODO Auto-generated method stub
		return performanceDao.selectPurchaseOne(SqlSession, purchaseNo);
	}

	@Override
	public Performance selectPerformanceOne(int paymentNo) {
		// TODO Auto-generated method stub
		return performanceDao.selectPerformanceOne(SqlSession, paymentNo);
	}

	@Override
	public Payment selectPaymentone(Purchase p) {
		// TODO Auto-generated method stub
		return performanceDao.selectPaymentone(SqlSession, p);
	}

	@Override
	public int updatePaymentone(Payment pm) {
		// TODO Auto-generated method stub
		return performanceDao.updatePaymentone(SqlSession, pm);
	}

	@Override
	public int updatePurchaseone(Purchase pc) {
		// TODO Auto-generated method stub
		return performanceDao.updatePurchaseone(SqlSession, pc);
	}

	@Override
	public ArrayList<Purchase> adminAnswerRefund(String a) {
		// TODO Auto-generated method stub
		return performanceDao.adminAnswerRefund(SqlSession, a);
	}



}
