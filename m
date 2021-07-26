Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058873D685D
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 23:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5026EB85;
	Mon, 26 Jul 2021 21:01:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB336EB85
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 21:01:58 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l126so12565848oib.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
 b=HcCfoB6PsDvFiCdKkUBvoH+mjMQf2ALTf9fhKLE/VjZ40hTKVuYuqbLnGBDUxHfxAT
 RHM5WJnd2hxeq1PTA0sGFMwF/UaO8yBbNY4WMZ7M4XFoki+iBfoUq6vM1TyoEawMx/bW
 eI0cTwTUN6xfERJ60Y4fIMo5CzpKfr9eewgqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
 b=tUAd+KdRhP6v/izWawJklWUwXAcHN2wi549AAX9k5cSvM3SsjlIAyi5RNv7jGZu3+q
 kOBu6pL5bC5sNXNbQzWPAFTsLwjx9L4zibYosGpJWGsrX4ics/dilYERRzXh/uNFqof5
 YyxAj3eYwAUY2SA4VXjuI1OXADkc4hIBh+RfXrt4e53fk/wZw5anVC7B3hctP8WO5gFB
 CaMqDeImS/JOaDsDnZTXs2IK3oGahEJg0HIeCP9+20r+NLUDILcjs3CLzCwkR19uPMJX
 wu2Zz1CEsePNO7eX8QL06G2a50/xHTrulFigG9U4ePC4GelrMnwa/TGLqm0eH1I2uXL/
 vj8A==
X-Gm-Message-State: AOAM533b97p1h3QauuRDeib1neUCVZgKCJbXn9kGFi3RVqA//yrIO8I1
 7OUT9tGCg+y9+z6WFRrjP3Y1/UHApIrGhCyBWw0H7g==
X-Google-Smtp-Source: ABdhPJy+zOV5H5QT2ONLq6/MZa4bLjvvPnTfl/f+51Qfcb8grTupNAQqi5h8GLKoIRhK4zyX3pBhEOFnFHlKvFHlnMU=
X-Received: by 2002:aca:afd7:: with SMTP id y206mr139164oie.1.1627333317558;
 Mon, 26 Jul 2021 14:01:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:01:57 -0400
MIME-Version: 1.0
In-Reply-To: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
References: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 17:01:57 -0400
Message-ID: <CAE-0n51HF8E7x71Ru4EXoyYePoBNcrngwUE6H7b=tpgXuHdxHQ@mail.gmail.com>
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

Can this be dp_display instead of g_dp_display?

> +                               dp->dp_display.is_connected);
> +
> +
>         mutex_unlock(&dp->event_mutex);
>
>         return 0;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
