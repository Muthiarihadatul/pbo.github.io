/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class Quiz extends Model<Quiz>{
    private String nama;
    private String kodeMatkul;
    private String deskripsi;
    private String kodeKelas;
    
    public Quiz() {
        this.table = "quiz";
        this.primaryKey = "nama";
    }
    
    public Quiz(String nama, String kodeMatkul, String deskripsi, String kodeKelas) {
        this.table = "course";
        this.primaryKey = "nama";
        this.kodeMatkul = kodeMatkul;
        this.nama = nama;
        this.kodeKelas = kodeKelas;
        this.deskripsi = deskripsi;
    }
    
    @Override
    public Quiz toModel(ResultSet rs) {
        try {
            return new Quiz(
                this.nama = rs.getString("nama"),
                this.kodeMatkul = rs.getString("kodeMatkul"),
                this.deskripsi = rs.getString("deskripsi"),
                this.kodeKelas = rs.getString("kodeKelas")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public void setKodeMK(String kodeMK) {
        this.kodeMatkul = kodeMK;
    }
    
    public void setKodeKelas(String kodeKelas) {
        this.kodeKelas = kodeKelas;
    }
    
    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }
    
    public String getNama() {
        return this.nama;
    }
    
    public String getKodeMK() {
        return this.kodeMatkul;
    }
    
    public String getDeskripsi() {
        return this.deskripsi;
    }
}
