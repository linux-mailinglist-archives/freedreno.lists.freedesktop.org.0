Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F92F553F
	for <lists+freedreno@lfdr.de>; Thu, 14 Jan 2021 00:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5266ECAE;
	Wed, 13 Jan 2021 23:46:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DC26ECAE
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 23:46:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610581595; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OrIBbjvcy2CpauJvNx42vjvolQdIdZaCK1IWK1tHpYE=;
 b=Rfto1QA8X9Zx+gPE8b3x5g/11hIcgoIoREIPTyI5vFcq46TpBOzqJKOtorBa1sPYeI/o/jH4
 GF3mGx8f1M+/ToMYRKE8okKz7pwHFKvCKGQ+C5Qhj3lT0S1Yt4EAKwc2OZRDrQ65ZNGiiJDU
 gLEFNvnGeezbi4rB4TY3rDRD3zg=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fff8651d84bad3547f1975e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:46:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0A3F3C43464; Wed, 13 Jan 2021 23:46:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EE3CDC433CA;
 Wed, 13 Jan 2021 23:46:23 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 13 Jan 2021 15:46:23 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <161056938760.3661239.7140156995833982843@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
 <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
 <e7e1e5f8808fc35a3bed9e6291c76460@codeaurora.org>
 <161056938760.3661239.7140156995833982843@swboyd.mtv.corp.google.com>
Message-ID: <e5c5c32a7a1ee655577b2121ffffb16a@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: unplug interrupt missed
 after irq_hpd handler
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 tanmay@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-01-13 12:23, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 09:48:25)
>> On 2021-01-11 11:54, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-01-07 12:30:25)
>> >> There is HPD unplug interrupts missed at scenario of an irq_hpd
>> >> followed by unplug interrupts with around 10 ms in between.
>> >> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
>> >> irq_hpd handler should not issues either aux or sw reset to avoid
>> >> following unplug interrupt be cleared accidentally.
>> >
>> > So the problem is that we're resetting the DP aux phy in the middle of
>> > the HPD state machine transitioning states?
>> >
>> yes, after reset aux, hw clear pending hpd interrupts
>> >>
>> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> >> ---
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> index 44f0c57..9c0ce98 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct
>> >> dp_catalog *dp_catalog)
>> >>         return 0;
>> >>  }
>> >>
>> >> +/**
>> >> + * dp_catalog_aux_reset() - reset AUX controller
>> >> + *
>> >> + * @aux: DP catalog structure
>> >> + *
>> >> + * return: void
>> >> + *
>> >> + * This function reset AUX controller
>> >> + *
>> >> + * NOTE: reset AUX controller will also clear any pending HPD related
>> >> interrupts
>> >> + *
>> >> + */
>> >>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>> >>  {
>> >>         u32 aux_ctrl;
>> >> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog
>> >> *dp_catalog,
>> >>         return 0;
>> >>  }
>> >>
>> >> +/**
>> >> + * dp_catalog_ctrl_reset() - reset DP controller
>> >> + *
>> >> + * @aux: DP catalog structure
>> >
>> > It's called dp_catalog though.
>> registers access are through dp_catalog_xxxx
> 
> Agreed. The variable is not called 'aux' though, it's called
> 'dp_catalog'.
> 
>> >
>> >> + *
>> >> + * return: void
>> >> + *
>> >> + * This function reset DP controller
>> >
>> > resets the
>> >
>> >> + *
>> >> + * NOTE: reset DP controller will also clear any pending HPD related
>> >> interrupts
>> >> + *
>> >> + */
>> >>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
> 
> Right here.

fixed at v2
> 
>> >>  {
>> >>         u32 sw_reset;
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> index e3462f5..f96c415 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct
>> >> dp_ctrl_private *ctrl,
>> >>          * transitioned to PUSH_IDLE. In order to start transmitting
>> >>          * a link training pattern, we have to first do soft reset.
>> >>          */
>> >> -       dp_catalog_ctrl_reset(ctrl->catalog);
>> >> +       if (*training_step != DP_TRAINING_NONE)
>> >
>> > Can we check for the positive value instead? i.e.
>> > DP_TRAINING_1/DP_TRAINING_2
>> >
> 
> Any answer?

fixed at v2
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
