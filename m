Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE72079B5
	for <lists+freedreno@lfdr.de>; Wed, 24 Jun 2020 18:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13236E17F;
	Wed, 24 Jun 2020 16:57:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA4C6E11A
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jun 2020 16:57:55 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d12so1292956ply.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jun 2020 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CmjIW8R8o5r2lBV1s31ea71JUTHcO/wI+cUm5Z7J13I=;
 b=mG6WvpR98paCQbz/iHfb07cJGGOD2+q40Ra14ZRfvRUEETTcl4Ka/lUveyjjpHB6G5
 Ju/6TESVKwG44SgDilOCn+26m3E8OlV7lRBczDoZ7u4nDMlJiEYjHFph6ib2Fy3dvn6Z
 FuV7JfBukoUvAnHscRTBFaTwnfBjk96ZjZ2z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CmjIW8R8o5r2lBV1s31ea71JUTHcO/wI+cUm5Z7J13I=;
 b=lQSy9enaTBh/kYW/Cf3a2Q4zWdSEcXYEwfiGxN3KRoepgwXXujU9UFsuUPVTB066HD
 6Jh9caxy/fndlg+fDB9t61AnQBffPTMAjn7v8EVdBqI/83N5q/YWLJkMWyMVCXRT+H8x
 FP5H713Q/MfjOg9x2QbUpzzDeaeifeQSSiMwtCNYI5WTirXncyIhGEK6pFUq5OrDHw5H
 BSWKzG0Rsx2lC42aozyNowSFCygIPkdOsBEQCyOUb+y01pyZYkwgLA6h3V7H9TUKZGc5
 P2yPCaGy/yhJ1hN4aZOpuW7eoGOfJBEcyG2rc5BgVtU4hwEpHMzkwyGvWe+sJhU+snKr
 8Ung==
X-Gm-Message-State: AOAM530we05bT1LHpotqd9XnUHesxgEQo7Iv58AW3cxnKEQgSog9jZwG
 UFLpModNVuqWCpy6JxRhg28mmQ==
X-Google-Smtp-Source: ABdhPJwcLj6W7e3dXuyoYT2CvePVH4Ccxc3lYrIKl6UXZvF7YtKEJWq8hq+uSRU1E/2jR+KVFLoDQA==
X-Received: by 2002:a17:902:704a:: with SMTP id
 h10mr28656684plt.85.1593017875159; 
 Wed, 24 Jun 2020 09:57:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id mp15sm5731457pjb.45.2020.06.24.09.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 09:57:54 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:57:52 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200624165752.GA39073@google.com>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
 <1591417551-38051-3-git-send-email-smasetty@codeaurora.org>
 <CAF6AEGva1DyFc1P_5+U=P+Sh-ngN9PyN6Hh2ZXBnxB952UQ54w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGva1DyFc1P_5+U=P+Sh-ngN9PyN6Hh2ZXBnxB952UQ54w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 2/6] drm: msm: a6xx: send opp instead of
 a frequency
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
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 18, 2020 at 10:52:09AM -0700, Rob Clark wrote:
> On Fri, Jun 5, 2020 at 9:26 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > This patch changes the plumbing to send the devfreq recommended opp rather
> > than the frequency. Also consolidate and rearrange the code in a6xx to set
> > the GPU frequency and the icc vote in preparation for the upcoming
> > changes for GPU->DDR scaling votes.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 62 +++++++++++++++++++----------------
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
> >  drivers/gpu/drm/msm/msm_gpu.c         |  3 +-
> >  drivers/gpu/drm/msm/msm_gpu.h         |  3 +-
> >  4 files changed, 38 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 748cd37..2d8124b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -100,17 +100,30 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
> >                 A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
> >  }
> >
> > -static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
> > +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >  {
> > -       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> > -       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> > -       struct msm_gpu *gpu = &adreno_gpu->base;
> > -       int ret;
> > +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > +       u32 perf_index;
> > +       unsigned long gpu_freq;
> > +       int ret = 0;
> > +
> > +       gpu_freq = dev_pm_opp_get_freq(opp);
> > +
> > +       if (gpu_freq == gmu->freq)
> > +               return;
> > +
> > +       for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
> > +               if (gpu_freq == gmu->gpu_freqs[perf_index])
> > +                       break;
> > +
> > +       gmu->current_perf_index = perf_index;
> >
> >         gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
> >
> >         gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> > -               ((3 & 0xf) << 28) | index);
> > +                       ((3 & 0xf) << 28) | perf_index);
> >
> >         /*
> >          * Send an invalid index as a vote for the bus bandwidth and let the
> > @@ -126,7 +139,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
> >         if (ret)
> >                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
> >
> > -       gmu->freq = gmu->gpu_freqs[index];
> > +       gmu->freq = gmu->gpu_freqs[perf_index];
> >
> >         /*
> >          * Eventually we will want to scale the path vote with the frequency but
> > @@ -135,25 +148,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
> >         icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> >  }
> >
> > -void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
> > -{
> > -       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > -       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > -       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > -       u32 perf_index = 0;
> > -
> > -       if (freq == gmu->freq)
> > -               return;
> > -
> > -       for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
> > -               if (freq == gmu->gpu_freqs[perf_index])
> > -                       break;
> > -
> > -       gmu->current_perf_index = perf_index;
> > -
> > -       __a6xx_gmu_set_freq(gmu, perf_index);
> > -}
> 
> this does end up conflicting a bit with some of the newer stuff that
> landed this cycle, in particular "drm/msm/a6xx: HFI v2 for A640 and
> A650"
> 
> Adding Jonathan on CC since I think he will want to test this on
> a650/a640 as well..

Sharat, please send an updated version that is rebased on the latest drm-msm.

Thanks

Matthias
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
