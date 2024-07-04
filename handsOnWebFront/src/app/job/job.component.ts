import { Subscription } from 'rxjs';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Job } from './job.model';
import { JobService } from './job.service';
import { HttpService } from '../http-requests/http.service';

@Component({
  selector: 'app-job',
  templateUrl: './job.component.html',
  styleUrls: ['./job.component.css'],
})
export class JobComponent implements OnInit {
  jobs: Job[] = [];
  sub: Subscription | undefined;

  constructor(private jobService: JobService, private router: Router, private httpService: HttpService) {
    this.httpService.getJobs().subscribe();
    this.jobs = this.jobService.getJobs();
  }

  ngOnInit() {
    this.sub = this.jobService.jobChanged.subscribe((jobs: Job[]) => {
      this.jobs = jobs;
    });
  }

  getSelectedJob(jobID: number): void {
    this.router.navigate(['/job-details', jobID]);
  }
}
