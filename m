Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA35241B4
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 02:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D4610E5EA;
	Thu, 12 May 2022 00:52:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B10C10E5EA
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 00:52:29 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-edf9ddb312so4891649fac.8
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 17:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
 b=cOc/ULhNS4VZgkhofRchN39m+cfbPtZsxhK2XKYkfT2dFHetpaa89L2NTSPaoYADiZ
 DPkgapU/gqwvkkJPzoL3lwgAIpTKGEqV+rQOpuUTp5THjNE1vXdLfxej+k05z8TDHrKI
 eoPWGslKfu1cmud7L+fcfMsfQuuk2c64zlCnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
 b=gm/pTv8UyCvWQc+lUhwKPy+CKnDkUETr3gGI8/RpWvZBDZ0250zpDs0bvOfV6Q8Z+h
 HGL1Lh09+Zo52bAGcFOl9i1AF/pPxw9Bwuiu1kUAVgF6FlSKPjlG5BcD9f8U7SfgT9Gy
 Wa+V05nGVhKEDfAhGgcJbLjF22gnj7nUA2LEaQS+nYYM5i0r6rTmh2Rb2ybIqyz41kdz
 N3pWooFXwvv/vL/ndVfZ+Qp0dyUCjgAy59M9COc9a9/KO2zzUA0IvUCHhEj7bQc4KdC+
 6cIaXIi8v3aw9Q1LYLHHWVImAXWTIzMPQGdm9WFz1PxL3sBweZHmuQ1lWK5VHnoodKAR
 txrA==
X-Gm-Message-State: AOAM531eX/szd84dm+sQtko0Hlr28tiTWf394POSsvATmfBPh9kj6XGh
 qIVWre1VJMZvxeiMmLWMaK0tz/c3cKcZm8OfQLxMXA==
X-Google-Smtp-Source: ABdhPJwX4oTvClZRn3k1F+TWgXVFBrjhZFK8ryObp71Dxi76wH3GSTdge9rwubpK0xGCkBygRmrlaUl0Lz8oFCYnoDg=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4167327oal.193.1652316748287; Wed, 11
 May 2022 17:52:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:52:27 -0700
MIME-Version: 1.0
In-Reply-To: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
References: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 17:52:27 -0700
Message-ID: <CAE-0n51+94O20QW2rWqV2LBeb+5zoi4HNfRp=Sus-Z+tM5FRJA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: remove NULL-ness check in
 dpu_hw_intr_destroy
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-07 04:40:09)
> There is no need to check that kfree() argument is not NULL. Remove
> extra check and call kfree() unconditionally.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
