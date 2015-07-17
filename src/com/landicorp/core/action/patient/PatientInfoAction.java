package com.landicorp.core.action.patient;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.landicorp.config.setting.CommonValue;
import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.dao.IPatientDao;
import com.landicorp.core.entities.Patient;
import com.landicorp.core.entities.User;
import com.landicorp.core.service.IPatientService;
import com.opensymphony.xwork2.ActionSupport;

public class PatientInfoAction extends BaseActionSupport{
	
	private IPatientService patientService;
	private Patient patient;
	private List<Patient> patientList;
	private Date inTimeBegin;
	private Date inTimeEnd;
	private Date outTimeBegin;
	private Date outTimeEnd;
	private User user;
	
	private int[] patientIds;
	private String msg;
	
	public String loadPatient(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(this.patient != null){
			
			map.put("patientName", this.patient.getPatientName());
			map.put("patientSex", this.patient.getPatientSex());

		}

		map.put("inTimeBegin", this.inTimeBegin);
		map.put("inTimeEnd", this.inTimeEnd);
		map.put("outTimeBegin", this.outTimeBegin);
		map.put("outTimeEnd", this.outTimeEnd);
		
		this.patientList = this.patientService.loadPatient(map, getPager());
		getRequest().put("patientList", this.patientList);
		
		System.out.println(this.patientList.size());
		
		return "loadPatient";
	}
	
	public String loadPatientDetail(){
		
		this.patient = this.patientService.loadPatientById(this.patient.getPatientId());
		
		return "loadPatientDetail";
	}

	public String addPatientPrepare(){

		this.user = this.getSessionUser();
		
		return "prepare";
	}
	
	public String addPatient(){
		
		if(this.patient.getBedNum() != null && !"".equals(this.patient.getBedNum())){
			//病人选择住院，时间默认为当前系统时间
			this.patient.setInTime(new Date());
		}
		//最后修改人默认为登记人员，时间为当前系统时间
		this.patient.setLastModifyPeople(this.patient.getRecordPeople());
		this.patient.setLastModifyTime(new Date());
	
		this.patientService.addPatient(this.patient);
		return "addPatient";
	}
	
	public String inHome(){
		
		if(this.patient.getBedNum() == null || "".equals(this.patient.getBedNum())){
			
			this.patient = this.patientService.loadPatientById(this.patient.getPatientId());
			
			return "inHomePrepare";
			
		}else{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("bedNum", this.patient.getBedNum());
			
			
			//判断病床是否被占用
			if(this.patientService.loadPatient(map, getPager()).size() != 0){
				this.msg = "床位已被占用！";
				return "inHomeInput";
			}else{
				//设置最后修改时间
				this.patient.setLastModifyTime(new Date());
				//设置最后修改人,为当前操作人员
				User user  = (User)getSession().get(CommonValue.FLAG_SESSION_USER);
				this.patient.setLastModifyPeople(user.getUserName());
				
				this.patientService.updatePatient(this.patient);
				
				this.msg = "";
				return "inHome";				
				
			}
			
			
		}
	}
	public  String outHome(){
		
		if(this.patient.getOutTime() == null){
			this.patient = this.patientService.loadPatientById(this.patient.getPatientId());
			return "outHomePrepare";
		
		}else{

			this.patient.setLastModifyTime(new Date());
			User user  = (User)getSession().get(CommonValue.FLAG_SESSION_USER);
			this.patient.setLastModifyPeople(user.getUserName());
			
			//解除病床占用
			this.patient.setBedNum(this.patient.getBedNum()+"(已出院)");
			
			this.patientService.updatePatient(this.patient);
			
			return "outHome";			
		}

	}
	
	public String deletePatient(){
		
		this.patientService.deletePatient(this.patient.getPatientId());
		
		return "deletePatient";
	}
	/**
	 * 批量删除病人信息
	 * @return
	 */
	public String deletePatients(){
		System.out.println(this.patientIds.length);
		for(int i=0;i<this.patientIds.length;i++){
			this.patientService.deletePatient(this.patientIds[i]);
		}
		return "deletePatients";
	}
	
	public String updatePrepare(){
		
		this.patient = this.patientService.loadPatientById(this.patient.getPatientId());
		
		return "updatePrepare";
	}
	
	public String updatePatient(){
		
		//信息最后修改人设置为当前操作用户
		User user  = (User)getSession().get(CommonValue.FLAG_SESSION_USER);
		this.patient.setLastModifyPeople(user.getUserName());
		this.patient.setLastModifyTime(new Date());
		
		this.patientService.updatePatient(this.patient);
		
		return "updatePatient";
	}
	
	public String searchPatient(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("patientName", this.patient.getPatientName());
		map.put("patientSex", this.patient.getPatientSex());
		map.put("inTimeBegin", this.inTimeBegin);
		map.put("inTimeEnd", this.inTimeEnd);
		map.put("outTimeBegin", this.outTimeBegin);
		map.put("outTimeEnd", this.outTimeEnd);
		
//		int res = this.patientService.searchPatient(map).size();
//		System.out.println("====="+res);
		
		this.patientList = this.patientService.searchPatient(map,getPager());
		return "searchPatient";
	}
	
	public IPatientService getPatientServic() {
		return patientService;
	}
	public void setPatientService(IPatientService patientService) {
		this.patientService = patientService;
	}

	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public List<Patient> getPatientList() {
		return patientList;
	}

	public void setPatientList(List<Patient> patientList) {
		this.patientList = patientList;
	}

	public Date getInTimeBegin() {
		return inTimeBegin;
	}

	public void setInTimeBegin(Date inTimeBegin) {
		this.inTimeBegin = inTimeBegin;
	}

	public Date getInTimeEnd() {
		return inTimeEnd;
	}

	public void setInTimeEnd(Date inTimeEnd) {
		this.inTimeEnd = inTimeEnd;
	}

	public Date getOutTimeBegin() {
		return outTimeBegin;
	}

	public void setOutTimeBegin(Date outTimeBegin) {
		this.outTimeBegin = outTimeBegin;
	}

	public Date getOutTimeEnd() {
		return outTimeEnd;
	}

	public void setOutTimeEnd(Date outTimeEnd) {
		this.outTimeEnd = outTimeEnd;
	}

	public int[] getPatientIds() {
		return patientIds;
	}

	public void setPatientIds(int[] patientIds) {
		this.patientIds = patientIds;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
