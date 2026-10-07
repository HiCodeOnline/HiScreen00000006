import { window } from '@kit.ArkUI';

interface VideoItem  {
  id: string,
  title: string,
  cover: Resource,
  fire: number,
  tag: string,
  isNew: boolean,
  episodes: number
}

@Entry
@ComponentV2
struct Index {
  @Local searchText: string = '';
  @Local searchPlaceholder: string = '我跟大明太子摊牌了：要么听我的';

  @Local searchHistory: string[] = [
    '流浪汉的洪水预言',
    '夫妻开半挂养活五十万大军',
    '和亲公主竟然是金刚',
    '被诬陷诊出喜脉，我',
    '退婚从抢我车位开始',
    '脑洞',
    '半生尘埃一朝落',
    '神女归途'
  ];

  @Local guessWhatYouSearch: VideoItem[] = [
    {
      id: '1',
      title: '糯糯下山，师兄们都慌了第三季',
      cover: $r('app.media.img_cover1'),
      fire: 4612,
      tag: '异界',
      isNew: false,
      episodes: 152
    },
    {
      id: '2',
      title: '重生！丑小鸭逆袭成了万人迷第二季',
      cover: $r('app.media.img_cover2'),
      fire: 3221,
      tag: '脑洞',
      isNew: false,
      episodes: 250
    },
    {
      id: '3',
      title: '废物垫底皇子，反倒成为千古一帝第二季',
      cover: $r('app.media.img_cover3'),
      fire: 7811,
      tag: '穿越',
      isNew: false,
      episodes: 394
    }
  ]

  @Local trendingTopics: VideoItem[] = [
    {
      id: '1',
      title: '我都元婴期了，你跟我说开学',
      cover: $r('app.media.img_cover4'),
      fire: 3122,
      tag: '都市',
      isNew: false,
      episodes: 475
    },
    {
      id: '2',
      title: '我的婆婆，我罩着',
      cover: $r('app.media.img_cover5'),
      fire: 2115,
      tag: '家庭伦理',
      isNew: false,
      episodes: 108
    },
    {
      id: '3',
      title: 'a啊啊是',
      cover: $r('app.media.img_cover6'),
      fire: 4555,
      tag: '穿越',
      isNew: false,
      episodes: 45
    },
    {
      id: '1',
      title: '糯糯下山，师兄们都慌了第三季',
      cover: $r('app.media.img_cover1'),
      fire: 4612,
      tag: '异界',
      isNew: false,
      episodes: 152
    },
    {
      id: '2',
      title: '重生！丑小鸭逆袭成了万人迷第二季',
      cover: $r('app.media.img_cover2'),
      fire: 3221,
      tag: '脑洞',
      isNew: false,
      episodes: 250
    },
    {
      id: '3',
      title: '废物垫底皇子，反倒成为千古一帝第二季',
      cover: $r('app.media.img_cover3'),
      fire: 7811,
      tag: '穿越',
      isNew: false,
      episodes: 394
    }
  ]

  @Local topRectHeight: number = 0
  @Local bottomRectHeight: number = 0

