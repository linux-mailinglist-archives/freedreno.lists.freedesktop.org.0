Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466C3B6BEE
	for <lists+freedreno@lfdr.de>; Tue, 29 Jun 2021 03:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9EB6E364;
	Tue, 29 Jun 2021 01:07:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981546E364
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 01:07:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624928861; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DniW7efyyS7ES8PwQW5VveHX361k3FnVCGW5YegW91I=;
 b=jm9pjsptt+++fMMy92a9vWgRzc0dWHujtvN5NsAgj5qSdLqNTDvOXb7GJsUNrnQmA98Kw2w5
 6Lml78TC7J9Gqak9zjTzXOL5IEAXq+u8dsylZwnNwaYv+lL7e8hhuZpHli83FCYRp9vnBHGl
 l8jeCkw7bfL0V2qMtV8j8/U0+uE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60da725cad0600eede47e091 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 01:07:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9F1F7C43460; Tue, 29 Jun 2021 01:07:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7597BC433D3;
 Tue, 29 Jun 2021 01:07:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Jun 2021 18:07:39 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <YNpvf8rpWoMFTcBt@yoga>
References: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
 <b3456d3e4376ae1e9776f03e14513a35@codeaurora.org> <YNpvf8rpWoMFTcBt@yoga>
Message-ID: <2d922441927d1c2a757b5b197f496906@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Make it possible to enable the
 test pattern
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-06-28 17:55, Bjorn Andersson wrote:
> On Mon 28 Jun 19:31 CDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> On 2021-06-28 17:22, Bjorn Andersson wrote:
>> > The debugfs interface contains the knobs to make the DisplayPort
>> > controller output a test pattern, unfortunately there's nothing
>> > currently that actually enables the defined test pattern.
>> >
>> > Fixes: de3ee25473ba ("drm/msm/dp: add debugfs nodes for video pattern
>> > tests")
>> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> 
>> This is not how this debugfs node works. This is meant to be used 
>> while
>> running
>> DP compliance video pattern test.
>> 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c
>> 
>> While the compliance test is being run with this msm_dp_compliance app
>> running,
>> it will draw the test pattern when it gets the "test_active" from the
>> driver.
>> 
>> The test pattern which this app draws is as per the requirements of 
>> the
>> compliance test
>> as the test equipment will match the CRC of the pattern which is 
>> drawn.
>> 
>> The API dp_panel_tpg_config() which you are trying to call here draws 
>> the DP
>> test pattern
>> from the DP controller hardware but not the pattern which the 
>> compliance
>> test expects.
>> 
> 
> So clearly not an oversight, but rather me not understanding how to use
> the test pattern.
> 
> You say that I should run msm_dp_compliance while the test is running,
> so how do I run the test?

There are two test patterns with different purposes. The one which the 
msm_dp_compliance
draws is strictly for the DP compliance test and it needs even the DPU 
to draw the frame because
it sets up the display pipeline and just draws the buffer.

That is not what you are looking for here.

So rather than trying to run msm_dp_compliance on your setup, just try 
calling dp_panel_tpg_config().
We typically just call this API, right after the link training is done.
But if you really need a debugfs node for this, you can write up a 
separate debugfs for it
Something like:

echo 1 > dp/tpg/en

Lets not disturb this one.

> 
>> Its just a debug API to call when required during bringup/debug 
>> purposes.
>> 
> 
> Yes, I was trying to isolate the DP code from some misconfiguration in
> the DPU during bringup and with this fix the debugfs interface became
> useful.

> 
> Regards,
> Bjorn
> 
>> Hence this is not the place to call it as it will end up breaking CTS.
>> 
>> Thanks
>> 
>> Abhinav
>> 
>> > ---
>> >  drivers/gpu/drm/msm/dp/dp_debug.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > index 2f6247e80e9d..82911af44905 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > @@ -305,6 +305,8 @@ static ssize_t dp_test_active_write(struct file
>> > *file,
>> >  				debug->panel->video_test = true;
>> >  			else
>> >  				debug->panel->video_test = false;
>> > +
>> > +			dp_panel_tpg_config(debug->panel, debug->panel->video_test);
>> >  		}
>> >  	}
>> >  	drm_connector_list_iter_end(&conn_iter);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
