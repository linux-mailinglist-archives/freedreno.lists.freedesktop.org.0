Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B492AACAA
	for <lists+freedreno@lfdr.de>; Sun,  8 Nov 2020 18:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BB989565;
	Sun,  8 Nov 2020 17:55:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D9E89565
 for <freedreno@lists.freedesktop.org>; Sun,  8 Nov 2020 17:55:52 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id n142so6072906ybf.7
 for <freedreno@lists.freedesktop.org>; Sun, 08 Nov 2020 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bmWUWppYtFwVGnbqnjHVdjfmtFQq6Ssv8szPUV4ghMI=;
 b=rU7t+xTIfuIcDY5hoRM9w/gETDTs+vfyhqAY2Dd3M/jS2gra/qqOozX8yQfcHFJwdD
 2LxEb7CL4b8rYoPiLxlbS5Klef0HggKBxYOx6wq9Ya+Qpkj94BZ/U3po/RBTRvxeU+XE
 uMyaODFQAEOVU8jYFOUIgz38Fu2QCKHRGHUcoLJyyFLgx1ZHNsHGwV1RYqT5ZfgXOK4h
 iy1FxTyOiotU/nMHvUYKLcC0BZunxINmlrbX36YIF0Lsq+29bGJCPKqV5s2hm/zOxmUA
 mIeRV+nMSEne4/667rkY/F7RKizgBk/9euaYXQz4g2SzjGaY3zj0kmzEEn/UBD8rkdzx
 M0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmWUWppYtFwVGnbqnjHVdjfmtFQq6Ssv8szPUV4ghMI=;
 b=hn9VR2nvqNB65ov9t/GVtcVFu2RBfjo/4I1njNaujonVjiiQtCrrtpKU2a6P93n2JF
 p6P2i1QLxE2EBqcPg0Iuu9LUaR8LNHWRG2pZ4uu+J3D1tr6pcdxRXxReByXecK7wmJ59
 phOC0dZpZOYdNt3w7Z4U9Iws0DtQ+AoAef2AJRUe4xdTmJ+p7bZyd4lpgsBa8JoggD+b
 hTAhYLk7/DLYDSB6a4BROdNRSx2SUGR6WZkHedsgDvPC4/2QQpKs+iZkvvjHRkCqgekz
 1h8mdaoQFSpURj4InKNw82je05R4dc6tPPeOQkSRPr7df57EgKjEOmXneddQ+em/enpw
 Upmg==
X-Gm-Message-State: AOAM530Cl1bufD5JHwMtnWBv2yFDzNXOAKpdilfbqsa/P5AgMAFLNfTk
 WItEfM0OY+eNSUdkUpuzFRReXZc83DEvcUjTiSVrXA==
X-Google-Smtp-Source: ABdhPJyDSh//P8YGCca/h595WPbNkP9vxMSpO45fIp2fFwEVMxoWVkZ+T5UcRE0J2J1xCgzdUPtWfd4b52s0RoOYFzM=
X-Received: by 2002:a25:4c1:: with SMTP id 184mr14830144ybe.318.1604858151648; 
 Sun, 08 Nov 2020 09:55:51 -0800 (PST)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-3-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
In-Reply-To: <CAF6AEGsYmxwmG2OWdX3Q-5tio+kU-AwhiL_0EyLTVb0=gWgwgw@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sun, 8 Nov 2020 23:25:15 +0530
Message-ID: <CAMi1Hd1+0Gz18Lzm43-gyAEF+gAqd1+9EcYCsJcsgKNbE3WZSA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: add support for clk and bw
 scaling for display
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, nganji@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 John Stultz <john.stultz@linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 21:09, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change adds support to scale src clk and bandwidth as
> > per composition requirements.
> >
> > Interconnect registration for bw has been moved to mdp
> > device node from mdss to facilitate the scaling.
> >
> > Changes in v1:
> >  - Address armv7 compilation issues with the patch (Rob)
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@chromium.org>
>

Hi Kalyan, Rob,

This patch broke the display on the PocoF1 phone
(sdm845-xiaomi-beryllium.dts) running AOSP.
I can boot to UI but the display is frozen soon after that and
dmesg is full of following errors:

[drm:dpu_core_perf_crtc_update:397] [dpu error]crtc-65: failed to
update bus bw vote
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7
[drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
7649746kb > 6800000kb
[drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance check -7

Here is the full dmesg https://pastebin.ubuntu.com/p/PcSdNgMnYw/.
Georgi pointed out following patch but it didn't help,
https://lore.kernel.org/dri-devel/20201027102304.945424-1-dmitry.baryshkov@linaro.org/
Am I missing any other followup fix?

Regards,
Amit Pundir
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
