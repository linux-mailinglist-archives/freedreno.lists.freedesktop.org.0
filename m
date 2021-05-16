Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50894381D0A
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 07:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE386E48F;
	Sun, 16 May 2021 05:41:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EED6E48F
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 05:41:39 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so2863662oth.8
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ex/qpXJf4AhFRi91vcRafWmhcSGoGou40KL895JaIFA=;
 b=Lpeq7GP++jU56TbCN+YIb0aFf9gf7pk9eUrF3cgT2MgWpZ4i6NIKrCMLfLQMjaPg1R
 SM5QrK6Y6vSWxkH85PKtUhxKnylSVgFBJELq8iiAfXHTwaT3Pc6CmjskoJfr/vT5juiM
 98BLVD+miCPeSEpoLyvaOLE/3wgULB3aY0/BQFjZ9l/Fr4aiR++meP2/EbDredqlbKkb
 5taHndGJyCv3r6suq3xot5c1GN959wl0VUJpVyRrKB7W/pZIew8qXF4mUiM+olnEEROF
 8aWrqkcZEd0k8ecjv75eFHrPibxZw35MR5B0JV82YusDz+ZhMzLMGZcPrs2TmTL1yI23
 jOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ex/qpXJf4AhFRi91vcRafWmhcSGoGou40KL895JaIFA=;
 b=eJXqaivyLieFA0dkjFvYwv3PeIIuYNryLTeTwu7lZfLDWsMRFMVKdJzgKK2Yuk1wB2
 DxWlWHWTFzk62L9e+yX023iSY7XOSGmF4yL03gWj8aVfgpzibc/LwjsVd+rRnA7sh8Mw
 f8U5Dwxy9URE94w6Vw4QoO4IV9OQoVtsaSPx3H7jWXLgaCVj/uHsxv6bXfG1vYiw6Rqr
 r327KS9I3vuz7sMhaWBspsfwaRJdmixpERlXeHf4lBQAWFUwM+v7DfiGSThJ003RL8jJ
 SjyDZXwpgTNAC4BVDHEArYZGb7avdHrUzXRlN+r36/SQ4ZcolS/9stgUzkZoD3JLQ5//
 X0NQ==
X-Gm-Message-State: AOAM5312PgWFkI1dEkcGUtrkPOKM2gBHYmGgtHMRMThnkEaHXLGjimxy
 QTNqZQJFT9N3gfFqGmuIr6V23g==
X-Google-Smtp-Source: ABdhPJw2Nj3cZgCAEoMIPuJs7ABiw4A32f1vC0+6nHTjwhuOBhfB3PQYTMmaTOASmE7ffsQpwZVgWw==
X-Received: by 2002:a05:6830:22cc:: with SMTP id
 q12mr25483616otc.145.1621143699019; 
 Sat, 15 May 2021 22:41:39 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y14sm2083342otq.4.2021.05.15.22.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 22:41:38 -0700 (PDT)
Date: Sun, 16 May 2021 00:41:36 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20210516054136.GR2484@yoga>
References: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove most of usbpd-related
 remains
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat 15 May 14:56 CDT 2021, Dmitry Baryshkov wrote:

> Remove most of remains of downstream usbpd code. Mainline kernel uses
> different approach for managing Type-C / USB-PD, so this remains unused.
> Do not touch usbpd callbacks for now, since they look usefull enough as
> an example of how to handle connect/disconnect (to be rewritten into .
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Makefile        |  1 -
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
>  drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
>  drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
>  10 files changed, 11 insertions(+), 168 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
> 
[..]
> diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c

It seems to me that this would be a reasonable place to plug in the
typec_mux stuff. And as we're starting that exercise we should perhaps
hold off on applying until we've figured out how that would look?

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
