import { Subscription } from 'rxjs';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Job } from '../job.model';
import { JobService } from '../job.service';
import { HttpService } from 'src/app/http-requests/http.service';

@Component({
  selector: 'app-job-detail',
  templateUrl: './job-detail.component.html',
  styleUrls: ['./job-detail.component.css'],
})
export class JobDetailComponent implements OnInit {
  jobDetail!: Job;
  sub!: Subscription;
  id!: number;

  constructor(
    private acRoute: ActivatedRoute,
    private jobService: JobService,
    private router: Router,
    private httpService: HttpService
  ) { }

  ngOnInit() {
    this.httpService.getJobs().subscribe();
    this.sub = this.acRoute.params.subscribe((params: Params) => {
      this.id = params['id'];
      this.jobDetail = this.jobService.getJob(this.id);
    });
    this.sub = this.jobService.jobChanged.subscribe((job: Job[]) => {
      this.jobDetail = this.jobService.getJob(this.id);
    });
  }

  applyJob() {
    this.router.navigate(['job-application', this.id]);
  }
}
