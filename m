Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8148714F
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 04:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E61D10FBE4;
	Fri,  7 Jan 2022 03:42:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C8510FBE4
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 03:42:49 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 p8-20020a9d7448000000b005907304d0c5so5330310otk.6
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 19:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
 b=A4vFqWQX/ciKAiD3rBShIXkWQ6We8v4r2Eq9/XAa+FPBuF3IeORe3y2KvbSOTCPnjw
 iAGFljIBOl02LecccSX5kLGEEvuzOT6EpaOm1G18YR1Vmq5Ln/HKIE4UjgNB3yshm7V0
 KZ9ATLayI5c35/38nQyFWM/g3/XMRBmWUHfPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NWwd6X+cONdHPrAA1ssFoRdo6O/Kd5Hv3y1+Epowixk=;
 b=ZCMpCJwxiS8UF4cdga/X6p1HbFKI4bGfFeajFwz2uAd6zzxWiqwcMJ2omS1BadYQQR
 cWBm8i/T+ssbRAjBTxF/Hz683iU4yfB4A/dE38zX4Ie7iBWsJjHmd0bL+lf+OdaqvJCn
 ebqix8gurouXo8LCVjgJK5PdbbWknIdsvMHZi8pbdOnwHkOqGYfIr7yU06Mo8U3s5uTy
 fv3HboJjEA1rkpmTKKUUHPqH6jN6u0hpIT/lnMJUPWzzo8XDijfLYqAE5cRS8S5iqQ/g
 P9ZLq+3LAVrdgLG/0eBpXMAEpcwFV0yt0AzpnRJ4nbKTRYej8hu3pn0i1sMsVayAcsgJ
 cf6g==
X-Gm-Message-State: AOAM533QdKVgP51Czuagd3vSHcTPExZ6xKSkukjVckH4LwW/67YLxQWv
 rNBmH6lh7aTGLedno8IXOUXyhhZdkPMAaYXvrEEjTg==
X-Google-Smtp-Source: ABdhPJzf0n9XHktPj8J7s6+dZI2ZyKcsrJQi3oL20SOcD4s8ZaFysAcZ4/L+0HgoBgdkZi/UIdAlzTNykWoLYPJTt/k=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr4225674ote.77.1641526968813;
 Thu, 06 Jan 2022 19:42:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:42:48 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 19:42:48 -0800
Message-ID: <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 2/7] drm/msm/dp: support attaching
 bridges to the DP encoder
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

Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
> Currently DP driver will allocate panel bridge for eDP panels.
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
>  5 files changed, 13 insertions(+), 23 deletions(-)

I like this one, it certainly makes it easier to understand.

> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23f742b..5de21f3d0812 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>         if (rc)
>                 return rc;
>
> -       if (connector_type == DRM_MODE_CONNECTOR_eDP) {

It feels like this is on purpose, but I don't see any comment so I have
no idea. I think qcom folks are concerned about changing how not eDP
works. I'll have to test it out locally.

> -               rc = dp_parser_find_panel(parser);
> -               if (rc)
> -                       return rc;
> -       }
> +       rc = dp_parser_find_next_bridge(parser);
> +       if (rc)
> +               return rc;
>
>         /* Map the corresponding regulator information according to
>          * version. Currently, since we only have one supported platform,
