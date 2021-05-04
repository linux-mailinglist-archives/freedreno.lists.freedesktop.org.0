Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD0372519
	for <lists+freedreno@lfdr.de>; Tue,  4 May 2021 06:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803266E1B1;
	Tue,  4 May 2021 04:30:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8437B6E1B1
 for <freedreno@lists.freedesktop.org>; Tue,  4 May 2021 04:30:45 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 x54-20020a05683040b6b02902a527443e2fso7167722ott.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 May 2021 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
 b=n07xEkrQlpcNFHZtxrsbxZDJwL4UA2XXfU57czlJaBZdhz5dhG2P0aX3piaOhtfaYk
 mZxQDWRyM2Q0bBkDd/Sf5YcxIjE3igvPrYlfaQW0PbFon2KVErZwDxLzOcJX8R6hlWnp
 hvflSpdfnmEV0kTYIFbtFLVmseavbB/WvPUTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
 b=B57BDRmpmsWuM15qBQBwLGPAx8pAN8MB+Lcxkl5TlESnahUkRZqnhqZQRA5U4h8Iqo
 /MdWJri1m9PNglMQnuE+P7Ey9K8x977uH0Z49Ivaj31vaX0W3zk1Z6m6q0oEgGRS+PdZ
 vy8iMXx9BC75gZroJIMDdrGrOos1aedeEONpm1xmNtStFdQfgGr/rBMhKqV4zOWGurnp
 wM210/eX+G82gAk9T+EgP7dH/5erWNQta2jNvrYhE8kzINRAaXRCRA+tq7g3Cx5EoR90
 pzlXa0K3kwK/HtnHCQSJKE+n6+vD1erW6LI2+vCTEOio5iXVBSErPqUzpP8JmDuA7aiE
 Xqjg==
X-Gm-Message-State: AOAM533z9XRjImIGG8H98nZ7PShqAeF+dt4DoXNQSlRDuqfKYW6TbEXM
 UjkvJJIb/fAc51iqYQ6/IenriwbEiyaucp2oncF7lw==
X-Google-Smtp-Source: ABdhPJwq6mdnfPJ4VcbDYA3afNLoRfzA/g9YDHhjK7Sh6BJt5OqOsgrHpb7zBzgoWlk7yUMrL73oVH49hU1RgHE5DN0=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr16982065ota.246.1620102644899; 
 Mon, 03 May 2021 21:30:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:30:44 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 3 May 2021 21:30:44 -0700
Message-ID: <CAE-0n53_CMed87hPgBFjN_dmRrPkfG3ZBjHCni2+2kxp_QfFpw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v4 1/4] drm/msm/dp: check sink_count before
 update is_connected status
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-21 16:37:35)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
>
> Changes in v4:
> -- none
>
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..0ba71c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -586,10 +586,8 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>         mutex_lock(&dp->event_mutex);
>
>         state = dp->hpd_state;
> -       if (state == ST_CONNECT_PENDING) {
> -               dp_display_enable(dp, 0);
> +       if (state == ST_CONNECT_PENDING)
>                 dp->hpd_state = ST_CONNECTED;
> -       }

This part has been there since commit 8ede2ecc3e5e ("drm/msm/dp: Add DP
compliance tests on Snapdragon Chipsets") so we should add that tag here
too, like

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
Snapdragon Chipsets")

It would also be nice if this hunk was explained. It doesn't make sense
to me that a timeout would enable the display so maybe that can be
called out in the commit text about why we remove the call here.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
