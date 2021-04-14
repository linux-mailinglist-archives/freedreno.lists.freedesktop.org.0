Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095735EB66
	for <lists+freedreno@lfdr.de>; Wed, 14 Apr 2021 05:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D326E43A;
	Wed, 14 Apr 2021 03:17:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05046E43A
 for <freedreno@lists.freedesktop.org>; Wed, 14 Apr 2021 03:17:03 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so5239523pja.5
 for <freedreno@lists.freedesktop.org>; Tue, 13 Apr 2021 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=UyWa4apo3TOwjYMjSQh4reAE84rIdbfCEBEygOg3904=;
 b=dpee4gxvPllwyK85S+W/u7eMJLRfSQ+uwClt/aapdhbdlHZGhWOGPRlJePeQGICFEL
 je7oTUk+b7fhD2sJ2AQTGcVkYsNvMoMyt05wpLo6FZv4lDwM3UhCzxvKiLBUWbWp6fMX
 LuZuKnH3eWPDRtTUVlY7iNwkZDEuDuTNNirRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=UyWa4apo3TOwjYMjSQh4reAE84rIdbfCEBEygOg3904=;
 b=LSTt8THdRdav5rv1rPmWWMnDEZVBW+Fs4IAbRqeSgULoKgVN3hfiK4mWm+jzMicBeu
 lw4otxtyRN0vd2Icj1sdjGn/MDn6UgjKgUA6xEZNsGVOpiQeuK1DT83FSITxS5IRePiS
 RhrZvR/vpcfpOZOiqg8tN1h+1JaE2xdj6G43ME5VQGWAhfNCiMQgWne8MLCha7hv+vMb
 T5/3fB0idQ5dLWAz7qOvRQVBGicGg1xBSRT1w32T9Wv0LEo6BiGuwvkAM6OqzBX9tB6r
 Zu1kSLvUy9jlT1JUeSVaOrTtU2akRWYaRtsF9lOvKrQk/CbMGjjqW1RHlbe+QSQjgPTg
 Lv2g==
X-Gm-Message-State: AOAM530xgSFAghEbMus5BnOC94Vt3nVuRMdwlD90moYSqHH4VT2LAQjq
 0hiaf7AIAFuPmkIPjmF0l4Bn5Q==
X-Google-Smtp-Source: ABdhPJxG8gJn4/9Tdm2GnwnYN6cg36Ox7phGHtV14+oMYkxG3dWfNU0i/W1zwe2CYbxOe2Z31HRSWQ==
X-Received: by 2002:a17:902:8f8d:b029:ea:e059:84a6 with SMTP id
 z13-20020a1709028f8db02900eae05984a6mr17306846plo.35.1618370223402; 
 Tue, 13 Apr 2021 20:17:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id u24sm128634pga.78.2021.04.13.20.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:17:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618355490-5292-1-git-send-email-khsieh@codeaurora.org>
References: <1618355490-5292-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Apr 2021 20:17:01 -0700
Message-ID: <161837022104.3764895.807226402876043006@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/dp: do not re initialize of
 audio_comp at display_disable()
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-13 16:11:30)
> At dongle unplug, dp initializes audio_comp followed by sending disconnect
> event notification to audio and to make sure audio had shutdown completely
> by wait for audio completion notification at display_disable(). This patch

Is this dp_display_disable()? Doubtful that display_disable() is the
function we're talking about.

> will not re initialize audio_comp at display_disable() if audio shutdown
> is triggered by dongle unplugged.

This commit text seems to say the why before the what, where why is "dp
initializes audio_comp followed by sending disconnect.." and the what is
"this patch will no re-initialized audio_comp...". Can you reorder this
so the what comes before the why?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0ba71c7..1d71c95 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -894,8 +894,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> -               reinit_completion(&dp->audio_comp);
> -               dp_display_handle_plugged_change(dp_display, false);
> +               if (dp->hpd_state != ST_DISCONNECT_PENDING) {
> +                       reinit_completion(&dp->audio_comp);

Why is this reinitialized here at all? Wouldn't it make more sense to
initialize the completion once at cable plug in and then not initialize
the completion anywhere else? Or initialize the completion whenever
dp_display->audio_enabled is set to true and then only wait for the
completion here if that boolean is true? Or initialize the completion
when dp_display_handle_plugged_change() is passed true for the 'plugged'
argument?

I started reading the code and quickly got lost figuring out how
dp_display_handle_plugged_change() worked and the interaction between
the dp display code and the audio codec embedded in here. There seem to
be a couple of conditions that cut off things early, like
dp_display->audio_enabled and audio->engine_on. Why? Why does
dp_display_signal_audio_complete() call complete_all() vs. just
complete()? Please help! :(

> +                       dp_display_handle_plugged_change(dp_display, false);

I think it's this way because dp_hpd_unplug_handle() is the function
that sets the hpd_state to ST_DISCONNECT_PENDING and then reinitializes
the completion (why?) and calls dp_display_handle_plugged_change(). So
the commit text could say that reinitializing the completion again here
at dp_display_disable() is racing with the audio code in the case that
dp_hpd_unplug_handle() already called
dp_display_handle_plugged_change() and it would make more sense. But the
question still stands why that race even exists in the first place vs.
initializing the completion variable in only one place unconditionally
when the cable is connected, in dp_hpd_plug_handle() or
dp_display_post_enable().

> +               }
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>                                 HZ * 5))
>                         DRM_ERROR("audio comp timeout\n");
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
