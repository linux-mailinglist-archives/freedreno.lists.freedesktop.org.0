Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D64F62AC
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 17:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6225110E385;
	Wed,  6 Apr 2022 15:10:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0829C10E3FB
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 15:10:38 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso1907928otj.5
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
 b=OuP7pmKSNZDGrcIzCwJpg2/t9nw1/WFVenZlPZZPYYqR3ddx27AM1BdClVJBzRLnM/
 XzyRxX5oW18V+chqRFu7GaSf6OPLzLbij/YLJdjj44ZV17xQdIINEj7ednClXRZGPfWk
 yoK5NuZk4gawap5VuGW2wqbV+SL+0xGTL7UXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EW64PsFO/oRdWsOjfEcx3qDN++rt+wfe2o19U6WLL8w=;
 b=K2GPmirl0yP8vaiTXS7FC0GI+hr4Gza0NroqlpuJSH5AxIIHQJKtqHhOw6Id663TjL
 u5XHjWjVj718+8WK2LhSjeYzvHZT5NDHTRQznUZAx43N22sqg8TpDlf1SlVzBdIA2SDg
 NK6qQXyFAkV3f5oJmZwJzEsOnC2+fwVLEA650r3Q3hCcHusOPpQ16+XdN8EtgvtTIGyp
 Sb6/Ptv3RsEWskyY61XtfmbvU7OFo2ppLcKL6DL3OJdx8NPXmJlcX3Y80qtEix98/rL1
 TfATN7ukrl6lQgekSAYa7GzzH2dZ+7dJF54EDtB0Yf+6f2LvQB9MYNKSZ89gdlrduyRf
 Q3JQ==
X-Gm-Message-State: AOAM5315jTxhEZtgM10Ev1lgjuhnx0+GW+CWQXDhm/iiPCpKjWSlfgFf
 fSl9dnpKOqjkMEcxqXE2Wxz9KHpURU8cHRx36Og20Q==
X-Google-Smtp-Source: ABdhPJw6NpBjiEJqSqfKLXHGIB0nJEtoJYa4P3HUoNxUv5I2kNi8OGPCno72muKbEi3n2T76pqYyndvLaE5nenHEEhY=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3145467oth.77.1649257835830; Wed, 06 Apr
 2022 08:10:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:10:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
 <20220406101247.483649-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:10:35 -0700
Message-ID: <CAE-0n50FBpNy=Hmfz8+MKziPY=Z9079jFm-ZHrBD-hd_TMv37w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm: don't store created planes,
 connectors and encoders
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-06 03:12:47)
> There is no point now in storing arrays of creates planes, connectors
> and encoders. Remove them from struct msm_drm_private.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
