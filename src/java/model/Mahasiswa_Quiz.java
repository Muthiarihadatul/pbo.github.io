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
public class Mahasiswa_Quiz extends Model<Mahasiswa_Quiz>{
    private String nim;
    private int nilai;
    private String namaQuiz;
    private String kodeKelas;
    
    public Mahasiswa_Quiz() {
        this.table = "mahasiswa_quiz";
        this.primaryKey = "namaQuiz";
    }
    
    public Mahasiswa_Quiz(String nim, int nilai, String namaQuiz, String kodeKelas) {
        this.table = "mahasiswa_quiz";
        this.primaryKey = "namaQuiz";
        this.nim = nim;
        this.nilai = nilai;
        this.namaQuiz = namaQuiz;
        this.kodeKelas = kodeKelas;
    }
    
    @Override
    public Mahasiswa_Quiz toModel(ResultSet rs) {
        try {
            return new Mahasiswa_Quiz(
                this.nim = rs.getString("nim"),
                this.nilai = rs.getInt("nilai"),
                this.namaQuiz = rs.getString("namaQuiz"),
                this.kodeKelas = rs.getString("kodeKelas")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public void setNIM(String nim) {
        this.nim = nim;
    }
    
    public void setNilai(int nilai) {
        this.nilai = nilai;
    }
    
    public void setNamaQuiz(String namaQuiz) {
        this.namaQuiz = namaQuiz;
    }
    
    public void setKodeKelas(String kodeKelas) {
        this.kodeKelas = kodeKelas;
    }

    public String getNim() {
        return nim;
    }

    public int getNilai() {
        return nilai;
    }

    public String getNamaQuiz() {
        return namaQuiz;
    }

    public String getKodeKelas() {
        return kodeKelas;
    }
}
