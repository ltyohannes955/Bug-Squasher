import 'package:bloc/bloc.dart';
import 'package:digital_business_card/model/business_card.dart';
import 'package:digital_business_card/views/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../service/profile repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    List Card = [];
    final auth = FirebaseAuth.instance;
    on<GetCard>((event, emit) async {
      emit(profileLoading());
      await Future.delayed(const Duration(seconds: 1));
      try{
        final data = await ProfileRepo.getter();
        emit(profileSuccess(data));
      } catch(e){
        
      }
    });
  }
}
