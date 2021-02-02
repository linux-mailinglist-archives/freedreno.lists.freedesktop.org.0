Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5B30C54C
	for <lists+freedreno@lfdr.de>; Tue,  2 Feb 2021 17:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564356E95C;
	Tue,  2 Feb 2021 16:19:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06C6E94F
 for <freedreno@lists.freedesktop.org>; Tue,  2 Feb 2021 16:19:28 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c6so23586270ede.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Feb 2021 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMlokKzdK8V+Gvn42ll3ctucK3HqZBs6Jki/pOm978k=;
 b=CJkHp49YHJzedJgJ8H0hrsZdj+gxcN3BAsvOFGka+ihZA4DTtNVEF5t6RKE0TjxW2v
 3VMpxwUMuwbNi+sSTVjV8U9TbMQR0g84EXXXwMnBwLizunO/vn7NmdkDEm3nB97gJTge
 CmQx3qInSpzwbtaBji+YfXyAplBiO9PFpqcoQ0ydL6y+RMvM1c0F3g9IW/lFuwUbT5i2
 qsaxe9NAtjm1ocM5j13weD5kinZM7PA6gEygB1wxycnQH2CQLBM2UcnuYsGyVzyaSeIq
 biGF22X3wYmB4rJilAkhYYsEww8QJ/4taedDev41OVAc/XEl2Hmuu3ClRaJTCidCqhBc
 rsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMlokKzdK8V+Gvn42ll3ctucK3HqZBs6Jki/pOm978k=;
 b=eLocNdiBOih4hO4+rUQYXLztdY1/tP5PCJM/MPvtLoP9IrPFpkTm9pnBDxJjW1w5fm
 3Xem/lVBeSE4IVVHc3D5anWsBhqr97sPWf4kJwBbr9sfO7AOm19vUolRDit6XqdBG/X3
 xQ8JMPdBmUF2gm46iSjO30M1CqBUw9228ucRMU/VpWOMP5xnedKlYQWNlcFpz2ai29IC
 +bMNBmchIiVoFYNEP7rE/gKT2ud8AIQL9CKH1lfTuwy7Ps/uNAjB8oBEPsJ+hzpymP4H
 69h+nFLRd/Moyd2uYRR2mj1ggm0UGhwQ8PmHBShZKwUIZe9gmbt202wNsxuHPocGJuE8
 RCUw==
X-Gm-Message-State: AOAM5324UDpgU49R5WvndIo2N8y4r2WanOZPWYjWW//APuatRyvgK23R
 4tNW1jblWxCGFvNFZnVyB8bKuUhKFSk/Dqg7kYyD7w==
X-Google-Smtp-Source: ABdhPJwCqe/XoviTy7D5nVnoFrHySYWSUZsc5T9i8NY4Drep3y9EoWok5QgcVbshVpZUffyKN2kscyfdEMC4Lz+Xmes=
X-Received: by 2002:a05:6402:202a:: with SMTP id
 ay10mr3681976edb.93.1612282766286; 
 Tue, 02 Feb 2021 08:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20210202123214.15787-1-bernard@vivo.com>
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 2 Feb 2021 08:19:14 -0800
Message-ID: <CABXOdTePOqMtZ88oTNDc0TT7oH652nLHApuXkbB-44jG5Z8PAg@mail.gmail.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable: "rc"
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
Cc: freedreno <freedreno@lists.freedesktop.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <groeck@chromium.org>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 4:32 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> remove unneeded variable: "rc".
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index d1780bcac8cc..9cc816663668 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -409,7 +409,6 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>
>  int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>  {
> -       int rc = 0;
>         struct drm_display_mode *drm_mode;
>
>         drm_mode = &dp_panel->dp_mode.drm_mode;
> @@ -436,7 +435,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                         min_t(u32, dp_panel->dp_mode.bpp, 30));
>         DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       return rc;
> +       return 0;
>  }
>
>  struct dp_panel *dp_panel_get(struct dp_panel_in *in)
> --
> 2.29.0
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
