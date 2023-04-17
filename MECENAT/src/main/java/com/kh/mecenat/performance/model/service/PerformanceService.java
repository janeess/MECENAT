package com.kh.mecenat.performance.model.service;

import java.util.ArrayList;

import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.performance.model.vo.Performance;
import com.kh.mecenat.performance.model.vo.Review;
import com.kh.mecenat.payment.model.vo.Payment;
import com.kh.mecenat.reservation.model.vo.Purchase;
import com.kh.mecenat.reservation.model.vo.RentApplication;

public interface PerformanceService {
	// 공연 목록 뽑아오기
	public ArrayList<Performance> selectListPerformance();

	public int insertPerformance(Performance p);

	public ArrayList<RentApplication> selectRentalApplication();

	public int approvePerformance(int rno);

	public Performance selectListPerformance(int rno);

	public int cancelPerformance(int rcode);

	public RentApplication selectRentalApplicationR(int rno);

	public int updateRentalAppStatus(int rno);

	// 서브메인 공연 리스트 조회
	public ArrayList<Performance> subMainPerformanceList(String sdate);

	// 서브메인 공연 리스트 개수
	public int subMainPerformanceListCount(String sdate);

	// 서브메인 공연 리스트 최신순 조회
	public ArrayList<Performance> subMainPerformanceSearchSort1(String sdate);

	// 서브메인 공연 리스트 관심순 조회
	public ArrayList<Performance> subMainPerformanceSearchSort2(String sdate);

	// 서브 메인페이지 내에서 공연 리스트 검색 조회
	public ArrayList<Performance> subMainPerformanceSearch(String searchWrd);

	// 서브 메인페이지 내에서 검색어 리스트 개수 조회
	public int subMainPerformanceSearchCount(String searchWrd);

	public int insertReview(Review r);

	public ArrayList<Review> selectReviewList(int rno);

	public ArrayList<Performance> selectListNew();

	public ArrayList<Performance> selectListgenre(String genreName);

	public ArrayList<Performance> selectPlayPerformance(PageInfo pi);

	public int updateStatus(Performance p);

	public int performanceDelete(int rcode);

	public int nopePerformance(int rcode);

	public int selectListCount();

	public ArrayList<Performance> selectPlayEndPerformance(PageInfo pi);

	public int selectEndListCount();

	public ArrayList<Purchase> selectDateList(Payment p);

	public ArrayList<Performance> selectEndPlayPerformance(PageInfo piEnd);
	
	public ArrayList<Performance> dayList(String sdate);


	public ArrayList<Performance> genreList(String genre);



	public ArrayList<Performance> genreAllList();

	public ArrayList<Payment> selectPaymentList(Performance p);

	public Purchase selectPurchaseOne(int purchaseNo);

	public Performance selectPerformanceOne(int paymentNo);

	public Payment selectPaymentone(Purchase p);

	public int updatePaymentone(Payment pm);

	public int updatePurchaseone(Purchase pc);

	public ArrayList<Purchase> adminAnswerRefund(String a);


}
