Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99F1AE704
	for <lists+freedreno@lfdr.de>; Fri, 17 Apr 2020 22:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6E6EB08;
	Fri, 17 Apr 2020 20:56:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0C96EB08
 for <freedreno@lists.freedesktop.org>; Fri, 17 Apr 2020 20:56:49 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id t8so1167355uap.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Apr 2020 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
 b=NTiOrafaduGKDmVfB6vAvc2mWdTspMay2fHcWX+kFb/9rqtwB1ixoAxjzkdoDWotNU
 cJPXhjrUZPXQpMjnVmPFTyNGXTFPAxaFIEJ+J06zvtyOEqhWnIlMm7m494gCUii9ggCA
 1t8AcHugDOTujupYSZCzSQt7zsOSByyoz29Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
 b=EQHQnPU4yCld9sL1WvD7T9WLy+gKxVWqgNkHOkOJfkSwEJxe8R4RkW1/miQE5S+CV6
 s3Kd8ZiZIJTqV7K3HqqnEoVIcTLzZM4kPB+bl7eq3g7s9qynvloa7dNyvVKNusCUFqqw
 u4k8V13owSg8xqfN7cNwateoLRFgsnuJWxt96+FJCa0x7clDve+3QS6/4+wUsjIP6Drc
 kIUf159Ww6um61+tSRuIBYKEfVnYo7F/b67aymkkjtz0IojINW6sbM3KE5nfB15kBPZ3
 JaWA6ci+7ke5SxYMicqPMiuCnlFt19NDDxrI/h1ZbLNLcK8VRYlvQVy3xQhklnj1tJLd
 GeQg==
X-Gm-Message-State: AGi0PuaItJezv9Lj03eTHn51Pf+Sf1Kwyd2CxJhCVWHktMRN6ywrn1Ng
 hyzQblc84a6JZWrBXnb1eemF5+nJusM=
X-Google-Smtp-Source: APiQypJc0spzm8y14aO0PjJFCZiQQZwCVc+QuUxZKu59lWQaOmNAFmHaPdKUoQqawNkLNTt3hkSjMw==
X-Received: by 2002:ab0:117:: with SMTP id 23mr710996uak.67.1587157008188;
 Fri, 17 Apr 2020 13:56:48 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id s3sm567717uao.0.2020.04.17.13.56.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:56:47 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id 1so2041520vsl.9
 for <freedreno@lists.freedesktop.org>; Fri, 17 Apr 2020 13:56:46 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr4201742vse.106.1587157005954; 
 Fri, 17 Apr 2020 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Apr 2020 13:56:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
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

On Fri, Apr 17, 2020 at 12:13 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Changes in v4:
>  - Check the return values of pm_runtime_force_suspend and
>    pm_runtime_force_resume API's and pass appropriately (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++++-
>  3 files changed, 17 insertions(+), 1 deletion(-)

I am most certainly not an expert in this code, but as far as I can
tell it looks sane.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
