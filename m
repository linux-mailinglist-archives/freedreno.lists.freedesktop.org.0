Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B2367341
	for <lists+freedreno@lfdr.de>; Wed, 21 Apr 2021 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340AD6E9B1;
	Wed, 21 Apr 2021 19:15:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96366E0D9
 for <freedreno@lists.freedesktop.org>; Wed, 21 Apr 2021 18:55:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619031323; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y7qK94xUWLx6N7TlAKwTp7gAjHIxqzroU6QKac5T3Ag=;
 b=Fsx1pDyRcKcIVUvSKBL4/aCj5BsXW8ZUd1KjgmmYnLCzC9KrF3mEktNB27CMSiodl0/GbOkr
 OusI4CoXyQ+bSsloLWpQg7Vo3Koo74JtsO+NEBEnPO2UIm0HRM9KGb0WNkj/9hK84pLvxaHF
 qzQ0qUY5nZ2kv+lxTVq8vFUV7hU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6080751afebcffa80f1cdab1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 18:55:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7B4F7C433D3; Wed, 21 Apr 2021 18:55:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: aravindh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FDBBC433F1;
 Wed, 21 Apr 2021 18:55:21 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 21 Apr 2021 11:55:21 -0700
From: aravindh@codeaurora.org
To: khsieh@codeaurora.org
In-Reply-To: <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
 <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
 <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org>
Message-ID: <ddc1e372c5f864cd62c4e056ef2e6404@codeaurora.org>
X-Sender: aravindh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 21 Apr 2021 19:15:26 +0000
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
 abhinavk@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-04-21 10:26, khsieh@codeaurora.org wrote:
> On 2021-04-20 15:01, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2021-04-16 13:27:57)
>>> Some dongle may generate more than one irq_hpd events in a short 
>>> period of
>>> time. This patch will treat those irq_hpd events as single one and 
>>> service
>>> only one irq_hpd event.
>> 
>> Why is it bad to get multiple irq_hpd events in a short period of 
>> time?
>> Please tell us here in the commit text.
>> 
>>> 
>>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>>> ---
>>>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>> 
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 5a39da6..0a7d383 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -707,6 +707,9 @@ static int dp_irq_hpd_handle(struct 
>>> dp_display_private *dp, u32 data)
>>>                 return 0;
>>>         }
>>> 
>>> +       /* only handle first irq_hpd in case of multiple irs_hpd 
>>> pending */
>>> +       dp_del_event(dp, EV_IRQ_HPD_INT);
>>> +
>>>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>>>         if (ret == -ECONNRESET) { /* cable unplugged */
>>>                 dp->core_initialized = false;
>>> @@ -1300,6 +1303,9 @@ static int dp_pm_suspend(struct device *dev)
>>>         /* host_init will be called at pm_resume */
>>>         dp->core_initialized = false;
>>> 
>>> +       /* system suspended, delete pending irq_hdps */
>>> +       dp_del_event(dp, EV_IRQ_HPD_INT);
>> 
>> What happens if I suspend my device and when this function is running 
>> I
>> toggle my monitor to use the HDMI input that is connected instead of 
>> some
>> other input, maybe the second HDMI input? Wouldn't that generate an 
>> HPD
>> interrupt to grab the attention of this device?
> no,
> At this time display is off. this mean dp controller is off and
> mainlink has teared down.
> it will start with plug in interrupt to bring dp controller up and
> start link training.
> irq_hpd can be generated only panel is at run time of operation mode
> and need attention from host.
> If host is shutting down, then no need to service pending irq_hpd.
> 
>> 
>>> +
>>>         mutex_unlock(&dp->event_mutex);
>>> 
>>>         return 0;
>>> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp, 
>>> struct drm_encoder *encoder)
>>>         /* stop sentinel checking */
>>>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>>> 
>>> +       /* link is down, delete pending irq_hdps */
>>> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
>>> +
>> 
>> I'm becoming convinced that the whole kthread design and event queue 
>> is
>> broken. These sorts of patches are working around the larger problem
>> that the kthread is running independently of the driver and irqs can
>> come in at any time but the event queue is not checked from the irq
>> handler to debounce the irq event. Is the event queue necessary at 
>> all?
>> I wonder if it would be simpler to just use an irq thread and process
>> the hpd signal from there. Then we're guaranteed to not get an irq 
>> again
>> until the irq thread is done processing the event. This would 
>> naturally
>> debounce the irq hpd event that way.
> event q just like bottom half of irq handler. it turns irq into event
> and handle them sequentially.
> irq_hpd is asynchronous event from panel to bring up attention of hsot
> during run time of operation.
> Here, the dongle is unplugged and main link had teared down so that no
> need to service pending irq_hpd if any.
> 

As Kuogee mentioned, IRQ_HPD is a message received from the panel and is 
not like your typical HW generated IRQ. There is no guarantee that we 
will not receive an IRQ_HPD until we are finished with processing of an 
earlier HPD message or an IRQ_HPD message. For example - when you run 
the protocol compliance, when we get a HPD from the sink, we are 
expected to start reading DPCD, EDID and proceed with link training. As 
soon as link training is finished (which is marked by a specific DPCD 
register write), the sink is going to issue an IRQ_HPD. At this point, 
we may not done with processing the HPD high as after link training we 
would typically notify the user mode of the newly connected display, 
etc.
> 
>> 
>>>         dp_display_disable(dp_display, 0);
>>> 
>>>         rc = dp_display_unprepare(dp);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
