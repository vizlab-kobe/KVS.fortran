  ! C interface
  interface

     function C_kvs_TornadoVolumeData_new ( dimx, dimy, dimz )&
          bind( C, name="TornadoVolumeData_new" )
       import
       integer( C_int ), value :: dimx
       integer( C_int ), value :: dimy
       integer( C_int ), value :: dimz
       type( C_ptr ) :: C_kvs_TornadoVolumeData_new
     end function C_kvs_TornadoVolumeData_new

     function C_kvs_TornadoVolumeData_copy( other )&
          bind( C, name="TornadoVolumeData_copy" )
       import
       type( C_ptr ) :: C_kvs_TornadoVolumeData_copy
       type( C_ptr ), value :: other
     end function C_kvs_TornadoVolumeData_copy

     subroutine C_kvs_TornadoVolumeData_delete ( this )&
          bind( C, name="TornadoVolumeData_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_TornadoVolumeData_delete

     subroutine C_kvs_TornadoVolumeData_setTime ( this, time )&
          bind( C, name="TornadoVolumeData_setTime" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: time
     end subroutine C_kvs_TornadoVolumeData_setTime

     function C_kvs_TornadoVolumeData_exec( this )&
          bind( C, name="TornadoVolumeData_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_TornadoVolumeData_exec
     end function C_kvs_TornadoVolumeData_exec

  end interface
