<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\REST_Controller;

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Mahasiswa extends REST_Controller {

	function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->database();
        $this->load->model('M_mhs', 'mhs');
        
    }

	public function index_get()
	{
        $kriteria   = $this->get('kriteria');
        $value      = $this->get('value');

        if ((empty($kriteria) || $kriteria == null) && (empty($value) || $value == null)) {
            $mahasiswa = $this->mhs->data_mhs();
        }else{
            $mahasiswa = $this->mhs->detail_mhs($kriteria, $value);
        }

		if ($mahasiswa) {
			$this->response([
                'code' => 200,
                'status' => TRUE,
                'message' => 'success',
                'data' => $mahasiswa
            ], REST_Controller::HTTP_OK);
		}else{
			$this->response([
                'code' => 404,
                'status' => FALSE,
                'message' => 'No users were found'
            ], REST_Controller::HTTP_NOT_FOUND);
		}
	}

    public function index_post()
    {
        $data = array(
            'nip'           => $this->post('nip'),
            'nama'          => $this->post('nama'),
            'email'         => $this->post('email'),
            'jurusan'       => $this->post('jurusan'),
            'create_by'     => 'API_POST',
            'create_date'   => date("Y-m-d h:i:s")
        );

        $insert = $this->mhs->save_data($data);
        if ($insert != FALSE) {
            $this->set_response([
                'code' => 201,
                'status' => TRUE,
                'message' => 'created',
                'data' => $data
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'code' => 400,
                'status' => FALSE,
                'message' => 'No data were added'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function index_put()
    {
        $id             = $this->put('id');
        $nip            = $this->put('nip');
        $nama           = $this->put('nama');
        $email          = $this->put('email');
        $jurusan        = $this->put('jurusan');

        $data = array(
            'nip'           => $this->put('nip'),
            'nama'          => $this->put('nama'),
            'email'         => $this->put('email'),
            'jurusan'       => $this->put('jurusan'),
            'update_by'     => 'API_POST',
            'update_date'   => date("Y-m-d h:i:s")
        );

        $update =$this->mhs->update_data(array('id' => $id), $data);

        if ($update != FALSE) {
            $this->set_response([
                'code' => 201,
                'status' => TRUE,
                'message' => 'updated',
                'data' => $data
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'code' => 400,
                'status' => FALSE,
                'message' => 'Data not edited'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }


    function index_delete() {

        $id = $this->delete('id');
        $data = array(
            'update_by'     => 'API_POST',
            'update_date'   => date("Y-m-d h:i:s"),
            'is_delete'     => 1
        );
        
        $mahasiswa  = $this->mhs->detail_mhs('id', $id);
        $delete     = $this->mhs->update_data(array('id' => $id), $data);

        if ($delete != FALSE) {
            $this->response([
                'code' => 200,
                'status' => TRUE,
                'message' => 'deleted',
                'data' => $mahasiswa
            ], REST_Controller::HTTP_OK);
        }else{
            $this->response([
                'code' => 404,
                'status' => FALSE,
                'message' => 'No data were found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

}

/* End of file Mahasiswa.php */
/* Location: ./application/controllers/api/Mahasiswa.php */