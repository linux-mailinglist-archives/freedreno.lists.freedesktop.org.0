Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24D3283DF0
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 20:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D7F89CAD;
	Mon,  5 Oct 2020 18:02:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306AD89CAD
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 18:02:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601920932; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ld9Fueldp78QECrk1tT6tf3UhOcfsqkKomFN6EN3Tjg=;
 b=revFGL3KD52hdpDj55xt3RhBotZj/3o5jKAOAO8Pzm0dzJ2d+SmZz0nsb4yJeou5ULULy+dm
 BR3gsMomzt0mjjWeug9EdMUCzr/BbsKWwOwBIUmDmwrkO+DlFCcGCDGkKkOeCbdL5T0SjJnD
 I98qgQMqvGm5QBbTXRmWtIBJ2Vs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7b5fa3f9168450eae26172 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 18:02:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48DEAC43382; Mon,  5 Oct 2020 18:02:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 47ACAC433C8;
 Mon,  5 Oct 2020 18:02:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 05 Oct 2020 11:02:10 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
References: <20201002220919.17245-1-khsieh@codeaurora.org>
 <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
Message-ID: <0de13a805820e4d73b8f906682386845@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fixes wrong connection state
 caused by failure of link train
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

On 2020-10-02 19:12, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-10-02 15:09:19)
>> Connection state is set incorrectly happen at either failure of link 
>> train
>> or cable plugged in while suspended. This patch fixes these problems.
>> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Any Fixes: tag?
> 
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 52 
>> ++++++++++++++---------------
>>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++
>>  2 files changed, 31 insertions(+), 26 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 431dff9de797..898c6cc1643a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -340,8 +340,6 @@ static int dp_display_process_hpd_high(struct 
>> dp_display_private *dp)
>>         }
>> 
>>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>> -
>> -
>>  end:
>>         return rc;
>>  }
> 
> Not sure we need this hunk
> 
>> @@ -1186,19 +1180,19 @@ static int dp_pm_resume(struct device *dev)
>> 
>>         dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> 
>> +       /* start from dis connection state */
> 
> disconnection? Or disconnected state?
> 
>> +       atomic_set(&dp->hpd_state, ST_DISCONNECTED);
>> +
>>         dp_display_host_init(dp);
>> 
>>         dp_catalog_ctrl_hpd_config(dp->catalog);
>> 
>>         status = dp_catalog_hpd_get_state_status(dp->catalog);
>> 
>> -       if (status) {
>> +       if (status)
>>                 dp->dp_display.is_connected = true;
>> -       } else {
>> +       else
>>                 dp->dp_display.is_connected = false;
>> -               /* make sure next resume host_init be called */
>> -               dp->core_initialized = false;
>> -       }
>> 
>>         return 0;
>>  }
>> @@ -1214,6 +1208,9 @@ static int dp_pm_suspend(struct device *dev)
>>         if (dp_display->power_on == true)
>>                 dp_display_disable(dp, 0);
>> 
>> +       /* host_init will be called at pm_resume */
>> +       dp->core_initialized = false;
>> +
>>         atomic_set(&dp->hpd_state, ST_SUSPENDED);
>> 
>>         return 0;
>> @@ -1343,6 +1340,9 @@ int msm_dp_display_enable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>> 
>>         mutex_lock(&dp_display->event_mutex);
>> 
>> +       /* delete sentinel checking */
> 
> Stop sentinel checking?
> 
>> +       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>> +
>>         rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>>         if (rc) {
>>                 DRM_ERROR("Failed to perform a mode set, rc=%d\n", 
>> rc);
>> @@ -1368,9 +1368,8 @@ int msm_dp_display_enable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>>                 dp_display_unprepare(dp);
>>         }
>> 
>> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>> -
>> -       if (state == ST_SUSPEND_PENDING)
>> +       /* manual kick off plug event to train link */
>> +       if (state == ST_DISPLAY_OFF)
>>                 dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
>> 
>>         /* completed connection */
>> @@ -1402,20 +1401,21 @@ int msm_dp_display_disable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>> 
>>         mutex_lock(&dp_display->event_mutex);
>> 
>> +       /* delete sentinel checking */
> 
> Stop sentinel checking?
> 
>> +       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> +
>>         dp_display_disable(dp_display, 0);
>> 
>>         rc = dp_display_unprepare(dp);
>>         if (rc)
>>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>> 
>> -       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> -
>>         state =  atomic_read(&dp_display->hpd_state);
>>         if (state == ST_DISCONNECT_PENDING) {
> 
> I don't understand the atomic nature of this hpd_state variable. Why is
> it an atomic variable? Is taking a spinlock bad? What is to prevent the
> atomic read here to not be interrupted and then this if condition check
> be invalid because the variable has been updated somewhere else?
hpd_state variable updated by multiple threads. however it was protected 
by mutex.
in theory, it should also work as u32. since it was declared as atomic 
from beginning
and it does not cause any negative effects, can we keep it as it is?

>>                 /* completed disconnection */
>>                 atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
>>         } else {
>> -               atomic_set(&dp_display->hpd_state, 
>> ST_SUSPEND_PENDING);
>> +               atomic_set(&dp_display->hpd_state, ST_DISPLAY_OFF);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
