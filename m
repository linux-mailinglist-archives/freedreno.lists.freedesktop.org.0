Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BC1D7E5B
	for <lists+freedreno@lfdr.de>; Mon, 18 May 2020 18:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5383A6E431;
	Mon, 18 May 2020 16:25:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A84D6E431
 for <freedreno@lists.freedesktop.org>; Mon, 18 May 2020 16:25:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i16so4520052edv.1
 for <freedreno@lists.freedesktop.org>; Mon, 18 May 2020 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=C9o4dW1opf6PK9dDJU+olx6LivIhnF/LUajcX/auTKM=;
 b=mk9a0EE30LQPszKX5ot6/btd4Lvv+bgSkXNddm9G/X4xPGhTcYfGn9iToM4kQPb/aU
 bCDe3NfgCGMurJGVDAnSpPBLaTOXEd/bT2NFKE/v4MuX2/c2VqGk+EFAfp7T2o2JYqMA
 zsJwIKhZtvZ7nq9HWgQl35cR3+Ew4PlBMq6VU8M0Ii/nrjhC4DWDeqVzm5wmoA02AZHy
 aHi0JKC+zVh29NEUQL+FyqnIzfROsHeli2W1Lc2Lop/O2qTCY5exQhzQXiRDVaqnRNKF
 nC62vqaYbx5FkbjCkN6dXtoAEhJxwRuhHYF2cCsn1WJ6lfpVyExb4l1U+fIwjAg1W4AN
 GfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=C9o4dW1opf6PK9dDJU+olx6LivIhnF/LUajcX/auTKM=;
 b=PldHsx6U0zdhweXaqINLdgWetG/Hmiya/L1dh6s5Oul1CtMRN+3vw5lVNYcoSohJAb
 tHU7BUezmdyEMNq8zJs4KWihruRJClkqj766o1yi1DpANZUE2tJegIo9uLpFF+EpTN0p
 JtwAHUNki6gFMQPYBqTSX1DeW6fTjtMkwsNkSNDt/aq4Sq47RlNAi/kCFGzuGGK7WgA3
 k4gdOgpztY3scg+Ot2KdK4LKW4YwPTRA1ss5vpk/LNbIaAiADhQxGt2nW1euCppk2Gvc
 WiNi/el3b+bs1Nu0LyixzeeFMQuOSzvOb6Mida4cPGXVci0pucqs74wY6eEK7eBS3JEg
 I0Sg==
X-Gm-Message-State: AOAM533kJ7DBOOIJLmkeK4zFeB9XgTrDFU6MGpDEVXQ9DISQmh/oF54T
 arPWflnXFmVHF4nWEFDzUiSpug1iXlOatyrMIBk=
X-Google-Smtp-Source: ABdhPJwYjoPZytoziRsU8pzisjXxK0MKS7CxJZXMVVTHEUikl7yW7jJlqgckmGbHBkbra1XtkUxs8t43eY3HhJcYOUQ=
X-Received: by 2002:a05:6402:1a29:: with SMTP id
 be9mr7821163edb.70.1589819121915; 
 Mon, 18 May 2020 09:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 18 May 2020 09:25:41 -0700
Message-ID: <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw
 to set DDR bandwidth
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> > This patches replaces the previously used static DDR vote and uses
> > dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> > GPU frequency.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 2d8124b..79433d3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >
> >       gmu->freq = gmu->gpu_freqs[perf_index];
> >
> > -     /*
> > -      * Eventually we will want to scale the path vote with the frequency but
> > -      * for now leave it at max so that the performance is nominal.
> > -      */
> > -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> > +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> >  }
>
> This adds an implicit requirement that all targets need bandwidth settings
> defined in the OPP or they won't get a bus vote at all. I would prefer that
> there be an default escape valve but if not you'll need to add
> bandwidth values for the sdm845 OPP that target doesn't regress.
>

it looks like we could maybe do something like:

  ret = dev_pm_opp_set_bw(...);
  if (ret) {
      dev_warn_once(dev, "no bandwidth settings");
      icc_set_bw(...);
  }

?

BR,
-R

> Jordan
>
> >  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> > --
> > 2.7.4
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
