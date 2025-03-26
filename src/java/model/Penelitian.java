/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class Penelitian extends Model<Penelitian>{
    private Integer kode;
    private String nama;
    private String bidang;
    private String deskripsi;
    private Date tanggal;
    private String tautan;
    
    public Penelitian() {
        this.table = "penelitian";
        this.primaryKey = "kode";
    }
    
    public Penelitian(Integer kode, String nama, String bidang, String deskripsi, Date tanggal, String tautan) {
        this.table = "penelitian";
        this.primaryKey = "kode";
        this.kode = kode;
        this.nama = nama;
        this.bidang = bidang;
        this.deskripsi = deskripsi;
        this.tanggal = tanggal;
        this.tautan = tautan;
    }
    
    @Override
    public Penelitian toModel(ResultSet rs) {
        try {
            return new Penelitian(
                this.kode = rs.getInt("kode"),
                this.nama = rs.getString("nama"),
                this.bidang = rs.getString("bidang"),
                this.deskripsi = rs.getString("deskripsi"),
                this.tanggal = rs.getDate("tanggal"),
                this.tautan = rs.getString("tautan")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKode(Integer kode) {
        this.kode = kode;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public void setBidang(String bidang) {
        this.bidang = bidang;
    }
    
    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }
    
    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }
    
    public void setTautan(String tautan) {
        this.tautan = tautan;
    }
    
    public int getKode() {
        return this.kode;
    }
    
    public String getNama() {
        return this.nama;
    }
    
    public String getBidang() {
        return this.bidang;
    }
    
    public String getDeskripsi() {
        return this.deskripsi;
    }
    
    public Date getTanggal() {
        return this.tanggal;
    }
    
    public String getTautan() {
        return this.tautan;
    }
}
