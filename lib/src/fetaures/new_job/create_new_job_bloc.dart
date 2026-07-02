import '../../core/base/base_bloc.dart';
import '../../core/base/ui_action.dart';
import 'create_new_job_event.dart';
import 'create_new_job_state.dart';

class JobFormBloc extends BaseBloc<JobFormState> {
  JobFormBloc() : super(const JobFormState()) {
    on<VehicleNumberChanged>((event, emit) {
      emit(state.copyWith(vehicleNumber: event.value, ));
    });

    on<CustomerNameChanged>((event, emit) {
      emit(state.copyWith(customerName: event.value, ));
    });

    on<ContactNumberChanged>((event, emit) {
      emit(state.copyWith(contactNumber: event.value, ));
    });

    on<JobTypeChanged>((event, emit) {
      emit(state.copyWith(jobType: event.value, ));
    });

    on<JobStatusChanged>((event, emit) {
      emit(state.copyWith(jobStatus: event.value, ));
    });

    on<AssignedMechanicChanged>((event, emit) {
      emit(state.copyWith(assignedMechanic: event.value, ));
    });

    on<TyreAlignmentChanged>((event, emit) {
      emit(state.copyWith(tyreAlignment: event.value, ));
    });

    on<WheelBalancingChanged>((event, emit) {
      emit(state.copyWith(wheelBalancing: event.value, ));
    });

    on<DentChanged>((event, emit) {
      emit(state.copyWith(dent: event.value, ));
    });

    on<CurrentRunningKmChanged>((event, emit) {
      emit(state.copyWith(currentRunningKm: event.value, ));
    });

    on<CarAgeChanged>((event, emit) {
      emit(state.copyWith(carAge: event.value, ));
    });

    on<SubmitJobPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true, ));

      await Future.delayed(const Duration(seconds: 1));

      if ((state.vehicleNumber ?? '').trim().isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            action: const ShowSnackBarAction(
              'Vehicle Number is required',
              isError: true,
            ),
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          isLoading: false,
          action: const ShowSnackBarAction('Job Created Successfully'),
        ),
      );
    });
  }
}
