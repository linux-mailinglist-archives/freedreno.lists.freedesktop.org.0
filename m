Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D05539800
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 22:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310C610E1BD;
	Tue, 31 May 2022 20:34:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644D210E190
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 20:34:46 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 190so14022762qkj.8
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fh41uCU0B0HjBQXprAp7krFBQPqgkjOy/nUjVHNbUw=;
 b=cg6LfZ2kXIK9pxClWtEHJwSucUWw4dIXpd5+sYRrz3pb5+GxzuJ1aq9JCx6TIF2m5p
 RT20SL65M2yezc64XYlLvzEI6Sd+Bqh79gRnc64JONcBV+aNMuQe1kq9bYba3YSI92Ys
 h8rpWCWKrdWsCeM0nM4YKH+YtLRPiu03o5n/B+IoT9qwKMDQl+nU6wZD+1GP6z5jVWoR
 r81DOxzJA3HGeAG1/CYbRaDkxQWHryEDJ7jXGekIyqbfTemiNu1CWtmckG5jr6iSU0uP
 mpK0G+BqvyyKnarnXuLVX6IMIK6AVtwYYWZceOyq5V2OVHA5C4V2p6DrK7Q0WYk+Jnb7
 uT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fh41uCU0B0HjBQXprAp7krFBQPqgkjOy/nUjVHNbUw=;
 b=tu93y/BumGCKZcVlR4plVeKkA3+n9WaNqHxK4yUmgO6WRn3BO1YvpX37kfqZWgBsWh
 NhnfKz+i4l2LdvEKIVifmtWOBiUhkBLKc3yKClEdo46QLcSHhjH0muin1mR3T+Tr+oQZ
 UJE2t7b9TuajAnhxtIOU/jhN1NYkhtOQm+rD7xl2t71gJqVtLtGFpnKKK60L9HGMhU4E
 9E9jk4UsRdBritCNcq+ia9/rAVcbYq7CRT5n5mnPEWU0x7RkGHXeaibFiMruW+K4GVRB
 UGBeJHEooghfWBg9wiOPF6te82t+MzFfOsqCPt1z0HsE9AaNKpTOuVqOmbhTpNiiFZjV
 rDjA==
X-Gm-Message-State: AOAM530nIyfCdRdVJCgr5EG1SW0FQEkuJyPzMJv87K6udrvBFwzRBFcW
 gIHpLZQh2l32wUfqX9uATz4hGZfRP7FFk8ODF7vGQg==
X-Google-Smtp-Source: ABdhPJz5IQSs0iubNWF0AHMHHE5gGY9ALKbjx1Exvbh1qJxPkgPlKRPWxj874jacm+IrqVX5a3l3Jg663f6Em2Lj6X0=
X-Received: by 2002:a05:620a:414e:b0:6a5:8dec:57bb with SMTP id
 k14-20020a05620a414e00b006a58dec57bbmr24700836qko.30.1654029285518; Tue, 31
 May 2022 13:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220531200857.136547-1-robdclark@gmail.com>
In-Reply-To: <20220531200857.136547-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 May 2022 23:34:34 +0300
Message-ID: <CAA8EJpouqO9KfhAQSqEHP8MUGTkntx7iARRRqrvx3uMFQd4-dQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Ensure mmap offset is initialized
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 at 23:08, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If a GEM object is allocated, and then exported as a dma-buf fd which is
> mmap'd before or without the GEM buffer being directly mmap'd, the
> vma_node could be unitialized.  This leads to a situation where the CPU
> mapping is not correctly torn down in drm_vma_node_unmap().
>
> Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake offset")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c       |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h       |  1 +
>  drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 44485363f37a..14ab9a627d8b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -964,7 +964,7 @@ static const struct drm_driver msm_driver = {
>         .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>         .gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
> -       .gem_prime_mmap     = drm_gem_prime_mmap,
> +       .gem_prime_mmap     = msm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init       = msm_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index bb052071b16d..090b8074fec7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -275,6 +275,7 @@ unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_t
>  void msm_gem_shrinker_init(struct drm_device *dev);
>  void msm_gem_shrinker_cleanup(struct drm_device *dev);
>
> +int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 94ab705e9b8a..dcc8a573bc76 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -11,6 +11,21 @@
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>
> +int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       int ret;
> +
> +       /* Ensure the mmap offset is initialized.  We lazily initialize it,
> +        * so if it has not been first mmap'd directly as a GEM object, the
> +        * mmap offset will not be already initialized.
> +        */
> +       ret = drm_gem_create_mmap_offset(obj);
> +       if (ret)
> +               return ret;

Wouldn't it be better to have this call directly in the
drm_gem_prime_mmap() ? This way all drivers can be lazy.


> +
> +       return drm_gem_prime_mmap(obj, vma);
> +}
> +
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
