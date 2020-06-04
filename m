Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514661EEC14
	for <lists+freedreno@lfdr.de>; Thu,  4 Jun 2020 22:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E812D6E5BB;
	Thu,  4 Jun 2020 20:34:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CDE6E5B2
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 20:34:20 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id r1so2527680uam.6
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jun 2020 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
 b=ctMItykuizT2FjCtlj3c7yeA8hejo1Eu0YvNGbgfHWNvUAZmSu1iqvjTuxpl6Rm/XM
 /bOQT4clHDMwkaa7CQpWJ+/aULE1pYzv7SNXe1g+1d4Jvdus2Zf/u2kDn//UPtypAuEw
 ce+XSToUwc8hZkd4Z5GjQqIAIMzFGI0iD70BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
 b=VBAWXlJIpxappfEYbkZQJBPonHDdyHvD4Gov+dVz37CHZnMA0y40rBXsuZqTrFbrnV
 35u8JETfpDSXSWVIcRd89wT97GcRjeFKvfjO8xJIghy97qWl8IK7tOPEwRqMR7LGYjbD
 06SSQgkHtBNoo9j5qOExFmfi0Sf1n3mfpUCsjgGIcqZb0efSdbKxlzHFC9wJw5lB+elF
 xH0pVCkuF1JYoigv3UMNwG4x0QyHUeZenL/p4/fjhQ+rCAUI6BKYE/Ktxy4Z1OVgNntE
 1x3fxhanRGlK1UjGCdXjRtZjKWRJ6HZn+gRquVZVv4tWFJNLscneRLYJBeTOrCgLLXep
 an0A==
X-Gm-Message-State: AOAM531eRpewduHGo0B2wzI49nD/ZqNMWW2/fyerCZVHfJj6Lms6ov1u
 /i4aNeBMXrkuaF7Tm8OaGI21LH7onYI=
X-Google-Smtp-Source: ABdhPJyg41HOGAnqECPrEguZax7rronS8LV/IAFJeS8buRal4IWHVhn8Wj5DguR9UJTbg2qTwivx5A==
X-Received: by 2002:ab0:1684:: with SMTP id e4mr4919301uaf.22.1591302859038;
 Thu, 04 Jun 2020 13:34:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id b9sm904680vkn.21.2020.06.04.13.34.17
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:34:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id c1so4310369vsc.11
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5087675vsd.198.1591302857244; 
 Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2020 13:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v6] drm/msm/dpu: ensure device suspend
 happens during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 4, 2020 at 6:20 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> -#ifdef CONFIG_PM
> -static int msm_runtime_suspend(struct device *dev)
> +#ifdef CONFIG_PM_SLEEP
> +static int msm_pm_suspend(struct device *dev)
>  {
> -       struct drm_device *ddev = dev_get_drvdata(dev);
> -       struct msm_drm_private *priv = ddev->dev_private;
> -       struct msm_mdss *mdss = priv->mdss;
>

nit: remove blank line at the start of this function

>  static const struct dev_pm_ops msm_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,

Presumably you will get a compile failure if someone compiles without
CONFIG_PM_SLEEP since msm_pm_prepare() and msm_pm_complete() won't be
defined but you refer to them unconditionally.  Probably the best
solution is to just add "__maybe_unused" to your prepare/complete
function and then always define them.


I can't say I've thought through every corner case but at least this
change no longer raises alarm bells in my mind when I look at it.  ;-)
 If it works for you and nobody else has objections then it seems good
enough and we can always make more improvements later.  Feel free to
add my Reviewed-by tag when my nit is fixed and you make sure it
compiles even if CONFIG_PM_SLEEP isn't defined.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
