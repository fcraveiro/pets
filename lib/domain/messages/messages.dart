class MessagesError {
  MessagesError._();

  static String errorSupabase(String error) =>
      "<b>Erro ao acessar o banco de dados dos Usuários!</b><br><p style=';margin-top: 2.5em; color: blue;'><br>Código : $error</p>";
}
