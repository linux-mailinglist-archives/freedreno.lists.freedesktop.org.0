Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A56485CC5
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 01:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CA110E4D8;
	Thu,  6 Jan 2022 00:03:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61110E4DE
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jan 2022 00:03:05 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m2so1070516qkd.8
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 16:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
 b=WZSBpVwh3QTZfHBZLV54czxSDHcNrFDD00XjYyiQ2Ka0nqTU3wAFileKOC0v2xWY3F
 aYi4Ljg9ZJ5sZ0uCtB2FGIsbQ93KsMfvFApEF9mplhGmhQkMBEvI0OYcS4Lx1xCHCEJD
 qMJKxW7PKiWXujlSeqZBy4CT6x5stkKE2gEwjEaPLyAuvS5myEtG6eGJccGTEanGwDCU
 CF4FXMTGJutk/aEv8WS90+JA9xE2WhN7tZ0Mr7SjgK2zgj4Jgupn3jzjLHGcRgtFy6SK
 0DQnyL5RWLYfDn+zf16qdI7qauoNx1hue19JXGopxYDaQorZ4awyZT4sfyll5CWgKZ+5
 jXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
 b=gv4anwgNseU3bRSo80gtf9b6H0qFhvVq79Ke1B5wgeieTPZmX7g6ncXyh/5snQxEiC
 JZ0V15cyrPzcoAFkcD6KCk1dKBfn/vEMYQOuUzvaR2K1rx/2MWhG4UgVXHKBqSATliwg
 WNPuMjgKkzejCZjPN49PbkPnY4I1bOTG1u3sHmWCS2T5raeTUaLrt4aXRoKahEm6P6eB
 dciq/71/ddxnweVg35sN5nxgMAFrEDVPOvprRtc/EfNwlOMtuPrIWT2WfNaQH54d176t
 GdX+UEYqMb5Or+ljeVTupqbgkWAXXYRirc+VbVzRb86CeCD4srUPRdxy00A2M4H5reiH
 5KzQ==
X-Gm-Message-State: AOAM5328xKSf8Hv627X4UtgRFAnPDN3/hzfzwm+0GgT0pq366l3a/KP7
 8JRkWnaJZVysLJnHlXFr/4WLDdM1uKrYCz+ezu7QcA==
X-Google-Smtp-Source: ABdhPJy/OoApJncON5r6kNBonHzIlP9P6S23pAbv4nLVXCuC80zPXDfcJ33V7h0DY405MSua4DBRdlVX+QeRcw+KvA0=
X-Received: by 2002:a37:b8b:: with SMTP id 133mr38079500qkl.59.1641427384486; 
 Wed, 05 Jan 2022 16:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
 <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
In-Reply-To: <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jan 2022 03:02:53 +0300
Message-ID: <CAA8EJppodnj9sW1oyXu8POd2Evkqz0vuNLmz5v8RYw+Ww-rpCA@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm: move msm_readl/_writel to
 msm_drv.h
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 6 Jan 2022 at 02:43, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-05 15:27:00)
> > With the reglog removal, msm_readl/_writel became single line wrappers
> > around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
> > remove need for extra function calls when doing register writes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Any chance this can go further and replace msm_readl/msm_writel with
> readl/writel directly?

This can go on a step-by-step basis. But practically yes. With this
change in place we should be able to drop most of the io wrappers.

-- 
With best wishes
Dmitry
