Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A64F958C
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 14:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B79310F0FD;
	Fri,  8 Apr 2022 12:21:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B78C10F0FD
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 12:21:53 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id v2so10475851qtc.5
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
 b=K+SFu/xAxfSv8ptmfSt0vivA6W2FAX95a45VvUQlpVTHnKOdxmllKplZItjMf+HOQC
 9DYIktpng9TB25OnHxCrL64xd6fagaJZqoStF5Wx0Hy3ikDlXsYpsImSLq3jJX7NTozr
 jtJAtIG8hw7MQ1aH37SBKuyIZgS9cGBl6TipnChp/SytE1xsSgwhG4Uzcr65ZrCPcP+H
 sAhYViuQqi8e3dsmU1FBooELOGstjUC1c8KwpSr76ErlET7J3vbBGnI1/nfA4XuHLqHU
 HNG9mVm9fFu/DvOkx0m06XL6cqKui8Sturp1GWXhuphbUv9x0d4AJRfHRzn1njbuw5PG
 NScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/BWz3Pk8r30Gfc4qGV4ZOyYfEY0sq1wDYCw1e9kQ38=;
 b=GqIhfaM77iaB1pPpP2R6WxDrncn/bK1gl3e72EoVqqDWHU4PtCsPqMnMCjX1dpZh4d
 bxXj75HYLh2nb2CdGYZWmMUySpJcTpdt1lXbN+ra9RiRfaMOfcBaAemTOL4JcbB7m0jz
 Th0cE3pkR98fqgIcvqm731UhwijOUyHCBUMquHFcCdWrFRLvZ9a136qM4NQCYoUfeLMK
 +xq2bg1USURbq6W8qeQcbPH6T+Cft0gIb9DFbdOTbjivcssQbvajp+ejP/9NrQRANXrO
 iET1xeNiOBsj5BRUXwixDLnfYzjFQUR+Dz/pb0k2yUtorL4shm5wWRAB+hAzB4B/9lN5
 6blA==
X-Gm-Message-State: AOAM531vAYHbxraqQAtsKmADjH+Nl+UyG68RxHnsn2QBEJ+3VKyJ+0Ox
 93MCw3nEuHGjcPIgk9o4RTr0eOwxIchp3B6ib7PLQw==
X-Google-Smtp-Source: ABdhPJwFncjOacPlNFbEfJskgVWNz1y73VUg9c9DTYFByySPmUZZzySIYxy5P7V4YxD2DiJx66tjsu6VB/xf/JxBQmg=
X-Received: by 2002:ac8:7dd1:0:b0:2e0:6fe1:189b with SMTP id
 c17-20020ac87dd1000000b002e06fe1189bmr16058848qte.629.1649420512329; Fri, 08
 Apr 2022 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
In-Reply-To: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 15:21:42 +0300
Message-ID: <CAA8EJprFBJeQQo79LOdJR0pA75wbzM64KRnPLHqLOGJ2KpJkEg@mail.gmail.com>
To: xkernel.wang@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/mdp5: check the return of
 kzalloc()
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, daniel@ffwll.ch, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 05:33, <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check it to
> prevent potential wrong memory access.
>
> Besides, since mdp5_plane_reset() is void type, so we should better
> set `plane-state` to NULL after releasing it.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> ChangeLog:
> v1->v2 simplify the patch and update the description.
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69af..50e8542 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -90,7 +90,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>                 __drm_atomic_helper_plane_destroy_state(plane->state);
>
>         kfree(to_mdp5_plane_state(plane->state));
> +       plane->state = NULL;
>         mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +       if (!mdp5_state)
> +               return;
>
>         if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>                 mdp5_state->base.zpos = STAGE_BASE;
> --



-- 
With best wishes
Dmitry
