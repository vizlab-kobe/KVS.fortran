  ! C interface
  interface

     function C_kvs_Application_new()&
          bind( C, name="Application_new" )
       import
       type( C_ptr ) :: C_kvs_Application_new
     end function C_kvs_Application_new

     subroutine C_kvs_Application_delete( this )&
          bind( C, name="Application_delete" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_delete

     subroutine C_kvs_Application_run( this )&
          bind( C, name="Application_run" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_run

     subroutine C_kvs_Application_quit( this )&
          bind( C, name="Application_quit" )
       import
       type( C_ptr ), value :: this
     end subroutine C_kvs_Application_quit

  end interface
