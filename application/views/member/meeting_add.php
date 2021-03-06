                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <article class="main-section">
                            <div class="minutes-WD">
                                <header class="title clearfix">
                                    <input type="hidden" id='id' value="<?php  echo($id) ?>">
                                    <h2><input type="text" id="title" value="New Meeting"></h2>
                                    <div class="action text-right"><a href="#">subtitle</a></div>
                                </header>
                                <div class="today-minuts">
                                    <textarea id="getTodayMinuts"></textarea>
                                </div>
                            </div>
                        </article>
                    </div>
                    <aside class="col-md-4 col-xs-12">

                        <div class="side-panal-wrap">
                            <article class="aside-section">
                                <header class="title clearfix">
                                    <h2>Goals</h2>
                                    <div class="action text-right"><a href="#">Set new goal</a></div>
                                </header>
                                <div class="">
                                    <ol id="goalsList">
                                        <li><input type="text" id="getGoals" class="inputboxline" /></li>
                                    </ol>
                                </div>
                            </article>

                            <article class="aside-section">
                                <header class="title clearfix">
                                    <h2>Attendies</h2>
                                    <div class="action text-right"><a href="#">Gest member</a></div>
                                </header>
                                <div class="">
                                  <ul class="list-unstyled">
                                        <li><label><span>Nalinda bandara</span></label></li>
                                        <li><label><span>Shabith The</span></label></li>
                                        <li><label><span>Ishan Rath</span></label></li>
                                        <li><label><span>Ranuska goo</span></label></li>
                                  </ul>
                                </div>
                            </article>

                            <article class="aside-section">
                                <header class="title clearfix">
                                    <h2>Tags</h2>
                                </header>
                                <div class="">
                                    <style>
                                        #tagList  li{
                                            border: 1px solid;
                                            margin: 5px;
                                            padding: 2px 8px;
                                            cursor: pointer;
                                        }
                                    </style>
                                    <ul id="tagList" class="list-inline list-unstyled">
                                        <li style="display: block" ><input type="text" id="getTags" placeholder="tags help you to find later" class="inputboxline text-center" /></li>
                                    </ul>
                                </div>
                            </article>

                            <article class="aside-section">
                                <header class="title clearfix">
                                    <h2>Duration</h2>
                                </header>
                                <div class="">
                                    <input type="text" id="GetDuration" placeholder="HH:MM" class="inputboxline text-center" />
                                </div>
                            </article>

                        </div>
                    </aside>
                </div>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#title').blur(function(event) {
            $.ajax({
                url: '<?php echo site_url("api/meeting/data/".$id) ?>',
                type: 'PUT',
                dataType: 'application/json',
                data: {title: $('#title').val(),sub_title: $('#sub_title').val(),note:$('#note').val() },
            })
            .done(function() {
                console.log("success");
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
            
        });
    });
</script>