import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_screen.dart';
import '../../components/app_bar/default_app_bar.dart';
import '../../components/buttons/button.dart';
import '../create_new_job_bloc.dart';
import '../create_new_job_event.dart';
import '../create_new_job_state.dart';
import 'components/biling_info_card.dart';
import 'components/job_details_card.dart';

@RoutePage()
class CreateNewJobScreen extends StatefulWidget {
  const CreateNewJobScreen({super.key});

  static const String route = '/create-new-job';

  @override
  State<CreateNewJobScreen> createState() => _CreateNewJobScreenState();
}

class _CreateNewJobScreenState extends State<CreateNewJobScreen> {
  late final JobFormBloc bloc;

  late final TextEditingController vehicleController;
  late final TextEditingController customerController;
  late final TextEditingController contactController;
  late final TextEditingController jobTypeController;
  late final TextEditingController jobStatusController;
  late final TextEditingController mechanicController;
  late final TextEditingController runningKmController;
  late final TextEditingController carAgeController;

  @override
  void initState() {
    super.initState();

    bloc = JobFormBloc();

    vehicleController = TextEditingController();
    customerController = TextEditingController();
    contactController = TextEditingController();
    jobTypeController = TextEditingController();
    jobStatusController = TextEditingController();
    mechanicController = TextEditingController();
    runningKmController = TextEditingController();
    carAgeController = TextEditingController();

    // ✅ controller listeners => dispatch bloc event
    vehicleController.addListener(() {
      bloc.add(
        VehicleNumberChanged(
          vehicleController.text.trim().isEmpty
              ? null
              : vehicleController.text.trim(),
        ),
      );
    });

    customerController.addListener(() {
      bloc.add(
        CustomerNameChanged(
          customerController.text.trim().isEmpty
              ? null
              : customerController.text.trim(),
        ),
      );
    });

    contactController.addListener(() {
      bloc.add(
        ContactNumberChanged(
          contactController.text.trim().isEmpty
              ? null
              : contactController.text.trim(),
        ),
      );
    });

    jobTypeController.addListener(() {
      bloc.add(
        JobTypeChanged(
          jobTypeController.text.trim().isEmpty
              ? null
              : jobTypeController.text.trim(),
        ),
      );
    });

    jobStatusController.addListener(() {
      bloc.add(
        JobStatusChanged(
          jobStatusController.text.trim().isEmpty
              ? null
              : jobStatusController.text.trim(),
        ),
      );
    });

    mechanicController.addListener(() {
      bloc.add(
        AssignedMechanicChanged(
          mechanicController.text.trim().isEmpty
              ? null
              : mechanicController.text.trim(),
        ),
      );
    });

    runningKmController.addListener(() {
      final value = int.tryParse(runningKmController.text);
      bloc.add(CurrentRunningKmChanged(value));
    });

    carAgeController.addListener(() {
      final value = int.tryParse(carAgeController.text);
      bloc.add(CarAgeChanged(value));
    });
  }

  @override
  void dispose() {
    vehicleController.dispose();
    customerController.dispose();
    contactController.dispose();
    jobTypeController.dispose();
    jobStatusController.dispose();
    mechanicController.dispose();
    runningKmController.dispose();
    carAgeController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BaseScreen<JobFormBloc, JobFormState>(
        create: (_) => bloc,
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8.0),

                  children: [
                    BillerInfoCard(
                      vehicleController: vehicleController,
                      customerController: customerController,
                      contactController: contactController,
                      jobTypeController: jobTypeController,
                      jobStatusController: jobStatusController,
                      mechanicController: mechanicController,
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<JobFormBloc, JobFormState>(
                      buildWhen: (previous, current) =>
                          previous.tyreAlignment != current.tyreAlignment ||
                          previous.wheelBalancing != current.wheelBalancing ||
                          previous.dent != current.dent,
                      builder: (context, state) {
                        return JobDetailsCard(
                          runningKmController: runningKmController,
                          carAgeController: carAgeController,
                          tyreAlignment: state.tyreAlignment,
                          wheelBalancing: state.wheelBalancing,
                          dent: state.dent,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.router.pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: PrimaryButton(
                        label: 'Create Job',
                        onPressed: () {
                          bloc.add(const SubmitJobPressed());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        appBar: const DefaultAppBar(title: 'New Job'),
      ),
    );
  }
}
