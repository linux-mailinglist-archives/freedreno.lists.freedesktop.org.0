Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A5886D59
	for <lists+freedreno@lfdr.de>; Fri, 22 Mar 2024 14:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20250112445;
	Fri, 22 Mar 2024 13:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kvr/RG/G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE02112464
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 13:38:15 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso2252359276.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711114695; x=1711719495; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rm06Pm0qxCAJG4WaEyynyhO+EGvdCO+QoEXFmaLzGV8=;
 b=Kvr/RG/GzKb6334V9Moot1wpYLfNUxCpyOnKJuFfJpQT8y2vebL0v0KCYYxXWmmfTA
 bn/PQANo1PF9aNazreg/ml/p7sK/U3tH/uHHWK7T/3BxXV9hwxFHkpT+UVZMOwAGDoxZ
 nNw3KEeDYCBP1t2TR0vd98l7mGHH3uXz2EePWkSz5TJFeoLI7JucYg1ID+Ug/MhFUA5n
 HA5qPBPh2vZV0wCwKMfxf8Hk7yK2aQNeqxFHWSxqTNVbLf3XgGIKv6FOw3ScXBMgXx8K
 m8vdO8eNAUEf5sFnRbW2Jfek8rLoWtmJyfx8ZM7DDkgdpAUVKnirczbXxdz//rTZpMGS
 7+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711114695; x=1711719495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rm06Pm0qxCAJG4WaEyynyhO+EGvdCO+QoEXFmaLzGV8=;
 b=qoaMql7zQgFDRj5QauCjWQbTgxd8XH8DgUrOVlr8Sp/Klv11uIk07vHYzgWT8GXiaN
 8vDloLIqDE1sKRXg0GnQYfoGuE9VEp5XkhIdfrSWqfQhXwQfgN8nLwmiEPokUMxzyRsF
 jIPzV5/vSacwfKqkVE+CpuITJ3TyCOCECXGcTyRQTWYOTR7lV6RS8WZ5Q2neAfgf0pb4
 vyqEVgBdJrtLni8biDHyPQx0WHXCRM6JRcTbIeGUM4dkg/gwKdNFpUokVROZplQQLRYS
 2HSzqz4Y0UNUWdFxJy9AoFZEHcHhH6+nIY+tbetqcXoOxbHMnDiQQWc/atdLPlY/PSEq
 wEcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyeKp1gipAp8gWHsRClHiNEygXpp74wUOzNe8+n8wOfvuWd03V5KRLeDCpOv3aayabbnb8QUb0OdcYVId3dIbqlTkrBNawCSXz12sVFsEG
X-Gm-Message-State: AOJu0YypHo25TimLyaXb3QBFJgbpr57k2BIWzMZyykzGLOW31sMy0Ifq
 R3nwlPJ3qPwmaGJB+0O3EunB5jlYhq6mvxhbx1bwqTEaVVdcA3RluZhHSuK7pH/kgR/S950DLTO
 dKG3S13KIhbt+Bxa5tTkJL0DpbmF+kG47gcSXSg==
X-Google-Smtp-Source: AGHT+IEkmHjU0hm7QDKg5iiD/rL1+CfoGmxy3DO50mPYMlb1WNPLGwILi3SX+SAGciMY2+MIq+t9wX021nQx5hltJ4Q=
X-Received: by 2002:a5b:911:0:b0:dcf:3ef2:6182 with SMTP id
 a17-20020a5b0911000000b00dcf3ef26182mr2103274ybq.0.1711114694919; Fri, 22 Mar
 2024 06:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
 <Zf2JYmm3DEaR8vB5@linaro.org>
In-Reply-To: <Zf2JYmm3DEaR8vB5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:38:03 +0200
Message-ID: <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 22 Mar 2024 at 15:36, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> > On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Instead of relying on different compatibles for eDP and DP, lookup
> > > the panel node in devicetree to figure out the connector type and
> > > then pass on that information to the PHY. External DP is not described
> >
> > Nit: External DP doesn't have a panel described in DT...
> >
>
> Will fix.
>
> > > in DT, therefore, assume it's eDP if panel node is present.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 43 +++++++++++++++++++++++++++++++++----
> > >  1 file changed, 39 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index c4cb82af5c2f..c9763f77c832 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > >         if (IS_ERR(phy))
> > >                 return PTR_ERR(phy);
> > >
> > > +       rc = phy_set_mode_ext(phy, PHY_MODE_DP,
> > > +                             dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
> > > +       if (rc) {
> > > +               DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
> > > +               dp->catalog = NULL;
> > > +               goto error;
> > > +       }
> > > +
> > >         dp->catalog = dp_catalog_get(dev);
> > >         if (IS_ERR(dp->catalog)) {
> > >                 rc = PTR_ERR(dp->catalog);
> > > @@ -734,9 +742,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
> > >                 goto error;
> > >         }
> > >
> > > -       dp->aux = dp_aux_get(dev, dp->catalog,
> > > -                            phy,
> > > -                            dp->dp_display.is_edp);
> > > +       dp->aux = dp_aux_get(dev, dp->catalog, phy, dp->dp_display.is_edp);
> >
> > Unrelated
> >
>
> Yep, will drop the change.
>
> > >         if (IS_ERR(dp->aux)) {
> > >                 rc = PTR_ERR(dp->aux);
> > >                 DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
> > > @@ -1241,6 +1247,35 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> > >         return dp_display_probe_tail(aux->dev);
> > >  }
> > >
> > > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > > +                                        const struct msm_dp_desc *desc)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +       struct device_node *aux_bus;
> > > +       struct device_node *panel;
> > > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > > +
> > > +       /* legacy platforms specify connector type in match data */
> > > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> >
> > misaligned
> >
>
> Sure, will fix.
>
> > > +               return desc->connector_type;
> >
> > Can we drop this part completely?
> >
>
> You mean the whole if clause? How should we handle the legacy approach
> then?

Legacy platforms still have the aux-bus/panel. so they should be
handled by the check below.

>
> > > +
> > > +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> > > +       if (!aux_bus)
> > > +               goto out;
> > > +
> > > +       panel = of_get_child_by_name(aux_bus, "panel");
> > > +       if (!panel)
> > > +               goto out;
> > > +
> > > +       ret = DRM_MODE_CONNECTOR_eDP;
> > > +
> > > +out:
> > > +       of_node_put(panel);
> > > +       of_node_put(aux_bus);
> > > +       return ret;
> > > +}
> > > +
> > >  static int dp_display_probe(struct platform_device *pdev)
> > >  {
> > >         int rc = 0;
> > > @@ -1263,7 +1298,7 @@ static int dp_display_probe(struct platform_device *pdev)
> > >         dp->dp_display.pdev = pdev;
> > >         dp->name = "drm_dp";
> > >         dp->id = desc->id;
> > > -       dp->dp_display.connector_type = desc->connector_type;
> > > +       dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
> > >         dp->wide_bus_supported = desc->wide_bus_supported;
> > >         dp->dp_display.is_edp =
> > >                 (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
