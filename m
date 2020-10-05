Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F241283733
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 16:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AF689CCE;
	Mon,  5 Oct 2020 14:02:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FF789CA2
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 14:02:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v12so8918380wmh.3
 for <freedreno@lists.freedesktop.org>; Mon, 05 Oct 2020 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kw0jH99mH65cgbBf0cAKvt7u45o+bI69PtoRz7plT9I=;
 b=LKbavLR8ZdTnQm7tlmWwgndIQwhen8v8O8x1psZ+HIE2wmAD24D+bXj5NwsJAvyS/R
 MQkiaMJ/+ob1zWMVtrd+sEWT6BKvZocdCnxbzPsmOqi3r39+dbuF1VEaGtZJZGoHTneV
 0F4uvulqQGo0uTF43vmMZxaBExbJ8UbT6Sb9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Kw0jH99mH65cgbBf0cAKvt7u45o+bI69PtoRz7plT9I=;
 b=Omotk4sxGpoR7xd24HDu+lidwPAvlaJSU3WuSnjdNQb0p/QVJkCTmcE9B1ycHWZeM6
 sQYFPOLt+3+ZyGnzxeNzcDm49s+lMfoVDiCwG9su18QoTJ5+DoIHz7PIFzjQ8/JxsDY5
 nWohI9QEuSaY1CqXyuVMAfl1PCme7XOwcVJfEzldjDElVyR+dJv3ui52eQ97loLdh+LR
 WBAcOhbwVLo9L0TBT0Ia1zNLzNfOCaFEa+1ThO4NDrlgzbSpNOXJGz8OvrjSZ6g9oNpz
 xK57X40+9TVb05Jgv97OzO4ngsivz89DNGM7IaNeEjlVF+J78MXGIbpve5YNSnJ9izRB
 Mb+A==
X-Gm-Message-State: AOAM533K0VhY2NNAQPjeWzweFcqEDaCOvPq2QXbB0udrerTIB8+KT5jW
 LRDeNlY9ecmgK9MST5f+q7AFIA==
X-Google-Smtp-Source: ABdhPJxaKvPpL0rwdLNrB+ck47hYngpJ9D4J1RqIbGrDU+BZnsh9AH/S/PSgGf1teantMnWe2hZn8w==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr17734071wmp.187.1601906526822; 
 Mon, 05 Oct 2020 07:02:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t15sm78967wrp.20.2020.10.05.07.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 07:02:05 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:02:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hillf Danton <hdanton@sina.com>
Message-ID: <20201005140203.GS438822@phenom.ffwll.local>
Mail-Followup-To: Hillf Danton <hdanton@sina.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005092419.15608-1-hdanton@sina.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Freedreno] [PATCH 13/14] drm/msm: Drop struct_mutex in
 shrinker path
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> 
> On Sun,  4 Oct 2020 12:21:45
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Now that the inactive_list is protected by mm_lock, and everything
> > else on per-obj basis is protected by obj->lock, we no longer depend
> > on struct_mutex.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> >  2 files changed, 55 deletions(-)
> > 
> [...]
> 
> > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >  {
> >  	struct msm_drm_private *priv =
> >  		container_of(shrinker, struct msm_drm_private, shrinker);
> > -	struct drm_device *dev = priv->dev;
> >  	struct msm_gem_object *msm_obj;
> >  	unsigned long freed = 0;
> > -	bool unlock;
> > -
> > -	if (!msm_gem_shrinker_lock(dev, &unlock))
> > -		return SHRINK_STOP;
> >  
> >  	mutex_lock(&priv->mm_lock);
> 
> Better if the change in behavior is documented that SHRINK_STOP will
> no longer be needed.

btw I read through this and noticed you have your own obj lock, plus
mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
for all object lock needs (soc drivers have been terrible with this
unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
trying to play clever games outsmarting lockdep.

I recently wrote an entire blog length rant on why I think
mutex_lock_nested is too dangerous to be useful:

https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

Not anything about this here, just general comment. The problem extends to
shmem helpers and all that also having their own locks for everything.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
