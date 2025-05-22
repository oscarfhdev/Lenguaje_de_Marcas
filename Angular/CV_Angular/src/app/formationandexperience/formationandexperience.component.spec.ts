import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormationandexperienceComponent } from './formationandexperience.component';

describe('FormationandexperienceComponent', () => {
  let component: FormationandexperienceComponent;
  let fixture: ComponentFixture<FormationandexperienceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FormationandexperienceComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FormationandexperienceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
