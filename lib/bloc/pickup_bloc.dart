// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:waste_to_wealth/models/pickup_model.dart';
// import 'package:waste_to_wealth/controllers/pickup_contraller.dart'; // Ensure this is imported for API calls

// /// Define the base class for all pickup-related events.
// abstract class PickupEvent {}

// /// Event to set a new pickup.
// class SetPickupEvent extends PickupEvent {
//   final PickupModel pickup;

//   SetPickupEvent(this.pickup);
// }

// /// Define the base class for all pickup-related states.
// abstract class PickupState {}

// /// Initial state when no pickup data is loaded.
// class PickupInitial extends PickupState {}

// /// State representing the loading state (when the pickup request is being processed).
// class PickupLoading extends PickupState {}

// /// State representing a successfully loaded pickup.
// class PickupLoaded extends PickupState {
//   final PickupModel pickup;

//   PickupLoaded(this.pickup);
// }

// /// State representing an error during pickup scheduling.
// class PickupError extends PickupState {
//   final String message;

//   PickupError(this.message);
// }

// /// Bloc to handle pickup events and manage pickup states.
// class PickupBloc extends Bloc<PickupEvent, PickupState> {
//   final PickupController _pickupController;

//   // Initialize with the PickupController instance to handle API calls
//   PickupBloc(this._pickupController) : super(PickupInitial()) {
//     // Handle the SetPickupEvent by scheduling the pickup and emitting the appropriate states
//     on<SetPickupEvent>((event, emit) async {
//       emit(PickupLoading()); // Emit loading state when the request is made

//       try {
//         // Call the method from PickupController to schedule the pickup
//         await _pickupController.requestPickup(event.pickup);

//         // On success, emit the PickupLoaded state with the scheduled pickup
//         emit(PickupLoaded(event.pickup));
//       } catch (e) {
//         // On error, emit the PickupError state with the error message
//         emit(PickupError("Failed to schedule pickup: $e"));
//       }
//     });
//   }
// }
