<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct(){
		parent::__construct(); 
		$this->load->model('M_login');
	}
	public function index()
	{
		    $data['token_generate'] = $this->token_generate();
			$this->session->set_userdata($data);
			$this->load->view('login',$data);
	}

	public function token_generate(){
		return $tokens = md5(uniqid(rand(), true));
	}


	public function proses_login(){
		$this->form_validation->set_rules('username','Username','required');
		$this->form_validation->set_rules('password','Password','required');

		$this->form_validation->set_message('required', '%s Tidak Boleh Kosong');


		if($this->form_validation->run() == TRUE){
		
			$username = $this->input->post('username',TRUE);
			$password = $this->input->post('password',TRUE);

		if($this->session->userdata('token_generate') === $this->input->post('token'))
		{
			$cek =  $this->M_login->cek_user('users',$username);
			if( $cek->num_rows() != 1){
				$this->session->set_flashdata('msg','Username Belum Terdaftar');
				redirect(base_url('login'));
			}else {

				$isi = $cek->row();
				if(password_verify($password,$isi->password) === TRUE){
					$data_session = array(
									'id' => $isi->id,
									'name' => $username,
									'email' => $isi->email,
									'status' => 'login',
									'role' => $isi->role
					);

					$this->session->set_userdata($data_session);

					$this->M_login->edit_user(['username' => $username],['last_login' => date('d-m-Y G:i')]);

						if($isi->role == 1){
							redirect(base_url('beranda'));
						}else {
							redirect(base_url('User'));
						}
				}else {
					$this->session->set_flashdata('pesangagal','<div class="alert alert-danger" role="alert">
					Pastikan Username & Password Benar!
				  </div>');
					redirect('login');
				}
			}
		}
		}else {
			redirect(base_url());
		}
	
}
public function logout()
	{
		$this->load->model('m_login');
		$this->m_login->logout();
		redirect(base_url('Login')); 
	}
}
?>