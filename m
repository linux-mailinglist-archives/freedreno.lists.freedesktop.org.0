Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386962976C5
	for <lists+freedreno@lfdr.de>; Fri, 23 Oct 2020 20:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A896E33F;
	Fri, 23 Oct 2020 18:20:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF76E33F
 for <freedreno@lists.freedesktop.org>; Fri, 23 Oct 2020 18:20:09 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kW1fY-0006et-DX; Fri, 23 Oct 2020 20:20:05 +0200
Message-ID: <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 23 Oct 2020 20:20:02 +0200
In-Reply-To: <20201023165136.561680-24-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v4 23/23] drm/msm: Don't implicit-sync if
 only a single ring
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If there is only a single ring (no-preemption), everything is FIFO order
> and there is no need to implicit-sync.
> 
> Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> is undefined when fences are not used to synchronize buffer usage across
> contexts (which is the only case where multiple different priority rings
> could come into play).

Really, doesn't this break cross-device implicit sync? Okay, you may
not have many peripherals that rely on implicit sync on devices where
Adreno is usually found, but it seems rather heavy-handed.

Wouldn't it be better to only ignore fences from your own ring context
in the implicit sync, like we do in the common DRM scheduler
(drm_sched_dependency_optimized)?

Regards,
Lucas

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d04c349d8112..b6babc7f9bb8 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  	return ret;
>  }
>  
> -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
>  {
>  	int i, ret = 0;
>  
> @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  				return ret;
>  		}
>  
> -		if (no_implicit)
> +		if (!implicit_sync)
>  			continue;
>  
>  		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> +	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> +			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
>  	if (ret)
>  		goto out;
>  

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
