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
public class Mahasiswa extends Model<Mahasiswa> {
    private int nim;
    private String nama;
    private String kodeKelas;
    
    public Mahasiswa() {
        this.table = "mahasiswa";
        this.primaryKey = "nim";
    }
    
    public Mahasiswa(int nim, String nama, String kodeKelas) {
        this.table = "mahasiswa";
        this.primaryKey = "nim";
        this.nim = nim;
        this.nama = nama;
        this.kodeKelas = kodeKelas;
    }
    
    @Override
    public Mahasiswa toModel(ResultSet rs) {
        try {
            return new Mahasiswa(
                this.nim = rs.getInt("nim"),
                this.nama = rs.getString("nama"),
                this.kodeKelas = rs.getString("kodeKelas")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setNIM(int nim) {
        this.nim = nim;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    
    public void setKodeKelas(String kodeKelas) {
        this.kodeKelas = kodeKelas;
    }
    
    public int getNIM(){
        return this.nim;
    }
    
    public String getNama() {
        return this.nama;
    }
    
    public String getKodeKelas() {
        return this.kodeKelas;
    }
}
