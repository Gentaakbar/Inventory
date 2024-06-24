<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_admin extends CI_Model
{


  // Fungsi ini digunakan untuk menyisipkan data baru ke dalam tabel yang ditentukan.
  public function insert($tabel,$data)
  {
    $this->db->insert($tabel,$data);
  }
  
  // Fungsi ini mengambil semua data dari tabel yang ditentukan.
  public function select($tabel)
  {
    $query = $this->db->get($tabel);
    return $query->result();
  }
  
  // Fungsi ini memperbarui data pada tabel yang ditentukan berdasarkan kondisi where.
  public function update($tabel,$data,$where)
  {
    $this->db->where($where);
    $this->db->update($tabel,$data);
  }
  // untuk update pengguna
  public function updateuser($tabel,$data,$where)
  {
    $this->db->where($where);
    $this->db->update($tabel,$data);
  }

  // untuk memperbarui data barang masuk
  public function updatemasuk($data,$where)
  {
    $this->db->where($where);
    $this->db->update('barangmasuk',$data);

    return true;
  }

  // untuk menghapus tabel
  public function delete($tabel,$where)
  {
    $this->db->where($where);
    $this->db->delete($tabel);
  }

  // untuk mengambil data dari tabel yang ditentukan berdasarkan kondisi kodebarang.
  public function get_data($tabel,$kodebarang)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where($kodebarang)
                      ->get();
    return $query->result();
  }

  // ngambil data berdasarkan id
  public function get_data2($tabel,$id)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where($id)
                      ->get();
    return $query->result();
  }

  // untuk apdet pw
  public function update_password($tabel,$where,$data)
  {
    $this->db->where($where);
    $this->db->update($tabel,$data);
  }

  // untuk menghitung jumlah baris dari tabel
  public function numrows($tabel)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->get();
    return $query->num_rows();
  }
  // mengambil data  tabel kecuali dari username
  public function kecuali($tabel,$username)
  {
    $query = $this->db->select()
                      ->from($tabel)
                      ->where_not_in('username',$username)
                      ->get();

    return $query->result();
  }

  // ngambil semua data dari tabel barang masuk,keluar dll
  public function get()
    {
        return $this->db->get('barangmasuk');
    }
    public function getkeluar()
    {
        return $this->db->get('barangkeluar');
    }
    public function getdata()
    {
        return $this->db->get('databarang');
    }
    public function getcustomer()
    {
        return $this->db->get('datacustomer');
    }
    public function getsupplier()
    {
        return $this->db->get('datasupplier');
    }

    // ngecek kode barang apakah ada
    public function cek_kode($tabel,$kodebarang){
      return  $this->db->select('*')
                 ->from($tabel)
                 ->where('kodebarang',$kodebarang)
                 ->get();
}

// ngecek user 
public function cek_users($tabel,$username){
  return  $this->db->select('*')
             ->from($tabel)
             ->where('username',$username)
             ->get();
}
}




?>