package ahualy.neepu.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ahualy.neepu.pojo.JobType;
import ahualy.neepu.pojo.Recruitment;
import ahualy.neepu.pojo.RecruitmentStatus;
import ahualy.neepu.service.AhualyService;
import ahualy.neepu.util.page.PageModel;

@Controller
public class RecruitmentController {
	
	@Autowired
	@Qualifier("AhualyService")
	private AhualyService ahualyService;
	
	
	@RequestMapping("/recruitment")
    public String recruitment() {
		return "/recruitment/recruitment";
	}
	

	//简历投递详情页面
	@RequestMapping(value="/recruitmentlist",method=RequestMethod.GET)
    public String recruitmentlist(Model model) {
		
		List<Recruitment> recruitment_list = ahualyService.get_RecruitmentList();
		
		model.addAttribute("recruitment_list",recruitment_list);
		
		return "/recruitment/list";
	}
	
	   //岗位公布  /recruitment/list
	   
	   //岗位公布详情页面
		@RequestMapping(value="/recruitment/list",method=RequestMethod.GET)
	    public String recruitment(Integer pageIndex,Model model,String content,Recruitment recruitment) {
			
			PageModel pageModel = new PageModel();
			if(pageIndex != null){
				pageModel.setPageIndex(pageIndex);
			}
			List<Recruitment> recruitment_list = ahualyService.get_RecruitmentList1(recruitment,pageModel);
			Integer count = 0;
			if (content!=null&&!content.equals("")){
				count = ahualyService.countRecruitment(content);
				recruitment_list = ahualyService.get_RecruitmentLikeList(content);
				
			}
			model.addAttribute("count", count);
			model.addAttribute("pageModel", pageModel);
			model.addAttribute("recruitment_list",recruitment_list);
			
			return "/recruitment/adminlist";  //管理员看到的页面（即可以修改的页面）
		}
	   
		// 删除岗位信息  /recruitment/delete
		
		@RequestMapping(value="/recruitment/delete",method=RequestMethod.GET)
		public void delete(Integer id){
			if(id!=null){
				ahualyService.delete_RecruitmentInfo(id);
			}
		}
		
		//跳转添加招聘信息页面  /recruitment/add get
		@RequestMapping(value="/recruitment/add",method=RequestMethod.GET)
		public String add(Model model) {
			
			List<JobType> jobType_list = ahualyService.get_JobType();
			List<RecruitmentStatus> recruitmentStatus_list = ahualyService.get_RecruitmentStatusList();
			
			model.addAttribute("jobType_list", jobType_list);
			model.addAttribute("recruitmentStatus_list", recruitmentStatus_list);
			
			return "/recruitment/add";
		}
		
		//提交添加招聘信息请求    /recruitment/add  post
		@RequestMapping(value="/recruitment/add",method=RequestMethod.POST)
		public ModelAndView toadd(ModelAndView mv,Integer jobtype,String content,String enddate,Integer peoplenum) {
			
			Recruitment recruitment = new Recruitment();
			
			JobType jobType2 = new JobType();
			jobType2.setId(jobtype);
			
			recruitment.setJobtype(jobType2);
			recruitment.setContent(content);
			recruitment.setEnddate(enddate);
			recruitment.setPeoplenum(peoplenum);
			
			ahualyService.insert_Recruitment(recruitment);
			
			mv.setViewName("redirect:/recruitment/list");
			
			return mv;
		}
		
		
		//跳转编辑招聘信息页面 /recruitment/edit  get
		@RequestMapping(value="/recruitment/edit",method=RequestMethod.GET)
		public String edit(Model model,Integer id) {
			
			Recruitment recruitment = ahualyService.get_RecruitmentById(id);
			
			List<JobType> jobType_list = ahualyService.get_JobType();
			List<RecruitmentStatus> recruitmentStatus_list = ahualyService.get_RecruitmentStatusList();
			
			model.addAttribute("recruitment", recruitment);
			model.addAttribute("jobType_list", jobType_list);
			model.addAttribute("recruitmentStatus_list", recruitmentStatus_list);
					
			return "/recruitment/edit";
		}
		
		//提交编辑请求            /recruitment/edit   post
		
		//提交添加招聘信息请求    /recruitment/add  post
		@RequestMapping(value="/recruitment/edit",method=RequestMethod.POST)
		public ModelAndView toedit(ModelAndView mv,Integer id,Integer jobtype,String content,String enddate,Integer peoplenum,Integer status) {
					
			Recruitment recruitment = new Recruitment();
					
		    JobType jobType2 = new JobType();
			jobType2.setId(jobtype);
			
			RecruitmentStatus status2 = new RecruitmentStatus();
			status2.setId(status);
				
			recruitment.setId(id);
			recruitment.setJobtype(jobType2);
			recruitment.setContent(content);
			recruitment.setEnddate(enddate);
			recruitment.setPeoplenum(peoplenum);
			recruitment.setStatus(status2);
					
			ahualyService.update_Recruitment(recruitment);
			
			mv.setViewName("redirect:/recruitment/list");
			
			return mv;
		}
		
		
	
	
}
