Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225BF6A9588
	for <lists+freedreno@lfdr.de>; Fri,  3 Mar 2023 11:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02C110E0C6;
	Fri,  3 Mar 2023 10:46:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9710E004;
 Fri,  3 Mar 2023 10:46:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7058D617D1;
 Fri,  3 Mar 2023 10:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD994C433EF;
 Fri,  3 Mar 2023 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677840375;
 bh=BaXSPFUKDYDeayh9el1NehZiPOOebhV9G7uXQK7ivfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RWfsbGkkr/6oryzvQL6+myKR6tU3L14rK4onQ8E6dk10KmE9IG+MJUFa8S3tSlYhU
 BZ044t15gzZwuiJ+oRi4Rlf94k9matUipNXjywBEnULT1apuxFqjSQHMvOxs/zagBb
 +KaywpOmicRN/mgTIjj02Mtit5HS23aqwfl2gq8/DsSrGNeR0afkzDXtLUJSh0VLiy
 0UQVgSQL9ifozO1za6vrPSGFmLf3Qtha/2jCTP6k/G5lgWuVXsXH81V3gCV+OEGPjY
 XZfjyQTfu2CX8VbcjsFxIBZMdi5QmUUjwclSJvVwVjl4roKDVk8bYZPVSVX0yErvzD
 tPEZFEFdOkAtA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pY2w2-0006CR-16; Fri, 03 Mar 2023 11:46:46 +0100
Date: Fri, 3 Mar 2023 11:46:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <ZAHQFn8CD9CNvz/0@hovoldconsulting.com>
References: <20230221101430.14546-1-johan+linaro@kernel.org>
 <20230221101430.14546-4-johan+linaro@kernel.org>
 <CAF6AEGsco+h0f5twHz9CRFyCUeiK1WOJWcURW3wPiZx5muio0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsco+h0f5twHz9CRFyCUeiK1WOJWcURW3wPiZx5muio0g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm/adreno: drop redundant
 pm_runtime_disable()
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

Sorry about the late follow-up on this. Went down a bit of a DRM rabbit
hole this week.

On Wed, Feb 22, 2023 at 11:09:16AM -0800, Rob Clark wrote:
> On Tue, Feb 21, 2023 at 2:16 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Since commit 4b18299b3365 ("drm/msm/adreno: Defer enabling runpm until
> > hw_init()") runtime PM is no longer enabled at adreno_gpu_init(), which
> > means that there are no longer any bind() error paths for which
> > adreno_gpu_cleanup() is called with runtime PM enabled.
> >
> > As the runtime PM enable on first open() is balanced by the
> > pm_runtime_force_suspend() call at unbind(), adreno_gpu_cleanup() is now
> > always called with runtime PM disabled so that its pm_runtime_disable()
> > call can be removed.
> >
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index ce6b76c45b6f..1101b8234b49 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -1082,15 +1082,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >
> >  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> >  {
> > -       struct msm_gpu *gpu = &adreno_gpu->base;
> > -       struct msm_drm_private *priv = gpu->dev ? gpu->dev->dev_private : NULL;
> >         unsigned int i;
> >
> >         for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
> >                 release_firmware(adreno_gpu->fw[i]);
> >
> > -       if (priv && pm_runtime_enabled(&priv->gpu_pdev->dev))
> > -               pm_runtime_disable(&priv->gpu_pdev->dev);
> > -
> 
> Maybe WARN_ON(priv && pm_runtime_enabled(&priv->gpu_pdev->dev))?

I'd rather not add warnings for something that can not happen, but it
turns out there is indeed one corner case were this function could still
end up being called with runtime PM enabled, namely if suspending the
scheduler fails in adreno_system_suspend() during unbind:

            adreno_bind()
             info->init()                   // e.g. a6xx_gpu_init()
               adreno_gpu_init()
    
            msm_open()
              load_gpu()
                adreno_load_gpu()
                  pm_runtime_enable()
    
            adreno_unbind()
              adreno_system_suspend()
                err = suspend_scheduler(gpu)
                if (!err)
                  pm_runtime_force_suspend()
                    pm_runtime_disable()
              gpu->funcs->destroy()         // e.g. a6xx_destroy()
                adreno_gpu_cleanup()

I assume we'd be in bigger troubles than just having an unbalanced
disable count if that ever happens, but we should probably just keep the
conditional disable in adreno_gpu_cleanup() in place for now.

> >         msm_gpu_cleanup(&adreno_gpu->base);
> >  }
> > --
> > 2.39.2

I've found another related runtime PM issue so I'll send a v2 anyway.

Johan
