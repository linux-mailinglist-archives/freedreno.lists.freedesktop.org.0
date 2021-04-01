Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00335163B
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBF96EC97;
	Thu,  1 Apr 2021 15:34:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E90F6EC92
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 15:34:57 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id y12so1719001qtx.11
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
 b=ZvyGgtwhp/yzmDXIwQF7Mt/dKYhpq9jqpN/Cnmkg9DRciJnRa2ALWpEAjRCLwe8lAV
 qWl8byzgnWQYAr1MqjqlLVnhlKVj0c5hXxssMCPFLTRoDUoUJsH0XGI8aV4bagRB5Z7H
 WEBfBzo8GfeHg/lOq0EeaNJssHGA3k8vD/1Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
 b=uE0Bv2Lut+ZV8HGAgOy107lE6wJXpAln+IJgfugfcJHHN71837FYiWtTdm4ci/vYMp
 pKAM6by1G+i3Foz4XA4aruFM7YQLikO5jUbuwkrqnoPw+0kOLL4EAIsmfio57VDRiPDP
 FsXZnb3e1+Nj7R57MDRbdhwXnGOA+L0qsRER7E0L9VbOI4jKQCwlkn1EE4bJtjZ3YeJg
 3yMV9dyTPhOEtwdgeNja+GPtdU8Msy4C65RZE9Yfp6sGc4eTkf/k21QwqWo0Ab0afFD1
 Guwgkamdy3K0DcTWctfEJ77XVwDR/IvQ3O8h+0ChijKbNEAGDayiutjoLj2SePnmomQ+
 Ecsg==
X-Gm-Message-State: AOAM531zj2vIRbkycWL3iXyqmy4EtgDQTRt/rsszkPCUlP0Npe53K2w9
 oa/vA4cBTP46vfMHImRcvAKlHRkvtQnltQ==
X-Google-Smtp-Source: ABdhPJwAsKvU+MGpn9yCjd3pABsmikYjwgbLjBLNc7oUg70Wnr6KLW5X/b0+nVHR4gyzCZyDZrlOww==
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr7620724qtd.198.1617291296124; 
 Thu, 01 Apr 2021 08:34:56 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id d24sm4112037qko.54.2021.04.01.08.34.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id j198so2175440ybj.11
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id
 e184mr12540453ybc.345.1617291294869; 
 Thu, 01 Apr 2021 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-3-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-3-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 08:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: Avoid mutex in
 shrinker_count()
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
>                 if (freed >= sc->nr_to_scan)
>                         break;
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

nit: I thought the above multi-line commenting style was only for
"net" subsystem?

>                 if (!msm_gem_trylock(&msm_obj->base))
>                         continue;
>                 if (is_purgeable(msm_obj)) {
> @@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>
>         mutex_unlock(&priv->mm_lock);
>
> -       if (freed > 0)
> +       if (freed > 0) {
>                 trace_msm_gem_purge(freed << PAGE_SHIFT);
> +       } else {
> +               return SHRINK_STOP;
> +       }

It probably doesn't matter, but I wonder if we should still be
returning SHRINK_STOP if we got any trylock failures. It could
possibly be worth returning 0 in that case?


> @@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
>         unsigned unmapped = 0;
>
>         list_for_each_entry(msm_obj, mm_list, mm_list) {
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

If you end up changing the commenting style above, should also be here.

At this point this seems fine to land to me. Though I'm not an expert
on every interaction in this code, I've spent enough time starting at
it that I'm comfortable with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
