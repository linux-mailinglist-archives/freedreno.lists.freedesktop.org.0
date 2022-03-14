Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FE4D84A9
	for <lists+freedreno@lfdr.de>; Mon, 14 Mar 2022 13:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0EF10E7C9;
	Mon, 14 Mar 2022 12:32:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A49A10E775
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 12:32:06 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2e2ca8d7812so99400917b3.13
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWYiVcad4lyN3MTMCVaEe/kHD8SmjlJLnSNDNu5hEV8=;
 b=dx89DPmQPGELKQ9URRMTc+sGTgkEbGOiXMkgouXNqdU6gaEGEWf9ADvH/onhhTn9A0
 i07Y+WDeSjXLEPXUwnNBLIzyoHrmbu+PIZZ56LGMx0d0FQ9XDJHHqdg5B425iKHO0uhY
 GeVnLJBk8jVDLd84298P3HM89dWltpY/eLhQZkpS27sg45OBX42hMGTtXK8ehdreVn/P
 jnIg+ChqnI+V8gxqyI8KZRxkMBzg/c6/lt79dm2zyzpe8FjryvOPjxeQhM723GIDLkDr
 rhNtFsEBSDzig95iZNJVTyfMhKMlVfXY81af0BTKizXB5c2HxE0fmzOMBfUq1Hw/6N38
 KXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWYiVcad4lyN3MTMCVaEe/kHD8SmjlJLnSNDNu5hEV8=;
 b=JcIs8bM2YJCKRmvueOjIe6AjBPU2CeOq19/VzuQLHxtY0+5qO+/hcsw+PRLXi33tc1
 TAcuP9tMhrsRM9A2C+wfPizbcYJFt+fLG/tUH1YLB9Bd+u6hW6lcwPvmKdgx+DGxwXjc
 TNTmSS5f4x1Lxu5b+KRgHfdOFBZFGTx6W4rYM9BrlfhDnbCtK7a3/VAJsvlqwXf3xS7U
 y3VkmmDuiVOUzvPZP4egYiBr9yIOJbOWGMD4RBh5KjeK/BdipnVb5GnH+DILTCwlvVA9
 5y1ofrabN7hbOA1OFk4Ii+3ebD5Rpy+KO3YLlaGJzmu9FNsX2zNpt+bNWipZsixJQ4j4
 HXZA==
X-Gm-Message-State: AOAM531KbvCX1TKQLd5SpU5MIWaXPXYHmcGwjRsWRvUPUTfyfOWDNuxF
 lHCAp7vU7qxPqCOiaykecISkQC4Z6Vo2/EU8v718VA==
X-Google-Smtp-Source: ABdhPJw9ptK7cXWIyB+pXX4gxaG81OIr8G6j/SFNJ1dr+spjkllZx+dgElnNqGpEHU1scqv+d/HKw9nNDEh76Lq5I60=
X-Received: by 2002:a0d:d187:0:b0:2dc:5d83:217d with SMTP id
 t129-20020a0dd187000000b002dc5d83217dmr18485669ywd.189.1647261125395; Mon, 14
 Mar 2022 05:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220219183310.557435-1-robdclark@gmail.com>
 <CA+G9fYv6dPUsPzbFLr9PxJoe4eRAUdQyD4xT4hh4-xw=n9r=Bw@mail.gmail.com>
In-Reply-To: <CA+G9fYv6dPUsPzbFLr9PxJoe4eRAUdQyD4xT4hh4-xw=n9r=Bw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Mar 2022 18:01:53 +0530
Message-ID: <CA+G9fYsipiN2-+g9CGmvf1WVQe22ehnkRuwa45D4rsTa6+Wk=w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Fix crash on devices without
 devfreq support
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
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob and Linus,

On Mon, 7 Mar 2022 at 14:07, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Hi Rob,
>
> On Sun, 20 Feb 2022 at 00:02, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid going down devfreq paths on devices where devfreq is not
> > initialized.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> I have tested this patch and the reported kernel crash is fixed [1].
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++------
> >  1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index 9bf319be11f6..26a3669a97b3 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -83,12 +83,17 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
> >  static void msm_devfreq_boost_work(struct kthread_work *work);
> >  static void msm_devfreq_idle_work(struct kthread_work *work);
> >
> > +static bool has_devfreq(struct msm_gpu *gpu)
> > +{
> > +       return !!gpu->funcs->gpu_busy;
> > +}
> > +
> >  void msm_devfreq_init(struct msm_gpu *gpu)
> >  {
> >         struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> >         /* We need target support to do devfreq */
> > -       if (!gpu->funcs->gpu_busy)
> > +       if (!has_devfreq(gpu))
> >                 return;
> >
> >         dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
> > @@ -149,6 +154,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
> >  {
> >         struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > +       if (!has_devfreq(gpu))
> > +               return;
> > +
> >         devfreq_cooling_unregister(gpu->cooling);
> >         dev_pm_qos_remove_request(&df->boost_freq);
> >         dev_pm_qos_remove_request(&df->idle_freq);
> > @@ -156,16 +164,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
> >
> >  void msm_devfreq_resume(struct msm_gpu *gpu)
> >  {
> > -       gpu->devfreq.busy_cycles = 0;
> > -       gpu->devfreq.time = ktime_get();
> > +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > -       devfreq_resume_device(gpu->devfreq.devfreq);
> > +       if (!has_devfreq(gpu))
> > +               return;
> > +
> > +       df->busy_cycles = 0;
> > +       df->time = ktime_get();
> > +
> > +       devfreq_resume_device(df->devfreq);
> >  }
> >
> >  void msm_devfreq_suspend(struct msm_gpu *gpu)
> >  {
> >         struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > +       if (!has_devfreq(gpu))
> > +               return;
> > +
> >         devfreq_suspend_device(df->devfreq);
> >
> >         cancel_idle_work(df);
> > @@ -185,6 +201,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> >         struct msm_gpu_devfreq *df = &gpu->devfreq;
> >         uint64_t freq;
> >
> > +       if (!has_devfreq(gpu))
> > +               return;
> > +
> >         freq = get_freq(gpu);
> >         freq *= factor;
> >
> > @@ -207,7 +226,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >         struct devfreq_dev_status status;
> >         unsigned int idle_time;
> >
> > -       if (!df->devfreq)
> > +       if (!has_devfreq(gpu))
> >                 return;
> >
> >         /*
> > @@ -253,7 +272,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >  {
> >         struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > -       if (!df->devfreq)
> > +       if (!has_devfreq(gpu))
> >                 return;
> >
> >         msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),

FYI,
This patch is missing on Linux 5.17-rc8 [1].
kernel crash log on arm64 db410c device [2] and details [3].

metadata:
  git_describe: v5.17-rc8
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
  kernel-config: https://builds.tuxbuild.com/26LbbVLHqxjh5w5ZtjBMjGmh92P/config
  build: https://builds.tuxbuild.com/26LbbVLHqxjh5w5ZtjBMjGmh92P

- Naresh
[1] https://lore.kernel.org/dri-devel/20220219183310.557435-1-robdclark@gmail.com/
[2]  https://lkft.validation.linaro.org/scheduler/job/4714905#L2795
[3] https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v5.17-rc8/testrun/8446224/suite/linux-log-parser/test/check-kernel-oops-4714905/details/

>
> --
> Linaro LKFT
> https://lkft.linaro.org
>
> [1] https://lkft.validation.linaro.org/scheduler/job/4664600#L1894
