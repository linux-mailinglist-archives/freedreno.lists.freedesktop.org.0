Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F173545252
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 18:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822FD113C80;
	Thu,  9 Jun 2022 16:50:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265BC113C80
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 16:50:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fu3so47144805ejc.7
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E2+fNvmvqWQKCDAUtcMyd7aXG5n324Z+HdNSzbIXbwY=;
 b=cNg6um7nb4nsy8UZupEsWZNHMESEj7pcV8kfXlsQGluYfUfW6CxrwB0vWECsZVGvDC
 YdqdDxzW4KhSSo0ErUP2b7x7wvuB5yML2DZZ5WGYkbTZS+hMOmzLGMdfYMpoPOiIoj5+
 Nww5cc17i1TZn60VrQC0+FBhYlVvi3+MMiWVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E2+fNvmvqWQKCDAUtcMyd7aXG5n324Z+HdNSzbIXbwY=;
 b=6C7gpv3+0FK0gt591+vV/VYOsu5bLpTddwg2YvYILVhBhsqJIaSF2Npaz9pcXT++17
 t9FFDBwsDYS7TLa/D8y0/wruTJOIIcFtg+k2W/ggCExVaXzQC+ydcJpiyPjn6EgUuwWe
 nuZLwfKX0beHU2w7ta24Cj34S57S8Bl8kqg7Bn/UJGJdL6wnWIxtgsvTCbEYuARb7piq
 BYBiVC6ih2KjLFSTdMR1t4OM7E4yVkAC0/Jdvfv1dYDgzsLdM1h2xbdowZy9WOBSBKAj
 cISkzqxpXgNMf4OR29FDNxYPFLV8jkgvmfSngG3MOVcwIyKMug8C4aVTDwOM9HnaoqWP
 O4uw==
X-Gm-Message-State: AOAM5317w5mfh2lpNGV95IJzfj/L4ICjHtVRdyC0Q34uKyP+T+BvGBVU
 mja7zly5/qUqyoaRnB1obfmYb+UJ3y6lYxa1
X-Google-Smtp-Source: ABdhPJxN/1ezfgY8z2dteZcYuydQlH5LFBrx88q80DxUKK7BzLPadhK5r+quQutEKaRfvPLVjZ4EDA==
X-Received: by 2002:a17:906:b31a:b0:709:115:453d with SMTP id
 n26-20020a170906b31a00b007090115453dmr37193502ejz.227.1654793453445; 
 Thu, 09 Jun 2022 09:50:53 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b006feec47dadfsm11082788ejc.156.2022.06.09.09.50.50
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 09:50:51 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id x17so33216323wrg.6
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 09:50:50 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr23536562wrt.422.1654793450068; Thu, 09
 Jun 2022 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161334.2140611-1-robdclark@gmail.com>
In-Reply-To: <20220608161334.2140611-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jun 2022 09:50:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJotkL=BN-qvyEjVpa8Fsbt_15D-8wV3RUe8j5dA41gQ@mail.gmail.com>
Message-ID: <CAD=FV=WJotkL=BN-qvyEjVpa8Fsbt_15D-8wV3RUe8j5dA41gQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Switch ordering of runpm put vs
 devfreq_idle
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 8, 2022 at 9:13 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> I've seen a few crashes like:
>
>     CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W         5.4.196 #7
>     Hardware name: Google Wormdingler rev1+ INX panel board (DT)
>     pstate: 20c00009 (nzCv daif +PAN +UAO)
>     pc : msm_readl+0x14/0x34
>     lr : a6xx_gpu_busy+0x40/0x80
>     sp : ffffffc011b93ad0
>     x29: ffffffc011b93ad0 x28: ffffffe77cba3000
>     x27: 0000000000000001 x26: ffffffe77bb4c4ac
>     x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
>     x23: 0000000000000000 x22: ffffffa2f22bf020
>     x21: ffffffa2f22bf000 x20: ffffffc011b93b10
>     x19: ffffffc011bd4110 x18: 000000000000000e
>     x17: 0000000000000004 x16: 000000000000000c
>     x15: 000001be3a969450 x14: 0000000000000400
>     x13: 00000000000101d6 x12: 0000000034155555
>     x11: 0000000000000001 x10: 0000000000000000
>     x9 : 0000000100000000 x8 : ffffffc011bd4000
>     x7 : 0000000000000000 x6 : 0000000000000007
>     x5 : ffffffc01d8b38f0 x4 : 0000000000000000
>     x3 : 00000000ffffffff x2 : 0000000000000002
>     x1 : 0000000000000000 x0 : ffffffc011bd4110
>     Call trace:
>      msm_readl+0x14/0x34
>      a6xx_gpu_busy+0x40/0x80
>      msm_devfreq_get_dev_status+0x70/0x1d0
>      devfreq_simple_ondemand_func+0x34/0x100
>      update_devfreq+0x50/0xe8
>      qos_notifier_call+0x2c/0x64
>      qos_max_notifier_call+0x1c/0x2c
>      notifier_call_chain+0x58/0x98
>      __blocking_notifier_call_chain+0x74/0x84
>      blocking_notifier_call_chain+0x38/0x48
>      pm_qos_update_target+0xf8/0x19c
>      freq_qos_apply+0x54/0x6c
>      apply_constraint+0x60/0x104
>      __dev_pm_qos_update_request+0xb4/0x184
>      dev_pm_qos_update_request+0x38/0x58
>      msm_devfreq_idle_work+0x34/0x40
>      kthread_worker_fn+0x144/0x1c8
>      kthread+0x140/0x284
>      ret_from_fork+0x10/0x18
>     Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
>     ---[ end trace f6309767a42d0831 ]---
>
> Which smells a lot like touching hw after power collapse.  This seems
> a bit like a race/timing issue elsewhere, as pm_runtime_get_if_in_use()
> in a6xx_gpu_busy() should have kept us from touching hw if it wasn't
> powered.

I dunno if we want to change the commit message since I think my patch
[1] addresses the above problem?

[1] https://lore.kernel.org/r/20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid


> But, we've seen cases where the idle_work scheduled by
> msm_devfreq_idle() ends up racing with the resume path.  Which, again,
> shouldn't be a problem other than unnecessary freq changes.
>
> v2. Only move the runpm _put_autosuspend, and not the _mark_last_busy()
>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20210927152928.831245-1-robdclark@gmail.com
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

In any case, your patch fixes the potential WARN_ON and seems like the
right thing to do, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
