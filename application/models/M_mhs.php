<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_mhs extends CI_Model {

	function data_mhs()
	{
		$this->db->select("id, nip, nama, email, jurusan");
		$this->db->from('mahasiswa');
		$this->db->where('is_delete', '0');
		$query = $this->db->get();
		return $query->result();
	}

	function detail_mhs($krit, $val)
	{
		$this->db->select("id, nip, nama, email, jurusan");
		$this->db->from('mahasiswa');
		$this->db->where($krit, $val);
		$this->db->where('is_delete', '0');
		$query = $this->db->get();
		return $query->result();
	}

	function save_data($data)
    {  
        $query = $this->db->insert('mahasiswa', $data);

        if ($query === FALSE) {
            return FALSE;
        }
        return $query;
    }

    function update_data($where, $data)
    {
    	$query = $this->db->update('mahasiswa', $data, $where);
        // return $this->db->affected_rows();
        if ($query === FALSE) {
            return FALSE;
        }
        return $query;
    }

    function delete_data($where, $data)
    {
    	$query = $this->db->update('mahasiswa', $data, $where);
        // return $this->db->affected_rows();
        if ($query === FALSE) {
            return FALSE;
        }
        return $query;
    }

}

/* End of file M_mhs.php */
/* Location: ./application/models/M_mhs.php */