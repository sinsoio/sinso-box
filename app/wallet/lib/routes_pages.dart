import 'package:get/get.dart';
import 'package:wallet/pages/ReimburseDetail.dart';
import 'package:wallet/pages/about_us.dart';
import 'package:wallet/pages/authentication.dart';
import 'package:wallet/pages/backup_hint.dart';
import 'package:wallet/pages/backup_wallet.dart';
import 'package:wallet/pages/cooperative_hospital.dart';
import 'package:wallet/pages/create_wallet_set_name.dart';
import 'package:wallet/pages/create_wallet_set_pwd.dart';
import 'package:wallet/pages/export_private_key.dart';
import 'package:wallet/pages/health_insurance_detail.dart';
import 'package:wallet/pages/hospital_detail.dart';
import 'package:wallet/pages/hospital_offline.dart';
import 'package:wallet/pages/hospital_online.dart';
import 'package:wallet/pages/import_page.dart';
import 'package:wallet/pages/import_private_key.dart';
import 'package:wallet/pages/import_private_key_set_name.dart';
import 'package:wallet/pages/import_private_key_set_pwd.dart';
import 'package:wallet/pages/insured.dart';
import 'package:wallet/pages/insured_transfer.dart';
import 'package:wallet/pages/join_health_insurance.dart';
import 'package:wallet/pages/love_donation.dart';
import 'package:wallet/pages/medical_insurance_record.dart';
import 'package:wallet/pages/medical_insurance_record_detail.dart';
import 'package:wallet/pages/receive_payment.dart';
import 'package:wallet/pages/sinso_medical_insurance.dart';
import 'package:wallet/pages/splash.dart';
import 'package:wallet/pages/start_page.dart';
import 'package:wallet/pages/tab_navigator.dart';
import 'package:wallet/pages/switch_wallet.dart';
import 'package:wallet/pages/transfer.dart';
import 'package:wallet/pages/transfer_record.dart';
import 'package:wallet/routes.dart';
import 'pages/wallet_details.dart';
import 'pages/verify_mnemonic.dart';

abstract class AppPages {
  static final pages = [
    //引导页
    GetPage(
      name: Routes.Initial,
      page: () => SplashPage(),
    ),
    //选择创建或者导入页
    GetPage(
      name: Routes.StartPage,
      page: () => StartPage(),
    ),
    //备份助记词页
    GetPage(
      name: Routes.BackupWalletPage,
      page: () => BackupWalletPage(),
    ),
    //创建钱包提示备份页
    GetPage(
      name: Routes.BackupHintPage,
      page: () => BackupHintPage(),
    ),
    //选择私钥导入或者助记词导入页
    GetPage(
      name: Routes.ImportMnemonicPage,
      page: () => ImportPage(),
    ),
    //私钥导入页面
    GetPage(
      name: Routes.ImportPrivateKeyPage,
      page: () => ImportPrivateKeyPage(),
    ),
    //创建钱包设置密码页
    GetPage(
      name: Routes.CreateWalletSetPwdPage,
      page: () => CreateWalletSetPwdPage(),
    ),
    //创建钱包设置名称页
    GetPage(
      name: Routes.CreateWalletSetNamePage,
      page: () => CreateWalletSetNamePage(),
    ),
    //导入私钥设置名称页
    GetPage(
      name: Routes.ImportPrivateKeySetNamePage,
      page: () => ImportPrivateKeySetNamePage(),
    ),
    //导入私钥设置密码页
    GetPage(
      name: Routes.ImportPrivateKeySetPwdPage,
      page: () => ImportPrivateKeySetPwdPage(),
    ),
    //首页-资产页
    GetPage(
      name: Routes.TabNavigatorPage,
      page: () => TabNavigatorPage(),
    ),
    //切换钱包页
    GetPage(
      name: Routes.SwitchWalletPage,
      page: () => SwitchWalletPage(),
    ),
    //钱包详情页
    GetPage(
      name: Routes.WalletDetailsPage,
      page: () => WalletDetailsPage(),
    ),
    //导出私钥页
    GetPage(
      name: Routes.ExportPrivateKeyPage,
      page: () => ExportPrivateKeyPage(),
    ),
    //验证助记词页
    GetPage(
      name: Routes.VerifyMnemonicPage,
      page: () => VerifyMnemonicPage(),
    ),
    //转账
    GetPage(
      name: Routes.TransferPage,
      page: () => TransferPage(),
    ),
    //交易记录
    GetPage(
      name: Routes.TransferRecordPage,
      page: () => TransferRecordPage(),
    ),
    //关于我们
    GetPage(
      name: Routes.AboutUsPage,
      page: () => AboutUsPage(),
    ),
    //启动页
    GetPage(
      name: Routes.SplashPage,
      page: () => SplashPage(),
    ),
    //收款页
    GetPage(
      name: Routes.ReceivePaymentPage,
      page: () => ReceivePaymentPage(),
    ),
    //合作医院
    GetPage(
      name: Routes.CooperativeHospitalPage,
      page: () => CooperativeHospitalPage(),
    ),
    //加入医保
    GetPage(
      name: Routes.JoinHealthInsurancePage,
      page: () => JoinHealthInsurancePage(),
    ),
    //sinso健康保障计划
    GetPage(
      name: Routes.GuaranteePlanPage,
      page: () => GuaranteePlanPage(),
    ),
    //投保
    GetPage(
      name: Routes.InsuredPage,
      page: () => InsuredPage(),
    ),
    //身份验证
    GetPage(
      name: Routes.AuthenticationPage,
      page: () => AuthenticationPage(),
    ),
    //投保转账
    GetPage(
      name: Routes.InsuredTransferPage,
      page: () => InsuredTransferPage(),
    ),
    //爱心捐赠
    GetPage(
      name: Routes.LoveDonationPage,
      page: () => LoveDonationPage(),
    ),
    //线上医院
    GetPage(
      name: Routes.HospotalOnlinePage,
      page: () => HospotalOnlinePage(),
    ),
    // 线下医院
    GetPage(
      name: Routes.HospitalOfflinePage,
      page: () => HospitalOfflinePage(),
    ),
    GetPage(
      name: Routes.HospitalDetailPage,
      page: () => HospitalDetailPage(),
    ),
    //sinso医保
    GetPage(
      name: Routes.SinSoMedicalInsurancePage,
      page: () => SinSoMedicalInsurancePage(),
    ),
    //sinso医保投保记录
    GetPage(
      name: Routes.MedicalInsuranceRecordPage,
      page: () => MedicalInsuranceRecordPage(),
    ),
    //报销
    GetPage(
      name: Routes.MedicalInsuranceRecordDetailPage,
      page: () => MedicalInsuranceRecordDetailPage(),
    ),
    //报销详情
    GetPage(
      name: Routes.ReimburseDetailPage,
      page: () => ReimburseDetailPage(),
    ),
  ];
}
