$(function() {
                                    var opinion = $("#opinion");

                                    //分类
                                    var opinionType = new ynmodule.opinionType()
                                    opinionType.container = $("#category");
                                    opinionType.init();
                                    opinionType.render();
                                    opinionType.delegate.click = function(type) {
                                        opinionList.type = type;
                                        opinionList.render();
                                    }

                                    //列表
                                    opinionList = new ynmodule.opinionList();
                                    opinionList.teacherid = room_teacherid;
                                    opinionList.container = opinion.find('.items');
                                    opinionList.bootpag = yn.bootpag(opinion)
                                    opinionList.type = 0;
                                    opinionList.init();
                                    opinionList.render();

                                    opinionList.bootpag.on('page', function(err, num) {
                                        opinionList.page = num;
                                        opinionList.render();
                                    })

                                    //精彩观点
                                    bestOpinion = new TeacherBestOpinion();
                                    bestOpinion.container = $('#bestOpinion .items');
                                    bestOpinion.teacherid = room_teacherid;
                                    bestOpinion.init();
                                    bestOpinion.render();

                                })