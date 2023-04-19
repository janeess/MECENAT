package com.kh.mecenat.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.common.Pagination;
import com.kh.mecenat.notice.model.service.NoticeService;
import com.kh.mecenat.notice.model.vo.Notice;
import com.kh.mecenat.notice.model.vo.NoticeType;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	//memcenat소식 폼으로 이동
	@RequestMapping("noticeForm.no")
	public String noticeForm() {
		return "notice/allNotice";
	}

	//공지사항 리스트+페이징 처리
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,
							 @RequestParam(value="boardCode",defaultValue="0") String boardCode,
							 String etcGubun,
							 Model model) {
		
		
		int listCount = noticeService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectList(pi, boardCode);
		ArrayList<NoticeType> list2 = noticeService.selectCategoryList(boardCode);
		
		Model codeNum = model.addAttribute("boardCode", boardCode);
		
		model.addAttribute("etcGubun", boardCode);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		model.addAttribute("pi", pi);
		

		
		return "notice/allNotice";
	}

	// 공지사항 상세보기+조회수 증가
	@RequestMapping("detail.no")
	public ModelAndView selectBoard(int nno, ModelAndView mv) {

		int count = noticeService.increaseCount(nno);

		if (count > 0) {
			Notice n = noticeService.selectBoard(nno);

			if (n != null) {
				mv.addObject("n", n).setViewName("notice/noticeDetailView");
			} else {
				mv.addObject("errorMsg", "게시물을 조회할 수 없습니다.").setViewName("common/errorPage");
			}

		} else {
			mv.addObject("errorMsg", "게시물을 조회할 수 없습니다.").setViewName("common/errorPage");
		}

		return mv;
	}

	// 공지사항 작성 페이지로 이동
	@GetMapping("insert.no")
	public String insertNotice(Model model, String boardCode) {

		ArrayList<NoticeType> list2 = noticeService.selectCategoryList(boardCode);

		model.addAttribute("list2", list2);

		return "notice/noticeEnrollForm";
	}

	// 공지사항 등록 메소드
	@PostMapping("insert.no")
	public ModelAndView insertNotice(Notice n, MultipartFile upfile, ModelAndView mv, HttpSession session) {

		if (!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			n.setOriginName(upfile.getOriginalFilename());
			n.setChangeName("resources/img/notice/" + changeName);
		}

		int result = noticeService.insertNotice(n);

		if (result > 0) {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			mv.setViewName("redirect:/list.no");
		} else {
			mv.addObject("errorMsg", "게시글 등록 실패").setViewName("common/errorPage");
		}

		return mv;
	}
	
	//사진 업로드
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();

		// 2.시간 형식 뽑기
		// "20221205153533"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 3.확장자 추출하기
		String ext = originName.substring(originName.lastIndexOf("."));

		// 4.랜덤숫자 추출하기 5자리
		int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤값

		// 5.모두 이어붙이기
		String changeName = currentTime + ranNum + ext;

		// 6.파일을 업로드할 실질적인 위치(물리경로)찾기
		String savePath = session.getServletContext().getRealPath("resources/img/notice/");

		try {
			// 7. 물리경로+변경이름으로 파일 생성 및 업로드
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	// 공지사항 삭제
	@RequestMapping("delete.no")
	public String boardDelete(int nno, String filePath, HttpSession session, Model model) {

		int result = noticeService.deleteNotcie(nno);

		if (result > 0) {
			if (!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			session.setAttribute("alertMsg", "공지사항이 삭제되었습니다.");
		} else {
			model.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
		return "redirect:/list.no";
	}

	//공지사항 글 수정페이지로 이동
	@RequestMapping("updateForm.no")
	public String noticeUpdateForm(int nno, Model model, String boardCode) {
		
		Notice n = noticeService.selectBoard(nno);
		ArrayList<NoticeType> list2 = noticeService.selectCategoryList(boardCode);
		
		model.addAttribute("n", n);
		model.addAttribute("list2", list2 );
		
		return "notice/noticeUpdateForm";
	}
	

	//공지사항 글 수정 처리
	@RequestMapping("update.no")
	public ModelAndView boardUpdate(Notice n
							,MultipartFile upfile
							,HttpSession session
							,ModelAndView mv) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			if(n.getOriginName()!= null) {
				new File(session.getServletContext().getRealPath(n.getChangeName())).delete();
			}
			String changeName = saveFile(upfile,session); 
			
			n.setOriginName(upfile.getOriginalFilename());
			n.setChangeName("resources/img/notice/"+changeName);
		}
		
		int result = noticeService.updateNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			mv.setViewName("redirect:/detail.no?nno="+n.getNoticeNo());
		}else {
			mv.addObject("errorMsg", "게시글 수정 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//공지사항 검색
	@RequestMapping("search.no")
	public String search(@ModelAttribute("searchWord") String searchWord, 
							@RequestParam(value="currentPage",defaultValue="1") int currentPage,
							@RequestParam(value="boardCode",defaultValue="0") int boardCode,
							String etcGubun,
							Model model) {
		
		
		int listCount = noticeService.selectSearchCount(searchWord);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> nList = noticeService.search(pi, searchWord);

		
		if(nList != null) {
			model.addAttribute("etcGubun", boardCode);
			model.addAttribute("nList", nList);
			model.addAttribute("pi", pi);
			return "notice/searchNotice";
			
		}else {
			model.addAttribute("errorMsg", "검색결과를 조회할 수 없습니다.");
			return "common/errorPage";
		}
	}
	
	
	//news 소식 폼으로 이동
	@RequestMapping("noticeNews.no")
	public String noticeNews() {
		return "notice/noticeNews";
	}
	
	// 메인페이지 최신소식 조회
	@ResponseBody
	@RequestMapping("latestNews.no")
	public ModelAndView latestNews(@RequestParam(value = "boardCode[]") List<String> boardCode, ModelAndView mv) {

		ArrayList<ArrayList<Notice>> noticesList = new ArrayList<ArrayList<Notice>>();

		for (int i = 0; i < boardCode.size(); i++) {
			noticesList.add(noticeService.latestNews(boardCode.get(i)));
		}

		mv.addObject("noticesList", noticesList).setViewName("mainlatestnews");

		return mv;
	}

	// 푸터 페이지 Notice 조회
	@ResponseBody
	@RequestMapping("footerNotice.no")
	public ModelAndView footerNotice(ModelAndView mv) {

		ArrayList<Notice> footerNotice = noticeService.footerNotice();

		mv.addObject("footerNotice", footerNotice).setViewName("common/footerNotice");

		return mv;
	}

}
