import { Component, OnInit, Input, EventEmitter, Output } from "@angular/core";
import { Job } from "../job.model";

@Component({
  selector: "app-job-list",
  templateUrl: "./job-list.component.html",
  styleUrls: ["./job-list.component.css"],
})
export class JobListComponent implements OnInit {
  @Input() job!: Job;
  @Output() jobSelected = new EventEmitter<void>();

  constructor() {}

  ngOnInit() {
  }

  selectedJob(): void {
    this.jobSelected.emit();
  }
}