  onPageShow() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {
        win.setWindowLayoutFullScreen(true).catch();
        try {
          let topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          this.topRectHeight = px2vp(topArea.topRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }
        try {
          let bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
          this.bottomRectHeight = px2vp(bottomArea.bottomRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }
      }).catch();
    }
  }

  onPageHide() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {

      }).catch();
    }
  }

  build() {
    RelativeContainer() {
      Column() {
        Row() {
          Image($r('app.media.icon_arrow_left'))
            .width(32)
            .height(32)
            .fillColor($r('app.color.text_color'))

          Search({ placeholder: this.searchPlaceholder })
            .layoutWeight(1)
            .height(40)
            .searchIcon({
              src: $r('app.media.icon_search'),
              color: $r('app.color.text_placeholder_color')
            })
            .backgroundColor($r('app.color.input_background'))
            .placeholderColor($r('app.color.text_placeholder_color'))
            .margin({
              left: 12,
              right: 18
            })
            .borderRadius(6)
            .onChange((value: string) => {
              this.searchText = value;
            })
            .onSubmit((value: string) => {
              console.info('搜索内容：', value);
            })

          Button('搜索')
            .backgroundColor(Color.Transparent)
            .fontColor($r('app.color.text_color'))
            .padding({
              right: 0
            })
            .onClick((event: ClickEvent) => {

            })
        }
      }
      .id('header')
      .width('100%')
      .zIndex(10)
      .backgroundColor($r('app.color.background'))
      .padding({
        top: this.topRectHeight,
        left: 16,
        right: 16
      })
      .alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      })

      Scroll() {
        Column() {
          Row() {
            Row() {
              Column() {
                Image($r('app.media.icon_fire'))
                  .width(14)
                  .height(14)
                  .fillColor(Color.White)
              }
              .width(20)
              .height(20)
              .borderRadius(6)
              .backgroundColor('#ff6b21')
              .justifyContent(FlexAlign.Center)
              .linearGradient({
                angle: 315,
                colors: [
                  ['#ffa841', 0.0],
                  ['#ff6b21', 1.0]
                ]
              })
              .margin({
                right: 6
              })

              Text('排行')
                .fontColor($r('app.color.text_color'))
            }

            Row() {
              Column() {
                Image($r('app.media.icon_play'))
                  .width(14)
                  .height(14)
                  .fillColor(Color.White)
              }
              .width(20)
              .height(20)
              .borderRadius(6)
              .backgroundColor('#00c5cb')
              .justifyContent(FlexAlign.Center)
              .linearGradient({
                angle: 315,
                colors: [
                  ['#08dfe4', 0.0],
                  ['#07c2c7', 1.0]
                ]
              })
              .margin({
                right: 6
              })

              Text('上新')
                .fontColor($r('app.color.text_color'))
            }

            Row() {
              Column() {
                Image($r('app.media.icon_user'))
                  .width(14)
                  .height(14)
                  .fillColor(Color.White)
              }
              .width(20)
              .height(20)
              .borderRadius(6)
              .backgroundColor('#ffa858')
              .linearGradient({
                angle: 315,
                colors: [
                  ['#ffce56', 0.0],
                  ['#ebae74', 1.0]
                ]
              })
              .justifyContent(FlexAlign.Center)
              .margin({
                right: 6
              })

              Text('演员')
                .fontColor($r('app.color.text_color'))
            }
            Row() {
              Image($r('app.media.icon_filter'))
                .width(20)
                .height(20)
                .fillColor('#04b9aa')
                .margin({
                  right: 6
                })

              Text('筛选')
                .fontColor($r('app.color.text_color'))
            }
          }
          .width('100%')
          .height(24)
          .margin({
            top: 6,
            bottom: 12,
          })
          .padding({
            left: 16,
            right: 16
          })
          .justifyContent(FlexAlign.SpaceBetween)

          Column() {
            Row() {
              Text('搜索历史')
                .fontSize(18)
                .fontColor($r('app.color.text_color'))

              Image($r('app.media.icon_delete'))
                .width(16)
                .height(16)
                .fillColor('#c45e31')
            }
            .width('100%')
            .margin({
              top: 6,
              bottom: 6
            })
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .padding({
            left: 16,
            right: 16
          })

          Column() {
            WaterFlow() {
              ForEach(this.searchHistory, (item: string) => {
                FlowItem() {
                  Column() {
                    Text(item)
                      .fontSize(14)
                      .fontColor($r('app.color.text_color'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                  }
                  .width('100%')
                  .height(20)
                  .borderRadius(8)
                  .justifyContent(FlexAlign.Start)
                  .alignItems(HorizontalAlign.Start)
                }
                .width('100%')
              })
            }
            .columnsTemplate('1fr 1fr')
            .columnsGap(16)
            .rowsGap(16)
            .width('100%')
            .scrollBar(BarState.Auto)
          }
          .width('100%')
          .padding({
            left: 16,
            right: 16
          })
          .margin({
            top: 12,
            bottom: 12
          })

          Column() {
            Row() {
              Text('猜你想搜')
                .fontSize(18)
                .fontColor($r('app.color.text_color'))

              Image($r('app.media.icon_reset'))
                .width(16)
                .height(16)
                .fillColor(Color.White)
            }
            .width('100%')
            .margin({
              top: 24,
              bottom: 12
            })
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .padding({
            left: 16,
            right: 16
          })

          Grid() {
            ForEach(this.guessWhatYouSearch, (item: VideoItem) => {
              GridItem() {
                Column() {
                  Column(){
                    Image(item.cover)
                      .width('100%')
                      .height(150)
                      .borderRadius(12)

                    if (item.isNew) {
                      Row(){
                        Text(`新剧`)
                          .fontSize(12)
                          .fontColor($r('app.color.text_tag_color'))

                      }
                      .padding({ left: 2, right: 2, top: 1, bottom: 1 })
                      .backgroundColor('#007f61')
                      .margin({
                        right: 3,
                        top: 3
                      })
                      .borderRadius(4)
                      .position({ top: 0, right: 0 })
                      .zIndex(1)
                    }

                    Row() {
                      Image($r('app.media.icon_fire'))
                        .width(12)
                        .height(12)
                        .fillColor($r('app.color.text_tag_color'))

                      Text(`${item.episodes}万热度`)
                        .fontSize(12)
                        .fontColor($r('app.color.text_tag_color'))
                        .padding({ right: 8 })
                        .borderRadius(4)
                    }
                    .justifyContent(FlexAlign.Center)
                    .alignItems(VerticalAlign.Center)
                    .padding({ left: 8, right: 4, top: 4, bottom: 4 })
                    .position({ bottom: 0, right: 0 })
                    .zIndex(1)

                  }
                  .width('100%')
                  .height(150)

                  Row() {
                    Text(item.title)
                      .fontSize(14)
                      .fontColor($r('app.color.text_color'))
                      .textAlign(TextAlign.Start)
                      .maxLines(1)
                      .textOverflow({overflow: TextOverflow.Ellipsis})
                      .margin({
                        top: 6,
                        bottom: 6
                      })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)

                  Row() {
                    Text(item.tag)
                      .fontSize(12)
                      .fontColor($r('app.color.text_secondary_color'))
                      .textAlign(TextAlign.Start)

                    Text('·')
                      .fontSize(12)
                      .fontWeight(FontWeight.Bold)
                      .fontColor($r('app.color.text_secondary_color'))
                      .padding({
                        left: 1,
                        right: 1
                      })

                    Text(`全${item.episodes}集`)
                      .fontSize(12)
                      .fontColor($r('app.color.text_secondary_color'))
                      .textAlign(TextAlign.Start)

                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)

                }
                .width('100%')
                .justifyContent(FlexAlign.Start)
              }
            })
          }
          .columnsTemplate('1fr 1fr 1fr')
          .columnsGap(12)
          .rowsGap(12)
          .width('100%')
          .height(200)
          .scrollBar(BarState.Off)
          .padding({
            left: 16,
            right: 16
          })
          .margin({
            bottom: 24
          })

          Column () {
            Column() {
              Row() {
                Text('短剧')
                  .fontSize(18)
                  .fontColor($r('app.color.text_color'))

                Text('热搜榜')
                  .fontSize(18)
                  .fontColor('#f77b0e')

              }
              .width('100%')
              .margin({
                top: 16,
                bottom: 18
              })
              .justifyContent(FlexAlign.Start)
            }

            Grid() {
              ForEach(this.trendingTopics, (item: VideoItem, index: number) => {
                GridItem() {
                  Column() {
                    Column() {
                      Image(item.cover)
                        .width('100%')
                        .height(150)
                        .borderRadius(12)

                      Row(){
                        Text(`${index + 1}`)
                          .fontSize(12)
                          .fontWeight(FontWeight.Bold)
                          .fontColor($r('app.color.text_tag_color'))
                      }
                      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                      .backgroundColor(this.getColor(index))
                      .margin({
                        left: 0,
                        top: 0
                      })
                      .borderRadius({
                        topLeft: 12,
                        bottomRight: 12
                      })
                      .position({ top: 0, left: 0 })
                      .zIndex(1)

                      Row() {
                        Image($r('app.media.icon_fire'))
                          .width(12)
                          .height(12)
                          .fillColor($r('app.color.text_tag_color'))


                        Text(`${item.episodes}万热度`)
                          .fontSize(12)
                          .fontColor($r('app.color.text_tag_color'))
                          .padding({ right: 8})
                          .borderRadius(4)
                      }
                      .justifyContent(FlexAlign.Center)
                      .alignItems(VerticalAlign.Center)
                      .padding({ left: 8, right: 4, top: 4, bottom: 4 })
                      .position({ bottom: 0, right: 0 })
                      .zIndex(1)

                    }
                    .width('100%')
                    .height(150)

                    Row() {
                      Text(item.title)
                        .fontSize(14)
                        .fontColor($r('app.color.text_color'))
                        .textAlign(TextAlign.Start)
                        .maxLines(1)
                        .textOverflow({overflow: TextOverflow.Ellipsis})
                        .margin({
                          top: 6,
                          bottom: 6
                        })
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.Start)

                    Row() {
                      Text(item.tag)
                        .fontSize(12)
                        .fontColor($r('app.color.text_secondary_color'))
                        .textAlign(TextAlign.Start)

                      Text('·')
                        .fontSize(12)
                        .fontWeight(FontWeight.Bold)
                        .fontColor($r('app.color.text_secondary_color'))
                        .padding({
                          left: 1,
                          right: 1
                        })

                      Text(`全${item.episodes}集`)
                        .fontSize(12)
                        .fontColor($r('app.color.text_secondary_color'))
                        .textAlign(TextAlign.Start)

                    }
                    .width('100%')
                    .justifyContent(FlexAlign.Start)

                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Start)
                }
              })
            }
            .columnsTemplate('1fr 1fr 1fr')
            .columnsGap(12)
            .rowsGap(12)
            .width('100%')
            .height(460)
            .scrollBar(BarState.Off)
          }
          .linearGradient({
            angle: 135,
            colors: [
              [$r('app.color.start_background'), 0.0],
              [$r('app.color.end_background'), 0.3],
              [$r('app.color.background'), 0.7],
              [$r('app.color.background'), 1.0]
            ]
          })
          .borderRadius({
            topLeft: 16,
            topRight: 16
          })
          .padding({
            left: 16,
            right: 16
          })
        }
      }
      .id('content')
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .padding({
        top: this.topRectHeight,
        bottom: this.bottomRectHeight - 12,
      })
      .alignRules({
        top: { anchor: 'header', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background'))
  }

  getColor(index: number): ResourceColor | string {
    if (index === 0) {
      return 'rgba(255, 128, 65, 1)'
    } else if (index === 1) {
      return 'rgba(8, 206, 189, 1)'
    } else if (index === 2) {
      return 'rgba(58, 135, 251, 1)'
    }
    return 'rgba(0, 0, 0, 0.32)'
  }
}