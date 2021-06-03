Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88639ABB6
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 22:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749BF6E584;
	Thu,  3 Jun 2021 20:22:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9806E584
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 20:22:48 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso1702179oow.10
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cMLM4cflpxEbsfu/ce/EkzAINJ+710gVrefVr0HI+qY=;
 b=L0SkuWBv+83YGqTd6ik3MB9wor9LeocWUua6DOQob5uCIeKncJusY/+64rblVTnKgZ
 tTRCUuoUgWaAQg7TsuVlaO5NxTdPq6WOncJXARM0/uRiV35POzwPmEbSKaXyAuzCtWDc
 ONq7D/gq3ivz6aXRSTHk3Dn7oHzaEooVJ3WyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cMLM4cflpxEbsfu/ce/EkzAINJ+710gVrefVr0HI+qY=;
 b=am1gRo+iDGHskQ8UBqDAnYEBH27C80gDce6gDkaaP9gZ16rvJrhbqjgUmiBy/UmkRE
 kY94BBqlL8kvV3vChf6iG/vYGXjn3mRXDBvnKGbynXMNGFt0IPWH6L7kOV7FQn7zorcn
 j5/oGKoRwz3Sm5XzWXXqE1ElKzbmiRBM48Dr4gTbE37g9uTsRg6Nd2pdsJhcijYTtqQ9
 lKKlp05haI7KElzPzpT82tB4ZxEbfkcdbO/9o+DgnGry8E3eInXfIVr+ZuHi9pBT1+j4
 yH6MG6op3WFApTw24I0D/rtaPwe8Y4qVkdiYEnnE5xpLfSPz0gLeGHWTHTXBL7Bi5EIl
 cdoQ==
X-Gm-Message-State: AOAM531R2el9b4BKaW4Yox64ING4oHSee1tTnFiLGLi/kchfuzCto74X
 LE2i9rmbpiSIgvzJQgrar6wSyzuatomqPyo2f6vy+A==
X-Google-Smtp-Source: ABdhPJwJRX5XWGLQvcvpQ5gyjX7E4oP0MOspFx028qV6yYflYoKemYC4DYS5FSHp16wnBONkFO2dTwSCsw/L7BS4wVU=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr857805ooh.80.1622751767413;
 Thu, 03 Jun 2021 13:22:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 20:22:47 +0000
MIME-Version: 1.0
In-Reply-To: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
References: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 3 Jun 2021 20:22:47 +0000
Message-ID: <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: power off DP phy at suspend
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

Can you Cc dri-devel?

Quoting Kuogee Hsieh (2021-06-03 08:40:46)
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
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
