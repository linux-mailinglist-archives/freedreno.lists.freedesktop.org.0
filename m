Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40343996E5
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 02:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1706EE9B;
	Thu,  3 Jun 2021 00:23:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416FD6EE9B
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 00:23:05 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id f30so3235756oij.7
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sf9HPjX/QRw5TUCBPMkwIobQvyDUNSU8DnXWCThttng=;
 b=lXyYsmHjMCk031tkWhLnBU8kbmJTb+chywkiYEpXQeAU+2q/dSOjy3z1Cgk8KSjA9l
 j+ZetNlnwdTzYQz1XalYZazk9biXAeuqG7EJRxw6mND10vlWJBJ6oY9szlC7B40w1baY
 HwN3g6HA8M9ppv3NmmfcNnSKHX2k/2Ls1vF+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sf9HPjX/QRw5TUCBPMkwIobQvyDUNSU8DnXWCThttng=;
 b=iJYP/NOssCqu3MXUzM5aZzSqN6LFd0VyKrXFtyQGaeb0syNzL74FMkj3KXLPoTklIB
 vmzf3TOT+gXUiKq1C+1np5b/F86Z1JXnXJhrJsHaDUmrUJrYbTeQVi1iKm4lD32ZzVUP
 zC+nBx2T7CEQ7jVlrzXQIdemp+U1oNJy9KHaFrZDeoa77pyteKk4mtPApKb9cFnzamfV
 uHT3LV4wGNbriT7Mw2nzXTCXNhiXKYsYtczX16PHWdg0ACIhlFTVf8cAPYlfWtninIiG
 RxtCUvUlSAcUf/RGSFP4OSfuU11pz2UZUuVwFpZlVrab0/ihftyTi3QA54lxgLxLSsb+
 Rm1Q==
X-Gm-Message-State: AOAM532/kgm1Vepk8yLGL6va+7jKlI8scR2blE3Izzpc5HMLRF26lJ+k
 SxktxFTI4g+/awvTfZcwsgq/nIXfCMB+LK+2A5EA1w==
X-Google-Smtp-Source: ABdhPJyY5laFn5SRHNT37MHyapZ0GwE1ObVpQfvDvSQd6CoIw7eXVr3cYfAO4YpBf2ZSmCLl+Qq0taNnfzOtiSyKJMA=
X-Received: by 2002:aca:654d:: with SMTP id j13mr5653421oiw.125.1622679784640; 
 Wed, 02 Jun 2021 17:23:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 17:23:04 -0700
MIME-Version: 1.0
In-Reply-To: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
References: <1622652185-7157-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 17:23:04 -0700
Message-ID: <CAE-0n522L0hmAK40xj3TGimBjeqQgqO2YWsGOrYv-BPqr33tkA@mail.gmail.com>
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
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Ok, this seems to work and is nice and small

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
