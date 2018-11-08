package com.cy.mapper;import com.cy.bean.DrugClassification;import com.cy.bean.PhamacyDrug;import com.cy.bean.PhamacyReceive;import com.cy.bean.Receive;import org.apache.ibatis.annotations.Param;import org.springframework.stereotype.Repository;import java.util.List;import java.util.Map;@Repositorypublic interface PhamacyDrugManager {    //高伟    public List<PhamacyDrug> selectAllPhamacyDrug(Map<String, Object> map);    public int delectPhamacyDrug(int pharmacyId);    public PhamacyDrug selectPhamacyDrug(int pharmacyId );    public List<DrugClassification> selectAllDrugClassification();    public List<PhamacyDrug> selectDrugClassificationPhamacyDrug(int drugClassificationId);    public int addReceiverDrugs(@Param("receiveList") List<PhamacyReceive> receiveList);    //药房药品审核单    public List<PhamacyReceive> selectPhamacyReceiveDrug(Map<String, Object> map);    //药房药品请领删除    public int delectPhamacyReceive(int receiverId);    //药房药品请领修改状态    public int updatePhamacyReceive(PhamacyReceive phamacyReceive);    //通过药品名查询药品    public List<PhamacyDrug> selectPhamacyDrugs(String drugName);    //药房药品盘点    public int checkPhamacyDrugs(@Param(value = "phamacyList") List<PhamacyDrug> phamacyList);    //药房药品调价    public int phamacyDrugsPrice(PhamacyReceive phamacyReceive);    //药房药品退库    public int phamacyDrugsBack(PhamacyReceive phamacyReceive);    //吴侃}