import { Subject } from 'rxjs';
import { Injectable } from '@angular/core';
import { Job } from './job.model';

@Injectable({ providedIn: 'root' })
export class JobService {
  constructor() { }

  jobChanged = new Subject<Job[]>();

  jobs: any = [];

  setJobs(jobs: Job[]): void {

    this.jobs = jobs;
    this.jobChanged.next(this.jobs.slice());
  }

  getJobs(): Job[] {
    return this.jobs.slice();
  }

  getJob(jobId: number): Job {
    return this.jobs[jobId];
  }

  getJobId(jobId: number): number {
    let temp = this.jobs[jobId].jobid;
    console.log(temp)
    return temp
  }


  addJob(job: Job): void {
    this.jobs.push(job);
    this.jobChanged.next(this.jobs.slice());
  }
}
