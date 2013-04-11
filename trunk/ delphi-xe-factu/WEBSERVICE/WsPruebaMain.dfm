object WSPruebasMain: TWSPruebasMain
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'Web ServPruebas'
  AfterInstall = ServiceAfterInstall
  OnStart = ServiceStart
  Height = 265
  Width = 377
end
