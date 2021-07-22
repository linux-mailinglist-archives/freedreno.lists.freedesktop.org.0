Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9D3D2CB0
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 21:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C49E6ECAE;
	Thu, 22 Jul 2021 19:23:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605F6EA17
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 19:23:30 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 o2-20020a0568200402b0290258a7ff4058so1565093oou.10
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
 b=izcRIsj/EbWJh2UlEyRKj40y1KJNwWt0Q2c1z272aeGQMkliR2QZrhh6QNUdoR5Es9
 V7pk9F6usbRo2am9EmW+nMLQuE1okDufGPdBXN7H1h4O/JeHfh9UN2viQ0WoQufBZdph
 iaC04st/zMeCrBtvGKAC1cuw8RO+Evjuza5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
 b=GOD8XFxXowvvSlge7QKnOeinotwQlCPnYJtZUdLRzSzv4N2N5goFZpTp2IbvcbMLBt
 4IJOIAiXpR+KKQyoZ26Ab39DTWBEq+/0WXDU4y3FYVZik4jnzJFBphoR8SWYvzIIwY+/
 o+T0mvDPRI+jWDsvKV7tDfW+R2OxSZIRsXMZNuyH3nsjY77JACtfbqHtmVWpBQKCZ27E
 Bj5TjPusJL8RMfjLl/BOgCvSZg2iB/70waf29+t5shxJgADFVyDe653nTI5zY+HU3ZlY
 HCpZhBTISMyHzsEiLW34K+U4DaX/2P2uyWoekxIyUskLnq8rJqts/Z2T7xWoZL2f1y0w
 C1DQ==
X-Gm-Message-State: AOAM533Cd5RssAG4+UFfYr4elhPlzBN5vouxvvpJBUwzpqy8knnDwwVg
 QljZ/JSQzdfIt2BFlt4ghRisaqZdnVbFJTh0BW2xCQ==
X-Google-Smtp-Source: ABdhPJwOn1Wqvg6925aBRm1hyQfmTcQevAAVZRd+qWgj03ySy8FvBlagvUplNKj1BkW0pcDmQUOYtYNffSKp8cW+XBM=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr646286ooi.80.1626981809874;
 Thu, 22 Jul 2021 12:23:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:23:29 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:23:29 +0000
Message-ID: <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v2 5/7] drm/msm/dp: return correct edid
 checksum after corrupted edid checksum read
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
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:05)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..0fdb551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>         panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>
>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> -               u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               u8 checksum;
> +
> +               if (dp_panel->edid)
> +                       checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               else
> +                       checksum = dp_panel->connector->real_edid_checksum;

Is there any reason why we can't use connector->real_edid_checksum all
the time?

>
>                 dp_link_send_edid_checksum(panel->link, checksum);
>                 dp_link_send_test_response(panel->link);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
