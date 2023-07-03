Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059007465C3
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 00:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B884010E242;
	Mon,  3 Jul 2023 22:36:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB310E242
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 22:36:27 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-57764a6bf8cso40030737b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688423786; x=1691015786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v5YY7eZa6tSEZAqEH7ddXutblBR9DptLHLqPJJAXbjE=;
 b=oc6w2y8/EiiV/kOGEc3tk+2IlksT6VXTryqCwTSPFNt7M10KKNPDkb155MfdIkQSlp
 z/Na5ztWb9Q380/WtUWBjvh9cM3pwAAh9xYoPSXaecaL7ep1KNMYfMFP7GRDzE9s99wl
 QCQ6l34Po6IMCdTUsczn8MVVXv61+c9u6OKEdUZjwqcSbOAmqWlC/VxLTcbZKQyOPCeP
 guGq4816f47tnvaks38UEYwIerbsdhwTn9Qt33OJx2ih+KbAxqXHvbEXB+muzBxtE2BS
 sQjL133Vly6g/R7tQleWSo/SfOi1tuDBQz6TQpxPuVGLJ+sk6yM+ec3nHj+3eBm1RTl2
 NV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688423786; x=1691015786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5YY7eZa6tSEZAqEH7ddXutblBR9DptLHLqPJJAXbjE=;
 b=eXsmdUZWtyyp/2Ocv/IuHFzOYyal+K0oDbCdkmY4JTNfxeg8kBV4D9hw1YkeLfggtO
 qIdsQoVL0u391VIx4n3PWLRyEridObrTeoYNdOE+E/BrLRWOi/MCo5pcdgjB129qkkK2
 Ges8eJYMmupZskfvWVC+v4nGzR4Cc3PpyAK9TsdVdvhrlEgHxOySgwRZHJbAMHvdmkX8
 S5dNSTyFMwkwcz9DHoGdK+75Ins5D67js5KnD8NzNhz+DyFsBYMJPXi0KE8ul+++uO5i
 19mRlWXCKNbD6bcBnDXBBaDqYjNGSyMAeoWJ+9AVSVDqqTNSY0ncEzPpq6QKYGwb4bZ2
 Ztzg==
X-Gm-Message-State: ABy/qLbVKdyb5Tuv0iy6UcFLUq75YhK5qiCfYXPqcU0NkhiYPzF+lC0u
 M26JZMyAzF4CrSRcavHKDyFRSILybfQxaqGTwaCMhQ==
X-Google-Smtp-Source: APBJJlGFi/oMweVuBuQGrbV02UEeAGc1r8Xi7vBeXGaplB8KvhFeJQrjDmAmDxehJCeGQ0b/qwddlTTzejOAdQ7sYYg=
X-Received: by 2002:a81:8390:0:b0:579:e2f5:1253 with SMTP id
 t138-20020a818390000000b00579e2f51253mr7350619ywf.39.1688423786046; Mon, 03
 Jul 2023 15:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
 <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
 <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
 <83a50eb3-3e0d-6b65-2e15-a675c717912d@quicinc.com>
In-Reply-To: <83a50eb3-3e0d-6b65-2e15-a675c717912d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:36:15 +0300
Message-ID: <CAA8EJppekbuLraWGH7M7t0Qqz-hp+6teeB6NkK2DGoTMvJbNqw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/8] drm/msm/dpu: drop performance tuning
 modes
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/3/2023 3:20 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Jul 2023 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> >>> DPU performance module contains code to change performance state
> >>> calculations. In addition to normal (sum plane and CRTC requirements),
> >>> it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
> >>> since they can easily end up with the display underruns. Userspace also
> >>> should not depend on these modes availability, since they are tuned
> >>> through debugfs, which might not be available.
> >>>
> >>> Drop relevant code to simplify performance state calculations.
> >>>
> >>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Sorry but NAK on this change for two reasons:
> >>
> >> This mode is not for usermode to depend on but for debugging. I have
> >> personally used both the perf max and perf min modes for debug.
> >>
> >> 1) The purpose is that, if you do see an underrun, you can force the
> >> perf mode as it will select max clk and bw rate
> >>
> >> So something like below:
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 >
> >> fix_core_clk_rate
> >>
> >> This will allow us to force the clk to a particular value to see at what
> >> point it starts underruning
> >>
> >> Also you can even do
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode
> >>
> >> This will automatically max out the clk and BW
> >>
> >> With this, you can figure out if underrun is a performance related
> >> underrun or a misconfiguration. We used it even recently to debug the
> >> performance issue with pclk reduction
> >
> > Hmm, 1 is minimum, not maxumum.
> >
>
> The name is kind of confusing.
>
> Yes 1 is min perf mode but it maxes out the clocks and BW.
>
> I guess its named that way because a min perf mode gives you the minimum
> savings in terms of power.
>
> >>
> >> 2) Sometimes, you even want to force an underrun to debug devcoredump OR
> >> the recovery code. Forcing the min clk mode by doing
> >>
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 >
> >> fix_core_clk_rate
> >> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> >>
> >> Is the easiest way to trigger the recovery handler.
> >>
> >> Hence I am not at all convinced of dropping this.
> >
> > I see, thanks for sharing the usecases. However I still think that it
> > is overcomplicated for the debugging feature. What about dropping all
> > perf modes and providing just 'override_core_clk_rate' and
> > 'override_avg_bw', 'override_peak_bw'?
> >
>
> No, we need both. Let me explain why:
>
> 1) Having just the min perf mode, directly uses the max clk and bw. This
> is useful when you just want to run at the max and see the behavior
>
> 2) If you want to figure out what is the sweet spot where the issue does
> not happen you need the "fixed" mode to find the range where the issue
> doesnt happen
>
> This is one of the oldest and most effective debugging mechanisms.
>
> I dont want to touch this and I personally use this quite often.

Ack, I'll see if I can keep the interface / idea. I still think that
override + in-kernel limits should do the same trick as the current
'maximum' does.



-- 
With best wishes
Dmitry
