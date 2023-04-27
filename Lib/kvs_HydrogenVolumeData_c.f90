  ! C interface
  interface

     function C_kvs_HydrogenVolumeData_new()&
          bind( C, name="HydrogenVolumeData_new" )
       import
       type( C_ptr ) :: C_kvs_HydrogenVolumeData_new
     end function C_kvs_HydrogenVolumeData_new

     function C_kvs_HydrogenVolumeData_copy( other )&
          bind( C, name="HydrogenVolumeData_copy" )
       import
       type( C_ptr ) :: C_kvs_HydrogenVolumeData_copy
       type( C_ptr ), value :: other
     end function C_kvs_HydrogenVolumeData_copy

     subroutine C_kvs_HydrogenVolumeData_delete ( this )&
          bind( C, name="HydrogenVolumeData_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_HydrogenVolumeData_delete

     subroutine C_kvs_HydrogenVolumeData_setResolution ( this, dimx, dimy, dimz )&
          bind( C, name="HydrogenVolumeData_setResolution" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: dimx, dimy, dimz
     end subroutine C_kvs_HydrogenVolumeData_setResolution

     function C_kvs_HydrogenVolumeData_exec( this )&
          bind( C, name="HydrogenVolumeData_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ) :: C_kvs_HydrogenVolumeData_exec
     end function C_kvs_HydrogenVolumeData_exec

  end interface
