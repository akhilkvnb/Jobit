class JobModel {
  String? category = '';
  String? jobtitle = '';
  String? jobdescription = '';
  String? id = '';
  String? message = '';

  JobModel({
    this.category,
    this.jobtitle,
    this.jobdescription,
    this.id,
    this.message,
  });
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        category: json["category"] ?? '',
        jobtitle: json["job_title"] ?? '',
        jobdescription: json["job_description"] ?? '',
        id: json["id"].toString(),
      );
  Map<String, dynamic> tojson() => {
        "category": category,
        "job_title": jobtitle,
        "job_description": jobdescription,
      };
  List<JobModel> jobGetModelFromjson(List data) =>
      List<JobModel>.from(data.map((x) => JobModel.fromJson(x)));
}
