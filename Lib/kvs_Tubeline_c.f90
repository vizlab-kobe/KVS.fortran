  ! C interface
  interface

     function C_kvs_Tubeline_new () result( this )&
          bind( C, name="Tubeline_new" )
       import
       type( C_ptr ) :: this
     end function C_kvs_Tubeline_new

     function C_kvs_Tubeline_copy( other )&
          bind( C, name="Tubeline_copy" )
       import
       type( C_ptr ) :: C_kvs_Tubeline_copy
       type( C_ptr ), value :: other
     end function C_kvs_Tubeline_copy

     subroutine C_kvs_Tubeline_delete ( this )&
          bind( C, name="Tubeline_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Tubeline_delete

     subroutine C_kvs_Tubeline_setNumberOfDivisions( this, ndivs )&
          bind( C, name="Tubeline_setNumberOfDivisions" )
       import
       type( C_ptr ), value :: this
       integer( C_int ), value :: ndivs
     end subroutine C_kvs_Tubeline_setNumberOfDivisions

     function C_kvs_Tubeline_exec( this, line ) &
          bind( C, name="Tubeline_exec" )
       import
       type( C_ptr ), value :: this
       type( C_ptr ), value :: line
       type( C_ptr ) :: C_kvs_Tubeline_exec
     end function C_kvs_Tubeline_exec

  end interface
