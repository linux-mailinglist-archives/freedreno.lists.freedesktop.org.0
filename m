Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA5367147
	for <lists+freedreno@lfdr.de>; Wed, 21 Apr 2021 19:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156446E995;
	Wed, 21 Apr 2021 17:26:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9856E995
 for <freedreno@lists.freedesktop.org>; Wed, 21 Apr 2021 17:26:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619026000; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bUrNF799xx1oKXdWzhByA5YNjTKF+oLeMXDyY+4kcb0=;
 b=Sy7ld2xRlPWYoKBqVeMgJxIbgu0HASDp5ziW7u0WUvKdX5OSTVuLRlc4Eh7YQFzdbdzX0WSN
 6ACCbokEzUFtFw/vZT2ng42Q93soC4RPhC0+0bNBJpsKBciQfDhMLB7vuhIScugOsMz0w+av
 S0aWWYGoK3hszg4Oc380QgqsTTA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60806040c39407c3274f59ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 17:26:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F1F13C43460; Wed, 21 Apr 2021 17:26:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9061C433F1;
 Wed, 21 Apr 2021 17:26:21 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 21 Apr 2021 10:26:21 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
 <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
Message-ID: <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: service only one irq_hpd if
 there are multiple irq_hpd pending
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-04-20 15:01, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-16 13:27:57)
>> Some dongle may generate more than one irq_hpd events in a short 
>> period of
>> time. This patch will treat those irq_hpd events as single one and 
>> service
>> only one irq_hpd event.
> 
> Why is it bad to get multiple irq_hpd events in a short period of time?
> Please tell us here in the commit text.
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 5a39da6..0a7d383 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -707,6 +707,9 @@ static int dp_irq_hpd_handle(struct 
>> dp_display_private *dp, u32 data)
>>                 return 0;
>>         }
>> 
>> +       /* only handle first irq_hpd in case of multiple irs_hpd 
>> pending */
>> +       dp_del_event(dp, EV_IRQ_HPD_INT);
>> +
>>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>>         if (ret == -ECONNRESET) { /* cable unplugged */
>>                 dp->core_initialized = false;
>> @@ -1300,6 +1303,9 @@ static int dp_pm_suspend(struct device *dev)
>>         /* host_init will be called at pm_resume */
>>         dp->core_initialized = false;
>> 
>> +       /* system suspended, delete pending irq_hdps */
>> +       dp_del_event(dp, EV_IRQ_HPD_INT);
> 
> What happens if I suspend my device and when this function is running I
> toggle my monitor to use the HDMI input that is connected instead of 
> some
> other input, maybe the second HDMI input? Wouldn't that generate an HPD
> interrupt to grab the attention of this device?
no,
At this time display is off. this mean dp controller is off and mainlink 
has teared down.
it will start with plug in interrupt to bring dp controller up and start 
link training.
irq_hpd can be generated only panel is at run time of operation mode and 
need attention from host.
If host is shutting down, then no need to service pending irq_hpd.

> 
>> +
>>         mutex_unlock(&dp->event_mutex);
>> 
>>         return 0;
>> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>>         /* stop sentinel checking */
>>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> 
>> +       /* link is down, delete pending irq_hdps */
>> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
>> +
> 
> I'm becoming convinced that the whole kthread design and event queue is
> broken. These sorts of patches are working around the larger problem
> that the kthread is running independently of the driver and irqs can
> come in at any time but the event queue is not checked from the irq
> handler to debounce the irq event. Is the event queue necessary at all?
> I wonder if it would be simpler to just use an irq thread and process
> the hpd signal from there. Then we're guaranteed to not get an irq 
> again
> until the irq thread is done processing the event. This would naturally
> debounce the irq hpd event that way.
event q just like bottom half of irq handler. it turns irq into event 
and handle them sequentially.
irq_hpd is asynchronous event from panel to bring up attention of hsot 
during run time of operation.
Here, the dongle is unplugged and main link had teared down so that no 
need to service pending irq_hpd if any.


> 
>>         dp_display_disable(dp_display, 0);
>> 
>>         rc = dp_display_unprepare(dp);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
