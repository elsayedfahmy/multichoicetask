
enum Role{
  admin,
  other,
}
Role getRole({required String role}){
  switch( role.toLowerCase()){
    case 'admin':return Role.admin;
    default : return Role.other;
  }

}