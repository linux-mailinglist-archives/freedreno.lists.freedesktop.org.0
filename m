Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83443F8D73
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 20:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B996E056;
	Thu, 26 Aug 2021 18:00:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1016E056
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 18:00:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso4583586ott.13
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RcIYF9R/pHJGqLoLVM8C2PNIjlEdG+08V6XIw2z0GXA=;
 b=bEcMfQI7Jf4WT5ynaI3vWPhlVDv8Cva8+DmGatup6oPvlw20KIo97L2C2ScgUKHhVC
 hdUPgZ6+b4k87ono5IHVsrFOPhC67bHf4R3Tt00XuS3+xegaCJtLSJtW8sUdyUqUBR7b
 Ep9YqQSIAcuV+fwTcLMpIY5lLK3AD/zdnpTu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RcIYF9R/pHJGqLoLVM8C2PNIjlEdG+08V6XIw2z0GXA=;
 b=aqT7gA50o7u6Zb54arjp1lQkM29ZO4lQ+hcnPXZ0woTUqYFjepG8CAtbb/dVK2xN/f
 Qt9Jdvc0FIFzf2A3kaLO5WyUsocgMn/0NCW6KYVftly/JV/YpKSRjN/DEcyK1//9o5C5
 b5p5YktTIShTsxYMt+gi0Qi+Ofm40kIvjdmom8ukTLOwbqWY2UBScITBWIVFkmYx8UQh
 lVTCQ5w9MYWCymZsN4Aj1BQ6et9lkqT0Cw4+o+j+sumUsaLIjTY1+eLTu5tgAStiYGM0
 ba246QvEYO5/HYrPkdv2N9JNzGozoHW3YE0CA0kHgfSyFFetFrmWq0REMc13lY9j0cqS
 zIKg==
X-Gm-Message-State: AOAM5321bERVTkfB9bLRyiLxCNT+nehosj2Pw0yGdLTHw9AvccnDXIDW
 PwRNJ0ydXldWHpd0na+yKnlPiBjo2iyd+PZ1QJgakQ==
X-Google-Smtp-Source: ABdhPJyu2G2XRMt2TFHuTq1cHhTZmiAqHMH+7NXBJGNrokExA+VfOjpgGhUKc4kR5HSTLWP8EzKT6YUkZBeBKGhkVvw=
X-Received: by 2002:a05:6830:2b24:: with SMTP id
 l36mr4312663otv.25.1630000799901; 
 Thu, 26 Aug 2021 10:59:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 17:59:59 +0000
MIME-Version: 1.0
In-Reply-To: <YSfH7j+24OMa3rVE@ripper>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n50JXw6KL-u70csWS-9F6YhZy0pNah91h4e9a_9MnjJzmA@mail.gmail.com>
 <YSfH7j+24OMa3rVE@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 17:59:59 +0000
Message-ID: <CAE-0n50xdTugw_gw97b2VLXjAFp-E064_NfLJ9tzkfaUvq3UvA@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP
 controllers
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-08-26 09:57:18)
> On Thu 26 Aug 00:13 PDT 2021, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-08-25 16:42:31)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> [..]
> > > @@ -203,8 +204,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> > >         dpu_debugfs_vbif_init(dpu_kms, entry);
> > >         dpu_debugfs_core_irq_init(dpu_kms, entry);
> > >
> > > -       if (priv->dp)
> > > -               msm_dp_debugfs_init(priv->dp, minor);
> > > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> > > +               msm_dp_debugfs_init(priv->dp[i], minor);
> >
> > Does this need the same if (!priv->dp) continue check like the other
> > loops over priv->dp?
> >
> [..]
> > > @@ -800,7 +809,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
> > >         if (!priv)
> > >                 return -EINVAL;
> > >
> > > -       msm_dp_irq_postinstall(priv->dp);
> > > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> > > +               msm_dp_irq_postinstall(priv->dp[i]);
> >
> > This one too? Or maybe those gained NULL pointer checks.
> >
>
> This already has a NULL check, that's why I added one to the adjacent
> msm_dp_debugfs_init() as well.

Ok.

>
> > >
> > >         return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> [..]
> > > @@ -1194,6 +1230,10 @@ static int dp_display_probe(struct platform_device *pdev)
> > >         if (!dp)
> > >                 return -ENOMEM;
> > >
> > > +       dp->id = dp_display_get_id(pdev);
> >
> > Ah ok, it's signed for this error check. Maybe assign dp->id in the
> > function and return 0 instead of assigning it here?
> > dp_display_assign_id()
> >
>
> I like the fact that the "getter" doesn't have side effects, but making
> dp->id unsigned makes sense. So let's pay the price of a local signed
> variable here.
>

Sure. If that's the only change then feel free to add

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

on the next version.
