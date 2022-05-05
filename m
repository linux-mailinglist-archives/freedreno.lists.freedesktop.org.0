Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AE51BE5F
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 13:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0574B10FC37;
	Thu,  5 May 2022 11:50:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0D710FC36
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 11:50:10 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso45353057b3.5
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=knsgBaKDxBJq/+C6n1oHiCqqmfyfeBuftY53CndmalY=;
 b=SM44piqvB6PrqrAPdDmOVBPGUpMa6VQ7GR8bQzSv1SAhXkySLDsDAdJ1VPRLvQaFBh
 Ol610ebhZ+uieFD0VVnK0iIXig38NNJ7QfhIpSgyIX9m8CFDrfyiOpzJd8n/swZmaveG
 1uBUJtsKAyBZ0+Ib5c2TBLU4prjlN3/Uq40WI5YCc1Qs8jb/M8d/4c5rpiSRbghAFNih
 WDOSHN0LeV4DZnB8kqjWTOPOmsKY+SSfNM4XYiM3q/GyQK8rmIZgXbWtIXFp0TfqqehL
 RHhZ/wT373IXw0lC+GIWCCdcbp0bHi3TajHb2P2R8AzQSD1nX4WofKxKkgAh8j2aLr6L
 iznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=knsgBaKDxBJq/+C6n1oHiCqqmfyfeBuftY53CndmalY=;
 b=rrhaaOSzuIBykP1UwnR496h0wvN4saDrqkCdNu+UJ7qZhFyuG2hrY9YgSP4xICRQKr
 60JhoaaFD3RFpv9HshQWeqsrLFTtQLx3jDOyIGfTJl/TSv+e+jckluowQWnXDuELQBYr
 d+A9e0rGQJOghUe4gJ/9KdoX1yh4n5mgPi5hlRd0One/kMbZesHWqJyUPEjsYkXUu+Mh
 aVqojW8uBm4N6z81iErpyRwUjj9PjBUTT0/tKnAIyL4lJoRlRA8F5r77rRyROwIkn58W
 xl/reXyvd77ScKO6lmhcMwIqkTPqRgac1EF2f4FTv1zsySmC4UddPCQOLTXfsW81VFJ4
 y+Xw==
X-Gm-Message-State: AOAM530fUBgty7L112j49oKtbJUMFOur4tO8u3DpWm2SXWJ7FxDhvV30
 WrWTQ5UEMV4Y1xHr8wVakwRMPf48wZm/mW4RCzf9IcJakjQ=
X-Google-Smtp-Source: ABdhPJzb1tD2LmJ8tp6RbAhJBJCOjfLazkH7aZEB+Qz4bVwRprWKluCD0K9DoGQLFrhgFdl9XVrkJbPy20dGBz6VuDk=
X-Received: by 2002:a81:3252:0:b0:2f6:b826:2286 with SMTP id
 y79-20020a813252000000b002f6b8262286mr23062193ywy.289.1651751410012; Thu, 05
 May 2022 04:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-6-dmitry.baryshkov@linaro.org>
 <91f3c385-9d6d-faef-384e-1d87e507c1f2@arm.com>
In-Reply-To: <91f3c385-9d6d-faef-384e-1d87e507c1f2@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 14:49:59 +0300
Message-ID: <CAA8EJpqj-fBuRasV-sDUVrCX_yASbZCA9d20T7bojzS46-F8_Q@mail.gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/5] drm/msm: switch
 msm_kms_init_aspace() to use device_iommu_mapped()
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 at 13:27, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-05-05 01:16, Dmitry Baryshkov wrote:
> > Change msm_kms_init_aspace() to use generic function
> > device_iommu_mapped() instead of the fwnode-specific interface
> > dev_iommu_fwspec_get(). While we are at it, stop referencing
> > platform_bus_type directly and use the bus of the IOMMU device.
>
> FWIW, I'd have squashed these changes across the previous patches, such
> that the dodgy fwspec calls are never introduced in the first place, but
> it's your driver, and if that's the way you want to work it and Rob's
> happy with it too, then fine by me.

I thought about this. But as the calls were already there (in the
mdp5), it was easier for me to merge the code and to update it
afterwards.

>
> For the end result,
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>
> I'm guessing MDP4 could probably use msm_kms_init_aspace() now as well,
> but unless there's any other reason to respin this series, that's
> something we could do as a follow-up. Thanks for sorting this out!

Not really. MDP4 doesn't have the parent MDSS device, so it doesn't
need all these troubles.

>
> Robin.
>
> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 98ae0036ab57..2fc3f820cd59 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -272,21 +272,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
> >       struct device *mdss_dev = mdp_dev->parent;
> >       struct device *iommu_dev;
> >
> > -     domain = iommu_domain_alloc(&platform_bus_type);
> > -     if (!domain) {
> > -             drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> > -             return NULL;
> > -     }
> > -
> >       /*
> >        * IOMMUs can be a part of MDSS device tree binding, or the
> >        * MDP/DPU device.
> >        */
> > -     if (dev_iommu_fwspec_get(mdp_dev))
> > +     if (device_iommu_mapped(mdp_dev))
> >               iommu_dev = mdp_dev;
> >       else
> >               iommu_dev = mdss_dev;
> >
> > +     domain = iommu_domain_alloc(iommu_dev->bus);
> > +     if (!domain) {
> > +             drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
> > +             return NULL;
> > +     }
> > +
> >       mmu = msm_iommu_new(iommu_dev, domain);
> >       if (IS_ERR(mmu)) {
> >               iommu_domain_free(domain);



-- 
With best wishes
Dmitry
