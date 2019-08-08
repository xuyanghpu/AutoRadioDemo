import { HttpInterfaceService } from './../../../services/http-interface.service';

import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router'

@Component({
  selector: 'app-radio-state',
  templateUrl: './radio-state.component.html',
  styleUrls: ['./radio-state.component.scss']
})
export class RadioStateComponent implements OnInit {

  constructor( public router:ActivatedRoute,public http:HttpInterfaceService) { 
    
    //获取某个电台的故障状态的信息 按照时间排序
    this.http.get_fault_state_by_address_axios(242001).then((data:any)=>{
        console.log(data.data);
        console.log(data.data.length);
      });
  }

  ngOnInit() {
    this.router.queryParams.subscribe((data)=>{
      console.log(data);
    });
  }
}
