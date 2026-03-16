class PassPropertyModel {
  int? id;
  String? reason;
  String? notes;
  String? polygonID;
  String? agentID;
  int? status;

  PassPropertyModel({
    this.id,
    this.reason,
    this.notes,
    this.polygonID,
    this.agentID,
    this.status,
  });

  factory PassPropertyModel.fromJson(Map<String, dynamic> json) =>
      PassPropertyModel(
        id: json["id"],
        reason: json["reason"],
        notes: json["notes"],
        polygonID: json["polygon_id"],
        agentID: json["agent_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
    "notes": notes,
    "polygon_id": polygonID,
    "agent_id": agentID,
    "status": status,
  };

  bool allFieldsPopulated() {
    return reason != null &&
        notes != null &&
        polygonID != null &&
        agentID != null &&
        status != null;
  }
}
