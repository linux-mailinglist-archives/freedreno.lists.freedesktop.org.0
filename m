Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2611EB8C
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2019 21:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9106ECFA;
	Fri, 13 Dec 2019 20:08:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA256ECF0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2019 20:08:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so61806wmc.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2019 12:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
 b=ClR4vATi0lm/uR4AjmPvrLE1sJpqCemORzYcQ1ZyCMyMDz9nHE7MjkPPAbq2CwQUh4
 oCFzPzHDk+crtp1Wxw0tE8XY30FJKStbV5hn/qEcio8bHD8pIbcEYMlxJwKeeleN9dY2
 TdkBmKhNDVwIPzaUbzRIdJqvttbpH6SBk6j+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
 b=RVEm+P/afBQtSvmYT0q2/FYcJZCIAaR1iXI/tfVAFA3/f9CQh9h0fXrzyCslcK6xPI
 gvGxmzkdfGS01cbQWQjpx5mj+8f8qoChp6guyUpSpiWLFOppT8sA0TB1yljrntzwcM58
 5JDgelbh8WmY+CzmnWwFW5O7WACdjEh7nZqpSKrxluFGUA9KwH3BfZdPZzKYlaNQqmNK
 AMzHVZiDbXPYJR5c7j7vUt4T54nyfiqt2ic+d/1dYhp6sa1BdBjPArwepDyiG4P4NSX4
 yeNUd6nv3dOwEYywPinGWSkYWe9va0AmIZARk+PdksRaLdI+xbeSyymkcE1CwW9qk4kN
 lzRQ==
X-Gm-Message-State: APjAAAXTCt0QMcPBB4lBnei7jYLcu4dLryc1ihGPGryu1Hr4U6GwhX14
 9te1y29G8AOjE6b3r4LS2cMvfw==
X-Google-Smtp-Source: APXvYqzX6tiAiCD80RNWHMwm27uqrP0XdXvT5VcypsRlEX/9sHkfmDkuq4dAFfmPiG9IIWxysxsJ7A==
X-Received: by 2002:a05:600c:388:: with SMTP id
 w8mr15123380wmd.177.1576267730921; 
 Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id f1sm11018229wru.6.2019.12.13.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Date: Fri, 13 Dec 2019 21:08:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <20191213200848.GL624164@phenom.ffwll.local>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125094356.161941-4-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 25, 2019 at 10:43:55AM +0100, Daniel Vetter wrote:
> I'll add more fancy logic to them soon, so everyone really has to use
> them. Plus they already provide some nice additional debug
> infrastructure on top of direct ww_mutex usage for the fences tracked
> by dma_resv.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Ping for some review/acks.

Thanks, Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 7d04c47d0023..385d4965a8d0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
>  
>  	if (submit->bos[i].flags & BO_LOCKED)
> -		ww_mutex_unlock(&msm_obj->base.resv->lock);
> +		dma_resv_unlock(msm_obj->base.resv);
>  
>  	if (backoff && !(submit->bos[i].flags & BO_VALID))
>  		submit->bos[i].iova = 0;
> @@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  		contended = i;
>  
>  		if (!(submit->bos[i].flags & BO_LOCKED)) {
> -			ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
> -					&submit->ticket);
> +			ret = dma_resv_lock_interruptible(msm_obj->base.resv,
> +							  &submit->ticket);
>  			if (ret)
>  				goto fail;
>  			submit->bos[i].flags |= BO_LOCKED;
> @@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  	if (ret == -EDEADLK) {
>  		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
>  		/* we lost out in a seqno race, lock and retry.. */
> -		ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
> -				&submit->ticket);
> +		ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
> +						       &submit->ticket);
>  		if (!ret) {
>  			submit->bos[contended].flags |= BO_LOCKED;
>  			slow_locked = contended;
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
