Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C479657A4D9
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 19:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB3390FBE;
	Tue, 19 Jul 2022 17:18:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BA990F97
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 17:18:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp17so25993241lfb.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
 b=BuVirQTZTwxHB7H87FJWiywTqDnGatrkPQzw5UHbCPG2g8CTgDMoTYPzdXmc1KYSZA
 zTy3rNxK9hcEWlZ37iUIdgAYI3gp5P0kewuDync6JAXMK25mV3f/+c+smo9PEExXg/f5
 x+Il1343dGqjFsDeOlWvHyG+n+V8E0fgXrD8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
 b=Bbq0IoKUMEiNzdYJusSXmUC7MK9E0q7tkArIDswzO5t1pMxa8WNlwOAVUsvBSMvs3P
 mLvk8IGc0Doa9ENVTCUcvONCWfz9Z7GVpY3xiUgmmJy1ObdgQIV6vV4UMZX9Hep30t0M
 sPh1d/2uaMOa3sRJDLkgxZVR8//wUephypOYHeVh+gKljNe1RUCBOqNX/od8u19YsgDa
 171myRuYyt0uUpaM/CqCcnVI7vYsuVrpVnmW8xP+kDMTGKlRoWCqVCtGgH/J0gUoTL28
 KymREBPJL54csH7dLCQKCcCQ9bt7xsto4Q29c4sZKm6/dnUwwkm/BCUnmkS4bX32g02P
 vqdg==
X-Gm-Message-State: AJIora9eOwyhUrq6PPbmXrSp4u7GbD0Wc6xQXH8OhQ2fmefnXy+tC/EG
 BCmgC41JyJi8t07T7wOtw40zx4q4nqszm75MObc=
X-Google-Smtp-Source: AGRyM1tjaM3u6focnOAmzLZhmWMI6N5wuwgo2+UTxs08qfmR9EAnJVBeLotjbNcng2JqT8WIn46iWQ==
X-Received: by 2002:a05:6512:2609:b0:481:c42:4279 with SMTP id
 bt9-20020a056512260900b004810c424279mr19118085lfb.165.1658251129651; 
 Tue, 19 Jul 2022 10:18:49 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056512118200b0047f8e9826a1sm3312097lfr.31.2022.07.19.10.18.49
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 10:18:49 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id bf9so25923256lfb.13
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 10:18:49 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr27615443wrr.583.1658250775011; Tue, 19
 Jul 2022 10:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
 <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
In-Reply-To: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 10:12:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86:
 support DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 10:23 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Now as the driver does not depend on pdata->connector, add support for
> > attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
>
>  This has been on my list of annoyances for quite some time now. Most
> excellent to have it fixed, thanks!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Tested together with patch #1.
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
>
> Unless someone yells that there's a problem or someone beats me to it,
> I'll plan to land in drm-misc-next sometime next week.

Landed on drm-misc-next:

6e2dc7ac7141 drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
