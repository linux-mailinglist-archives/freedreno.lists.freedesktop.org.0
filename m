Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9325350A95
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 01:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60B56EBA1;
	Wed, 31 Mar 2021 23:13:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9B76EB9F
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 23:13:28 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id z10so450111qkz.13
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LElCdf0KbUkyEvJs0p0IvZKV+wdmQvAnSKb7zsKMRmg=;
 b=ZrUj57P4j3iT2bZyUGZXH+q99R315qVADdUvYGP3bBtluIJt4nmKdMib/Uqs/mIyGs
 vZDSs0+bbbq2wo3FJQ8uyfnIkLcwgxvpwkQgtCNjfAAMxoOUi68ENAouCZBy5SHnDzyL
 JX1T6hiVCC1hFUQS8z6gbPipWXEfvF5sBFekM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LElCdf0KbUkyEvJs0p0IvZKV+wdmQvAnSKb7zsKMRmg=;
 b=q5EfYVFX/lJsjJ7NvLBPY+Ib310r2D+ZtcG2SSn9tz8z4Vmw1/Ru4oijuJ7+ZIg8iZ
 UOuVuu9EVknnq/Ig3zW1rdSrN2Xoz9wEMHuO+lm4ANwXDPgV8KHxd+0XOLuWmP/r94k2
 2Z6P6A+Ewy4lBKcSKR/f4/x49e2Szdvn5aU6RrEBAf+niXls7bk2WZ9PoxYk+u+jBhVW
 z6gO3INL5Qnbu3wQrsfOqmDGHHip6ybtErSNDOXUoF26vvNwkuEA9VW/SRoiz6GYOll1
 g+VctWEvTBYSh11rs/XnC6K/zfwiiSoaKijYawcNny2xPdxhUylocxrkEG5oEF05nS8F
 BlZA==
X-Gm-Message-State: AOAM531QRmIWeriTH+3N1jItDWdkd9GDpg69+sBejvlS67VyxOorilnc
 /V6thhsBXIde4RpVWX/6rit7neNQveMQbQ==
X-Google-Smtp-Source: ABdhPJxKjvFDR5rnnhbWLt/Nh0FWNPMmXHQX3BYyiDc2dTbvlr0gsOwT8KOmRzBkLx/8GD60PmvHxQ==
X-Received: by 2002:a37:66c6:: with SMTP id a189mr5506857qkc.229.1617232406843; 
 Wed, 31 Mar 2021 16:13:26 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id q125sm2652355qkf.68.2021.03.31.16.13.25
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:13:26 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g38so22905481ybi.12
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 16:13:25 -0700 (PDT)
X-Received: by 2002:a25:e085:: with SMTP id x127mr1884118ybg.343.1617232405435; 
 Wed, 31 Mar 2021 16:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-4-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:13:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
Message-ID: <CAD=FV=UECYxLXQa_L572eLSVHq7pbxuA0zLvHzYHhCKy8K=9TA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: Fix debugfs deadlock
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -111,23 +111,15 @@ static const struct file_operations msm_gpu_fops = {
>  static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_gpu *gpu = priv->gpu;
>         int ret;
>
> -       ret = mutex_lock_interruptible(&priv->mm_lock);
> +       ret = mutex_lock_interruptible(&priv->obj_lock);
>         if (ret)
>                 return ret;
>
> -       if (gpu) {
> -               seq_printf(m, "Active Objects (%s):\n", gpu->name);
> -               msm_gem_describe_objects(&gpu->active_list, m);
> -       }
> -
> -       seq_printf(m, "Inactive Objects:\n");
> -       msm_gem_describe_objects(&priv->inactive_dontneed, m);
> -       msm_gem_describe_objects(&priv->inactive_willneed, m);
> +       msm_gem_describe_objects(&priv->objects, m);

I guess we no longer sort the by Active and Inactive but that doesn't
really matter?


> @@ -174,7 +174,13 @@ struct msm_drm_private {
>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
>         struct msm_perf_state *perf;
>
> -       /*
> +       /**
> +        * List of all GEM objects (mainly for debugfs, protected by obj_lock

It wouldn't hurt to talk about lock ordering here? Like: "If we need
the "obj_lock" and a "gem_lock" at the same time we always grab the
"obj_lock" first.

> @@ -60,13 +60,20 @@ struct msm_gem_object {
>          */
>         uint8_t vmap_count;
>
> -       /* And object is either:
> -        *  inactive - on priv->inactive_list
> +       /**
> +        * Node in list of all objects (mainly for debugfs, protected by
> +        * struct_mutex

Not "struct_mutex" in comment, right? Maybe "obj_lock" I think?

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
