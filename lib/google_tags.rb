module GoogleTags

  include Radiant::Taggable

  tag 'google_cse' do |tag|
    googleCseId = tag.attr['gcseid'] || Radiant::Config['google.cse_id']
    url = tag.attr['url'] || 'search-results'

    (<<-JS).html_safe
    <!-- Google CSE -->
    <script type="text/javascript">
    //<![CDATA[
      if (window.location.href.indexOf('#{url}') != -1) {
        (function() {
          var cx = "#{googleCseId}";
          var gcse = document.createElement('script');
          gcse.type = 'text/javascript';
          gcse.async = true;
          gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
              '//www.google.com/cse/cse.js?cx=' + cx;
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(gcse, s);
        })();
      }
    //]]>
    </script>
    <!-- End Google CSE -->
    JS
  end

  tag 'google_tag_manager' do |tag|
    googleTmId = tag.attr['gtmid'] || Radiant::Config['google.tag_manager_id']

    (<<-JS).html_safe
    <!-- Google Tag Manager -->
    <noscript>
      <iframe height="0" width="0" src="//www.googletagmanager.com/ns.html?id=#{googleTmId}" style="display:none;visibility:hidden" />
    </noscript>

    <script type="text/javascript">
    //<![CDATA[
      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});
        var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;
        j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','#{googleTmId}');
    //]]>
    </script>
    <!-- End Google Tag Manager -->
    JS
  end
end
