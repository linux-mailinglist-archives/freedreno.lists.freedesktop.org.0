Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C5399A65
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 08:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49A6E0A8;
	Thu,  3 Jun 2021 06:03:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DE46E0A8
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 06:03:09 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id w127so5190435oig.12
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W4MRGvvlAsIvztCMODsejOnW9x+vcPEBs+GlUbnr7QU=;
 b=kPUJ5NjxGkUGtAhRbO5ZjIIXgnTH7iqzJmf4glxC699yJkOagEj5NCwDVwwBa4Kcn5
 UZaVpRJ+dogRyu9PWzJ+xA6ZJcmzaSWPbARjEQ6ZmY+VwM0+UH4dQTSjqrps7gu6iDPe
 XmUjSru4mP+DCOXotRSPPv1R1WLyOW0IH/CI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W4MRGvvlAsIvztCMODsejOnW9x+vcPEBs+GlUbnr7QU=;
 b=d6w5I62JPh+/mcJenNmXHfL5RFfTWc2mVhmt9dKeWISD3fXEVLXiieVOAhZwz+xFg9
 F9JqKFCEKwqgeNOgj60pBpbYXMbVSxJxN+QsAAD6N03EBTtKbn5PUf7j6x+k9ThNxoDV
 5GsyOgWqgRpHOaMJ3JS+ZOVx0rhiIJgm1jiAsj+5i7sOxUBAl7x1H21+Geq103blct40
 HEIGSnLlfmRmMMqUt/cspSaVj65LhusZKLGZEie2PqWKnCN9DvcTOL0lz+J8eOXiJZ/y
 ubvtzv8cpYNEb9NqDgIoxaLeEvicpKu3+rUbonhMt0pjEjjinNKT86CrqZ4Il/nggtU/
 ZTBQ==
X-Gm-Message-State: AOAM533FEvvJ3F2DqVwwHzc2YustHNWhdnkpI68JpwvxBYFNlfmrc3I1
 +ESjrAKiM/TEoXDGlCA2OBsJSeJqY68KKZfr4doRZw==
X-Google-Smtp-Source: ABdhPJwbZadfDpzhFToZSrCDEjvue32gZ2YzP9LLNu6q7SP0cOQDP7qleH6aBFPvVofyULuDdYDDPf7Y1Yeb6ZUQdwE=
X-Received: by 2002:aca:654d:: with SMTP id j13mr6376997oiw.125.1622700188427; 
 Wed, 02 Jun 2021 23:03:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 23:03:07 -0700
MIME-Version: 1.0
In-Reply-To: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
References: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 23:03:07 -0700
Message-ID: <CAE-0n516E_x+h2BFze0mozjdpwqa3_kb10cKWdcFURXkNj8k6w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: power off DP phy at suspend
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
Cc: linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-06-02 09:43:05)
> Normal DP suspend operation contains two steps, display off followed
> by dp suspend, to complete system wide suspending cycle if display is
> up at that time. In this case, DP phy will be powered off at display
> off. However there is an exception case that depending on the timing
> of dongle plug in during system wide suspending, sometimes display off
> procedure may be skipped and dp suspend was called directly. In this
> case, dp phy is stay at powered on (phy->power_count = 1) so that at
> next resume dp driver crash at main link clock enable due to phy is
> not physically powered on. This patch will call dp_ctrl_off_link_stream()
> to tear down main link and power off phy at dp_pm_suspend() if main link
> had been brought up.
>
> Changes in V2:
> -- stashed changes into dp_ctrl.c
> -- add is_phy_on to monitor phy state
>
> Changes in V3:
> -- delete is_phy_on
> -- call dp_ctrl_off_link_stream() from dp_pm_suspend()
>
> Changes in V4:
> -- delete changes made at dp_power.c
> -- move main link status checking to dp_pm_suspend
>
> Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)

This should be 8dbde399044b
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
