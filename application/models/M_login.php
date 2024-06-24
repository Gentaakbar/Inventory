<?php

class M_login extends CI_Model{

  // menyisipkan data ke tabel
  public function insert($tabel,$data){
    $this->db->insert($tabel,$data);
  }

  // cek username tertntu ada ga ditabel
  public function cek_username($tabel,$username){
    return $this->db->select('username')
             ->from($tabel)
             ->where('username',$username)
             ->get()->result();
  }

  // cek user mengembalikan semua kolom dari baris yg sesuai
  public function cek_user($tabel,$username){
    return  $this->db->select('*')
               ->from($tabel)
               ->where('username',$username)
               ->get();
  }


  // mengambil idgambar berdasarkan username dari tabel user,balikin  nilai id dari baris yg sesuai
  public function idgambar($username)
  {
    $query = $this->db->select()
                      ->from('user')
                      ->where('username',$username)
                      ->get()->row();
    return $query->id;
  }

  // #memperbarui data user
  function edit_user($where, $data)
	{
		$this->db->where($where);
		return $this->db->update('users', $data);
	}

  // menghapus sesi data login
  public function logout()
	{
		$this->session->unset_userdata(self::SESSION_KEY);
		return !$this->session->has_userdata(self::SESSION_KEY);
	}
}
 ?>
