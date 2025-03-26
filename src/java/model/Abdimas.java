/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class Abdimas extends Model<Abdimas>{
    private Integer kode;
    private String nama;
    private String deskripsi;
    private Date tanggal;
    
    public Abdimas() {
        this.table = "abdimas";
        this.primaryKey = "kode";
    }
    
    public Abdimas(Integer kode, String nama, String deskripsi, Date tanggal) {
        this.table = "abdimas";
        this.primaryKey = "kode";
        this.kode = kode;
        this.nama = nama;
        this.deskripsi = deskripsi;
        this.tanggal = tanggal;
    }
    
    @Override
    public Abdimas toModel(ResultSet rs) {
        try {
            return new Abdimas(
                this.kode = rs.getInt("kode"),
                this.nama = rs.getString("nama"),
                this.deskripsi = rs.getString("deskripsi"),
                this.tanggal = rs.getDate("tanggal")
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
    
    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }
    
    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }
    
    public int getKode() {
        return this.kode;
    }
    
    public String getNama() {
        return this.nama;
    }
    
    public String getDeskripsi() {
        return this.deskripsi;
    }
    
    public Date getTanggal() {
        return this.tanggal;
    }
}
