Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358E350A5C
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 00:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DDC6EB9D;
	Wed, 31 Mar 2021 22:44:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1466EB9D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 22:44:38 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id x14so407369qki.10
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAjs9EXx6Yc80YSTGK/3hcA/MZAHT8V3jPabf02H2g4=;
 b=M8JTOyCV+omhztb3AOc76Z2AYBAfNhaBfcELYiMbILrjm988hUt/iB9zi/7/Ye5al2
 Sn6VCj2mDj3ceKf+3fr2qzzD47B2KNRVS4F1UIOg7YbXoq/bC/lk9IHsrh1eehX7uBNX
 VjmHcTe+Qf5Bi5FQJsrSXKg4tBnotQmwxT59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAjs9EXx6Yc80YSTGK/3hcA/MZAHT8V3jPabf02H2g4=;
 b=ukxvCeQDlmnRsYboYS2mxKN0gfEUzggUl05NzCk6UPjG6ED/L4v06vQljPijhw3JuN
 KoE1nPlmQ/VT+cE3YMEBZHNqHXa0s9oSxKHNj1DesTV30j3BEcfOm9PqiZSueIhX+IjH
 gJv6CZjzm5OvsA6A8ItZgPvSHkAISRhyws2u2rx/kwZssfPuSsVQRgfQE/PRkvljgMbv
 KGrHHuBrEGiPg9IIvgDQnXHrxHbl8906xBDaM/MiNzyNGKzi9tl81FsOSO55TFr3Mj1v
 F0aUR/zIncIqdyQVdKLQ0m0MTuuOMQkHe4ya8aj3HJ5lgkYmcNtAq0XI8X54s8fB/JKu
 zhJQ==
X-Gm-Message-State: AOAM531nsX7VIXUYmHLLfC1XfcpTAmSDSPsYVVpTxDeXO71nmJJUvcts
 umvC8haEETpg/Qlr1gL9frbNeYdXojkoZg==
X-Google-Smtp-Source: ABdhPJydagS7rSxt8ifYLSKGoEKix17lBP/3jgYiqtHfylIQ2w014LYx2GtgC8KY+q59LnuQ9BirvA==
X-Received: by 2002:a05:620a:cc1:: with SMTP id
 b1mr5408469qkj.356.1617230677351; 
 Wed, 31 Mar 2021 15:44:37 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id u21sm2327359qtq.11.2021.03.31.15.44.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id m132so22898425ybf.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id p193mr7640863ybc.405.1617230676164; 
 Wed, 31 Mar 2021 15:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-3-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-3-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 15:44:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
Message-ID: <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
>         mutex_lock(&priv->mm_lock);
>         WARN_ON(msm_obj->active_count != 0);
>
> +       if (msm_obj->dontneed)
> +               mark_unpurgable(msm_obj);
> +
>         list_del_init(&msm_obj->mm_list);
> -       if (msm_obj->madv == MSM_MADV_WILLNEED)
> +       if (msm_obj->madv == MSM_MADV_WILLNEED) {
>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> -       else
> +       } else if (msm_obj->madv == MSM_MADV_DONTNEED) {
>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
> +               mark_purgable(msm_obj);
> +       } else {
> +               WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
> +               list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);

I'm probably being dense, but what's the point of adding it to the
"inactive_purged" list here? You never look at that list, right? You
already did a list_del_init() on this object's list pointer
("mm_list"). I don't see how adding it to a bogus list helps with
anything.


> @@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
>         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
>  }
>
> +static inline void mark_purgable(struct msm_gem_object *msm_obj)
> +{
> +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> +
> +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> +
> +       if (WARN_ON(msm_obj->dontneed))
> +               return;

The is_purgeable() function also checks other things besides just
"MSM_MADV_DONTNEED". Do we need to check those too? Specifically:

 msm_obj->sgt && !msm_obj->base.dma_buf && !msm_obj->base.import_attach

...or is it just being paranoid?

I guess I'm just worried that if any of those might be important then
we'll consistently report back that we have a count of things that can
be purged but then scan() won't find anything to do. That wouldn't be
great.


> +       priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
> +       msm_obj->dontneed = true;
> +}
> +
> +static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
> +{
> +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> +
> +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> +
> +       if (WARN_ON(!msm_obj->dontneed))
> +               return;
> +
> +       priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
> +       WARN_ON(priv->shrinkable_count < 0);

If you changed the order maybe you could make shrinkable_count
"unsigned long" to match the shrinker API?

 new_shrinkable = msm_obj->base.size >> PAGE_SHIFT;
 WARN_ON(new_shrinkable > priv->shrinkable_count);
 priv->shrinkable_count -= new_shrinkable


-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
