// enum InputMask {
//   email,
//   cpf,
//   birth,
//   cellPhone,
//   zipCode,
//   number,
//   text,
//   all,
// }

// extension InputMaskExtension on InputMask {
//   String get mask {
//     switch (this) {
//       case InputMask.email:
//         return 'email';
//       case InputMask.cpf:
//         return '999.999.999-99';
//       case InputMask.birth:
//         return '99/99/9999';
//       case InputMask.cellPhone:
//         return '(99) 99999-9999';
//       case InputMask.zipCode:
//         return '99999-999';
//       case InputMask.number:
//         return '9*';
//       case InputMask.text:
//         return 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
//       case InputMask.all:
//         return 'X*';
//     }
//   }
// }



//   // bool get isSucess => this == SnackType.success;
//   // bool get isError => this == SnackType.error;
//   // bool get isWarning => this == SnackType.warning;
//   // bool get isInfo => this == SnackType.info;

//   // get title {
//   //   switch (this) {
//   //     case SnackType.success:
//   //       return 'Sucesso';
//   //     case SnackType.error:
//   //       return 'Erro';
//   //     case SnackType.warning:
//   //       return 'Atenção';
//   //     case SnackType.info:
//   //       return 'Informação';
//   //   }
//   // }

//   // static fromId(String value) {
//   //   switch (value) {
//   //     case "s":
//   //       return SnackType.success;
//   //     case "e":
//   //       return SnackType.error;
//   //     case "w":
//   //       return SnackType.warning;
//   //     case "i":
//   //       return SnackType.info;
//   //   }
//   // }

//   // String get image {
//   //   switch (this) {
//   //     case SnackType.success:
//   //       return 'assets/images/png/ok.png';
//   //     case SnackType.error:
//   //       return 'assets/images/png/canceled.png';
//   //     case SnackType.warning:
//   //       return 'assets/images/png/accepted.png';
//   //     case SnackType.info:
//   //       return 'assets/images/png/accepted.png';
//   //   }
//   // }
