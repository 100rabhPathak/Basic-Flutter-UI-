// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:get/get.dart';
// import 'package:nectar_dating/constants/image_constants.dart';
// import 'package:nectar_dating/constants/localization_constants.dart';
// import 'package:nectar_dating/core/presentation/color/app_colors.dart';
// import 'package:nectar_dating/core/presentation/textstyle/textstyle.dart';
// import 'package:nectar_dating/view/screen/authorized/presentation/video_mode.dart';
// import 'package:nectar_dating/view/widgets/custom_box.dart';
// import 'package:nectar_dating/view/widgets/selectone.dart';

// class Help extends StatelessWidget {
//   const Help({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size(375.w, 79.h),
//         child: Container(
//           height: 99.h,
//           padding: EdgeInsets.symmetric(horizontal: 17.w),
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(CustomImages.appbar), fit: BoxFit.cover)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Builder(
//                   builder: (context) => IconButton(
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       },
//                       icon: const Icon(Icons.menu))),
//               Text(
//                 AppLocalization.help,
//                 style: TextStyles.montserrat.copyWith(
//                     color: AppColor.appBlackColor,
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold),
//               ),
//               InkWell(
//                   onTap: () {
//                     Get.to(const VideoMode());
//                   },
//                   child: const Icon(
//                     Ionicons.ios_help_buoy_outline,
//                     color: AppColor.appBlackColor,
//                   ))
//             ],
//           ),
//         ),
//       ),
//       drawer: Container(
//         height: 812.h,
//         width: 375.h,
//         padding: EdgeInsets.only(left: 32.w),
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(CustomImages.drawer), fit: BoxFit.cover)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const MyBox(he: 54),
//             InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: Image.asset(
//                 CustomImages.home,
//                 height: 21.h,
//                 width: 23.w,
//               ),
//             ),
//             const MyBox(he: 29),
//             Padding(
//                 padding: EdgeInsets.only(left: 12.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 40.w,
//                           backgroundImage: const NetworkImage(
//                               "https://images.pexels.com/photos/2777898/pexels-photo-2777898.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 4.w),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Customer Name',
//                                 style: TextStyles.monserratWhiteBold,
//                               ),
//                               Text(
//                                 'Customer Name',
//                                 style: TextStyles.montserrat.copyWith(
//                                     color: AppColor.appWhite, fontSize: 10.sp),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     const MyBox(he: 67),
//                     ListTile(
//                       leading: const Icon(
//                         FontAwesome5Regular.bell,
//                         color: AppColor.appBlackColor,
//                       ),
//                       title: Text(AppLocalization.notifications),
//                     ),
//                     ListTile(
//                       leading: const Icon(
//                         Ionicons.settings_outline,
//                         color: AppColor.appBlackColor,
//                       ),
//                       title: Text(AppLocalization.settings),
//                     ),
//                     ListTile(
//                       leading: Image.asset(CustomImages.cupidBlack),
//                       title: Text(AppLocalization.fmmd),
//                     ),
//                     ListTile(
//                       leading: Image.asset(CustomImages.necDate),
//                       title: Text(AppLocalization.nectarCommunity),
//                     ),
//                     ListTile(
//                       leading: Image.asset(
//                         CustomImages.info,
//                         height: 24.h,
//                       ),
//                       title: Text(AppLocalization.aboutUs),
//                     ),
//                     ListTile(
//                       leading: const Icon(
//                         Ionicons.ios_help_buoy_outline,
//                         color: AppColor.appBlackColor,
//                       ),
//                       title: Text(AppLocalization.help),
//                     ),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 60.w,
//         ),
//         width: 375.w,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const MyBox(he: 37),
//             Image.asset(
//               CustomImages.beeNecter,
//             ),
//             const MyBox(he: 37),
//             Text(
//               AppLocalization.canHelp,
//               textAlign: TextAlign.center,
//               style: TextStyles.montserrat.copyWith(
//                   fontSize: 25.sp,
//                   fontWeight: FontWeight.w700,
//                   color: AppColor.primaryColor),
//             ),
//             const MyBox(he: 37),
//             TextFormField(
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(AntDesign.search1),
//                   hintText: AppLocalization.search),
//             ),
//             const MyBox(he: 54),
//             CustomButton(
//                 height: 48,
//                 width: double.infinity,
//                 radius: 10,
//                 textSize: 15,
//                 title: AppLocalization.guideToNecter,
//                 onTap: () {},
//                 fillColor: AppColor.appWhite,
//                 borderColor: AppColor.primaryColor,
//                 textColor: AppColor.primaryColor),
//             const MyBox(he: 9),
//             CustomButton(
//                 height: 48,
//                 width: double.infinity,
//                 radius: 10,
//                 textSize: 15,
//                 title: AppLocalization.troubleshoot,
//                 onTap: () {},
//                 fillColor: AppColor.appWhite,
//                 borderColor: AppColor.primaryColor,
//                 textColor: AppColor.primaryColor),
//             const MyBox(he: 9),
//             CustomButton(
//                 height: 48,
//                 width: double.infinity,
//                 radius: 10,
//                 textSize: 14,
//                 title: AppLocalization.safetySecurity,
//                 onTap: () {},
//                 fillColor: AppColor.appWhite,
//                 borderColor: AppColor.primaryColor,
//                 textColor: AppColor.primaryColor),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Help extends StatelessWidget {

  const Help({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('hi'),),
           body: Container(),
       );
  }
}
