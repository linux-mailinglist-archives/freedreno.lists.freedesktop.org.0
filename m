Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41343D6978
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 00:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B43B7317B;
	Mon, 26 Jul 2021 22:26:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57349731A8
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 22:26:16 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id z26so12779541oih.10
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xSput0mTBokah6l9L7iDEvqfAkDOlqRBcOYWvnWkg8w=;
 b=LfwtnFUQXnxD511/yo8ZxT7kqVeQ5iq8HSIl5m20gkTW6T0Qkdl6/YKYSfh6Wg+jJ6
 BVHEyEqVeaKC3wAxxgnAvLe5smnz+HzTy3YReyXEx5tFaLqXnSBKEfdVNnXdD8cqo04P
 CRJIj4l0Hvrlxs+2DmNC+Wff1vR7xeJGqcAA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xSput0mTBokah6l9L7iDEvqfAkDOlqRBcOYWvnWkg8w=;
 b=ezz/Jnie342JijShGJrkKtygcp6CvM/7aaWUBH8pDzyt3gFuYGT4mHWWrju4bZT6Mf
 4dzxX6pUrO30ZyPSPedgGYqu8xEsx/uzomVEwKi1mmwPjMPQY978hbmHo7lVa5WPWZYE
 QEvFrwlnl3C62Uss48o30cqathbTapVDcrpY6Lb2gyNHpb9MWwkaNv3OGDcv6odQKMIZ
 vlX/arIT9cXO9qOe73MMKKtpciXr07AizBQ/xY3EE5ab9G/9yV+A3IFcfBly3SdwdRJJ
 WgZLyxe7CG4fDbEWJml+1cgHd33GKMVb0tdeFYA3fqrsD7y42/iP9VGiBOOtFEw/hjp+
 mcpg==
X-Gm-Message-State: AOAM532lPlYNOgrDQOMiGvxgix5YnU1g060j9Oh/XXcoQ+X0XcQonFwm
 OcDKc4JUB2hLq9ztX0JpNLzHnt1/0mQ+z3uYNTHwgA==
X-Google-Smtp-Source: ABdhPJxAPKNqUePhUnMW58bIZi6hbUqGSsjTwese7bc2NMQxiVuWSTHpmEV0RaR2jSgi+QJ8pzhBS+gPZyxSMbVyqtk=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr917454oib.166.1627338375634; 
 Mon, 26 Jul 2021 15:26:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 18:26:15 -0400
MIME-Version: 1.0
In-Reply-To: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
References: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 18:26:15 -0400
Message-ID: <CAE-0n50TV8j24x02VqVd0c6+zEr5Q++GN5xq_urQW3PiJ16QHQ@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: signal audio plugged change
 at dp_pm_resume
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-23 09:55:39)
> There is a scenario that dp cable is unplugged from DUT during system
> suspended  will cause audio option state does not match real connection
> state. Fix this problem by Signaling audio plugged change with realtime
> connection status at dp_pm_resume() so that audio option will be in
> correct state after system resumed.
>
> Changes in V2:
> -- correct Fixes tag commit id.
>
> Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  1 file changed, 4 insertions(+)

I noticed that with or without this patch I still have a problem with an
apple dongle where if I leave the dongle connected but unplug the HDMI
cable during suspend the audio device is still there when I resume. The
display looks to be connected in that case too, according to modetest. I
don't know if you want to roll that into this patch or make another
follow-up patch to fix it, but it seems like the sink count isn't
updated on resume? Did commit f591dbb5fb8c break a bunch of logic in
here because now the link is powered down properly and so sink_count
isn't updated properly?

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..2b660e9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1339,6 +1339,10 @@ static int dp_pm_resume(struct device *dev)
>         else
>                 dp->dp_display.is_connected = false;
>
> +       dp_display_handle_plugged_change(g_dp_display,
> +                               dp->dp_display.is_connected);
> +
> +

There's also a double newline here that we should probably remove.

>         mutex_unlock(&dp->event_mutex);
>
>         return 0;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
