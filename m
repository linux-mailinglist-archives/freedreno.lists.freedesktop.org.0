Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045582C2C09
	for <lists+freedreno@lfdr.de>; Tue, 24 Nov 2020 16:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC856E479;
	Tue, 24 Nov 2020 15:56:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5A6E479
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 15:56:16 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id 2so19664108ybc.12
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2P83nucK526s4MeAO3ef03SmJgQO9NwAX+ho/0bpag=;
 b=LEiwANAT5RKxUwb530+GU3ngUHfpY4CcH/7rZbALhW6cVviuWshxGFiHTP+cl0CdRW
 Pls7iBNclidkQ5F04YYBuCVqnF9fohJH7zAu0kaOtMBIJaGPq3uPW6BUzQKgEOQoenUu
 AbN7w68UNr6flX4vz+agTyomqgPJYU0EkrBkNjxOBnJ0oL2AnZ+ZnidxKLBmC1ranT4L
 ooj3sv+Eh3pe8uy+14LYseKtBe+c91Kt1w+ZFoP8xebYef9yzUqJTcLf0qWZWX9gF6qt
 rqKFYKccZtfNV818+JRRz/40qHqcMaDBfoET3sqoC2YeKIomy8e6vrAJ49mBQbNCS16V
 XoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2P83nucK526s4MeAO3ef03SmJgQO9NwAX+ho/0bpag=;
 b=El/lPG3iFlfnxlfM4loTaJC/K4Nn4aC8zhmIBWMp56TiG6pS8bGnOPWkkd1sAkh20H
 vck6csDd3j5midIqDQB6906TQk5AqQndl8Xx4bYyvuezMSpL65BURzau9G7MZtmtOwOk
 EpL7CeErnKgjRwNIRADJmsvLLqlo0MyWCAG0aWbctzg/z7skUEPNKcS2ntITdK2nFs+S
 nUxtxzmaBvvC03wvtGvNHVtUJnU446MPegJ5s8/MRF8Bdu+/Q8+hTT2aNTicJvLgJ+Qu
 m4OIezmSRunCv9jhqEPR0YQkTskebSk1i2VroG9H0H2zdhOjMBVs0nOlGL1YJJGo3jjj
 s8Ew==
X-Gm-Message-State: AOAM533mOkj9EpdllJC0VURKqwF0Pt6AGbH5MTF3uVOfYdMI+iA5Xlpp
 u31yeu0s1k7T0IhQwEIYxBM/SOy+XSCl89oPzA99/g==
X-Google-Smtp-Source: ABdhPJw0wHy+GWOIUwTLlmESRTmLRZ/Jnp1OSuSOAtoxUCEZYv5ocbmTHY84rAlt1NUxwHAItTPdwVgoCeM1V0Ar0sY=
X-Received: by 2002:a25:7481:: with SMTP id p123mr6036490ybc.167.1606233375845; 
 Tue, 24 Nov 2020 07:56:15 -0800 (PST)
MIME-Version: 1.0
References: <5b07a7be8d136392dc7f93933a7ee68e@codeaurora.org>
In-Reply-To: <5b07a7be8d136392dc7f93933a7ee68e@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 24 Nov 2020 21:25:40 +0530
Message-ID: <CAMi1Hd2vY0OaD=_3E_JBTCPkLGHq9CFOrOQ=OM9eVg=dJ6hbZg@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, John Stultz <john.stultz@linaro.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Kalyan,

On Tue, 24 Nov 2020 at 18:27, <kalyan_t@codeaurora.org> wrote:
>
> On 2020-11-08 23:25, Amit Pundir wrote:
> > On Tue, 4 Aug 2020 at 21:09, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org>
> >> wrote:
> >> >
> >> > This change adds support to scale src clk and bandwidth as
> >> > per composition requirements.
> >> >
> >> > Interconnect registration for bw has been moved to mdp
> >> > device node from mdss to facilitate the scaling.
> >> >
> >> > Changes in v1:
> >> >  - Address armv7 compilation issues with the patch (Rob)
> >> >
> >> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >>
> >> Reviewed-by: Rob Clark <robdclark@chromium.org>
> >>
> >
> > Hi Kalyan, Rob,
> >
> > This patch broke the display on the PocoF1 phone
> > (sdm845-xiaomi-beryllium.dts) running AOSP.
> > I can boot to UI but the display is frozen soon after that and
> > dmesg is full of following errors:
> >
> > [drm:dpu_core_perf_crtc_update:397] [dpu error]crtc-65: failed to
> > update bus bw vote
> > [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> > 7649746kb > 6800000kb
> > [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance
> > check -7
> > [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> > 7649746kb > 6800000kb
> > [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance
> > check -7
> > [drm:dpu_core_perf_crtc_check:203] [dpu error]exceeds bandwidth:
> > 7649746kb > 6800000kb
> > [drm:dpu_crtc_atomic_check:969] [dpu error]crtc65 failed performance
> > check -7
> >
> > Here is the full dmesg https://pastebin.ubuntu.com/p/PcSdNgMnYw/.
> > Georgi pointed out following patch but it didn't help,
> > https://lore.kernel.org/dri-devel/20201027102304.945424-1-dmitry.baryshkov@linaro.org/
> > Am I missing any other followup fix?
> >
> > Regards,
> > Amit Pundir
> > __
>
> Hi Amit,
>
> Apologies for the delay.

No worries at all.

>
> I have gone through the logs and referred to the below panel file for
> the timings.
> https://github.com/Matheus-Garbelini/Kernel-Sphinx-Pocophone-F1/blob/master/arch/arm64/boot/dts/qcom/dsi-panel-tianma-fhd-nt36672a-video.dtsi
>
> if the above is correct file, then below could be the possible root
> cause.
>
> The panel back porch and pw is less and it is causing the prefill bw
> requirement to shoot up per layer as currently we are not considering
> front porch in the calculation. can you please try the attached patch in
> the email as a solution and provide me the feedback, i'll post it as a
> formal change.

The attached patch worked for me. Thanks a lot for looking closely
into this issue.

Regards,
Amit Pundir

>
> Thanks,
> Kalyan
>
> _____________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
