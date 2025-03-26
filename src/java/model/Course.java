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
public class Course extends Model<Course> {
    protected String kodeMatkul;
    private String nama;
    private String kodeKelas;
    private int sks;
    private String dosenPengampu;
    
    public Course() {
        this.table = "course";
        this.primaryKey = "kodeMatkul";
    }
    
    public Course(String kodeMK, String nama, String kodeKelas, int sks, String dosenPengampu) {
        this.table = "course";
        this.primaryKey = "kodeMatkul";
        this.kodeMatkul = kodeMK;
        this.nama = nama;
        this.kodeKelas = kodeKelas;
        this.sks = sks;
        this.dosenPengampu = dosenPengampu;
    }
    
    @Override
    public Course toModel(ResultSet rs) {
        try {
            return new Course(
                this.kodeMatkul = rs.getString("kodeMatkul"),
                this.nama = rs.getString("nama"),
                this.kodeKelas = rs.getString("kodeKelas"),
                this.sks = rs.getInt("sks"),
                this.dosenPengampu = rs.getString("dosenPengampu")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setKodeMK(String kodeMK) {
        this.kodeMatkul = kodeMK;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public void setKodeKelas(String kodeKelas) {
        this.kodeKelas = kodeKelas;
    }
    
    public void setSKS(int sks) {
        this.sks = sks;
    }
    
    public void setDosenPengampu(String dosen) {
        this.dosenPengampu = dosen;
    }
    
    public String getKodeMK(){
        return this.kodeMatkul;
    }
    
    public String getNama(){
        return this.nama;
    }
    
    public String getKodeKelas(){
        return this.kodeKelas;
    }
    
    public int getSKS(){
        return this.sks;
    }
    
    public String getDosenPengampu(){
        return this.dosenPengampu;
    }
}
