Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFF502F57
	for <lists+freedreno@lfdr.de>; Fri, 15 Apr 2022 21:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05D10E151;
	Fri, 15 Apr 2022 19:41:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F341310E151
 for <freedreno@lists.freedesktop.org>; Fri, 15 Apr 2022 19:41:10 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r8so9186827oib.5
 for <freedreno@lists.freedesktop.org>; Fri, 15 Apr 2022 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9F4ViBP1B5lwRe2e2GOjDx7R3bqEzOXyftxCKevZkTo=;
 b=djiFHbU71h427KMMGiu8O39Z5qNmrcZo7U8qtlL2H+qzkMAgoE3ZBXAywvKa96Fna4
 4bVsWymVwZojVFq9YVAwHiVnjdEt24eKSIOuoQZoqLSdIWUnZDnAucNA/WNDDnhFJFvs
 XQ9u+xan4EH3Ox3JXCPkvzQVsp8yjFZMqC7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9F4ViBP1B5lwRe2e2GOjDx7R3bqEzOXyftxCKevZkTo=;
 b=HkyOrcmkEuW8K1GZygKERzzLNyIOzdz33QH+kG90eNUvNIdmLIBkIaSCteHFktDz4S
 ihOY0IyqU4dxZF5oXv3p7NMSXqL2ySqU46n4ie7e6torbRqyTpBKWdevKXnPBOAq4ES8
 OZRdpTwtaGIuY2RJlGXgU0jPJwC9C6S1I8cg0t/3Vqaldc+9QP2q9f1phEPm41YlHYrz
 gbqZBvlD97bRbT38hkhEokG74z1XpAU5kXVr466wTDVQrdL/M3AolJdgNNVijnNYpoQm
 e6nxEFuIZvgBUVo2s2nGwEIdIzaKbpV1UZfhE17iBRlV2zjjKc8TJBAiC5/mn5lsSJAn
 2y6A==
X-Gm-Message-State: AOAM533JPAjzBcRE6KmHDYCM9IFa9uNQ/oUbM1zT94B/HKgAOIHVJDJk
 EliEJeHKDOv27IXvpXWSPU9KsuHKvxv08V3rXQdidw==
X-Google-Smtp-Source: ABdhPJy9Jcxm6UCGAvjnJS200A66cR1gcelPmdS+jYEZAoTEUiln8LGRS79Rzd5M4yf03+OIX6kjS8zcPbz4n4TeoO8=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr238562oif.63.1650051670191; Fri, 15 Apr
 2022 12:41:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Apr 2022 12:41:09 -0700
MIME-Version: 1.0
In-Reply-To: <1650049782-8421-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650049782-8421-1-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 15 Apr 2022 12:41:09 -0700
Message-ID: <CAE-0n51MLxEoBegCj1eR2ee=ZP6cDqmp5tUAu+RM4XycNn3=mw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unused hotplug and edid
 macros from msm_drv.h
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-04-15 12:09:42)
> Remove unused MSM_DISPLAY_CAP_HOT_PLUG and MSM_DISPLAY_CAP_EDID
> macros from msm_drv.h.
>
> Even if we need these, there are drm equivalent ones present.
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
