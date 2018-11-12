package com.cy.bean;

import org.springframework.stereotype.Service;

@Service
public class Incompatility {

    private int incompatilityId;
    private int pharmacyId;
    private String incompatilityDrug;

    public Incompatility() {
    }

    public Incompatility(int incompatilityId, int pharmacyId, String incompatilityDrug) {
        this.incompatilityId = incompatilityId;
        this.pharmacyId = pharmacyId;
        this.incompatilityDrug = incompatilityDrug;
    }

    public Incompatility( int pharmacyId, String incompatilityDrug) {
        this.pharmacyId = pharmacyId;
        this.incompatilityDrug = incompatilityDrug;
    }

    public int getIncompatilityId() {
        return incompatilityId;
    }

    public void setIncompatilityId(int incompatilityId) {
        this.incompatilityId = incompatilityId;
    }

    public int getPharmacyId() {
        return pharmacyId;
    }

    public void setPharmacyId(int pharmacyId) {
        this.pharmacyId = pharmacyId;
    }

    public String getIncompatilityDrug() {
        return incompatilityDrug;
    }

    public void setIncompatilityDrug(String incompatilityDrug) {
        this.incompatilityDrug = incompatilityDrug;
    }
}
