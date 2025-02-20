Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF10A3DFC7
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 17:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E5010E15D;
	Thu, 20 Feb 2025 16:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ruFxtKjj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03D10E161
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 16:06:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-546202d633dso1180448e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 08:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740067564; x=1740672364; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MkkB90jz+wMakqJRXGQ1C6qQcAHn7eE+AZf1sKmMuTw=;
 b=ruFxtKjjASW4hdVDUJ4GnpxI9OGNtj3mGmTfZ3Aqa2TW1UO6lOFWW5jLT30XALyZAn
 MVaXYClZnYIdqodjIok+1l1NFn2IOqfBpNqqrjNIMidovNakzSX6n77XyhMEtihYvHIl
 6oHxDHXHDzo7CoDvR2tN0SA8CkzELK8ZZl0C6CZ9XiE3OSQSQ6YYI81UEKN+5N5Fe5R/
 +uDkuTrldv56JZKRO006Hg+5448LgKIy1BP54eGCO0RZOHom3lB1kI8grQipMSx2Bb++
 Tj/O4vnvyC2Q3oFYn9TeWTxMIrZ8fdrUVAteDZ077BJNYhNWrGwwaFw8+O4nel3TcFLw
 MDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740067564; x=1740672364;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkkB90jz+wMakqJRXGQ1C6qQcAHn7eE+AZf1sKmMuTw=;
 b=prCMWKgF/nnpp2XFFQNDRECNCZhB0+G/H+sH38XiRSwxy6sR30SxF8Oa2BIL1zExtt
 0sH0fQuoqcAjFkhiC2vFPI0JdA9YtYFH3iQAvllFmTrMVYyiRxJNFKdrD0a+46zP10uk
 y+Y98DoEgf/s8Ks7IqdCY/ZsEwk7nLl4/GQ8QuK6XrXyFMtgC54Im/aE/K8bpWhREqyg
 UoJxkx1jSmVWoKd4/PsfiHy4BuF4i1Mx9I7Rh4kwBCXs+v3vSYcGrFR7L0MFVFQnT5te
 3p915foQmSSXvKdBhqH8s+Q/JOzCEiTDMh+u1nO5LQZygFn90CuQqaVHJRkaty0rwkUZ
 zp9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEOca56GhRnUktLYCztgJg8Szw8VcQDWZvHj3ym/Gt/3LvJ2JmAWp9HyL38M3e8cTKadG2pHmveTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxZuY21B2UjWvtri/wWDPZz5bfN4W9RxkfOUgYaicjoxfMvRfL
 Tx6DsVnzyIxMQ2+Cz3uM0oIpwMkvlcrT3Oa+thgXMeNXNxiYBr/8SSoHsU2pXv8=
X-Gm-Gg: ASbGncuNeM4Fo4TCZhvDpcI2iEcWvy5zsrZQTNHog0tZeEyFWfI2lDcz0X9VLvYk82T
 bHRUPdVwPAIcA1R0JS4N2g/TZz4uylqSr6mHIM782bhbRO64Cco9d/GZFU9ZlIk/V1WHxH2kuzR
 /ZOx4wigU3GVe6je2/iha4fu9GIHMVi1h8lbKQe2i267thsEOVseUqfxZ35SVjm+S0LEMy6xHFU
 9Y2iiVDEh3aS1yxvmpCiebQ7wAK6c6P6Ni0gSLHIt6MLnfmfQExt1B+2k9L+qG2c/m+861vQhet
 f2/LlYaj3Mn1Omh+zLqBanyj22Clqh8FIcVWeVeY/NfYiNmE5AZ+HBA04Ll5D5XY5BKY1uU=
X-Google-Smtp-Source: AGHT+IGijbQuJnFDPCWe6HgsMNO3D4A6C28HoopGz6paJ7IRT0n3o5ue7K6hTp+dIyALAFK8rj+fHw==
X-Received: by 2002:a05:6512:3dab:b0:545:d72:95e5 with SMTP id
 2adb3069b0e04-5452fe2e42cmr8354282e87.7.1740067564235; 
 Thu, 20 Feb 2025 08:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5482a61ac5dsm252e87.212.2025.02.20.08.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:06:03 -0800 (PST)
Date: Thu, 20 Feb 2025 18:06:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Message-ID: <m7brftsrxdikfeumbjkubeeleezka7mwjbchxefqgs4ybtca5n@ge3ay2olagq2>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
 <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
 <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
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

On Thu, Feb 20, 2025 at 11:42:28PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:39写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> > > There is dual DSI case that every DSI link is connected to an independent
> > > panel. In this dual panel case, the frame width for DSC on each link should
> > > be halved to support the usage case.
> >
> > Isn't it the case for the DSI panel utilizing two DSI links?
> 
> The added case here is 2 DSI panel utilizing two DSI links, 1 DSI link
> in each panel.
> I assume default case is 1 panel with 2 DSI link, such as Marijn's case.

So it should be halved in your case, but not in Marijn's case? I can
suspect that if you are describing two DSI panels as a single instance,
you should also adjust drm_dsc_config accordingly (on the panel's side?)

Maybe drm_dsc_config.pic_width and drm_dsc_config.pic_height should be
set on the panel's side? But then, how will that function for the DSI
panels or bridges which can change the mode?

> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
> > >  3 files changed, 19 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> > > index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ced60194042d9dd8d05 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > > @@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
> > >  void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
> > >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >                       struct msm_dsi_phy_shared_timings *phy_shared_timings,
> > > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy);
> > > +                     bool is_bonded_dsi, bool is_dual_panel,
> > > +                     struct msm_dsi_phy *phy);
> > >  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
> > >  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> > >                                 const struct drm_display_mode *mode);
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a7745492bf16649b3197b 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> > >       }
> > >  }
> > >
> > > -static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > > +static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi,
> > > +                          bool is_dual_panel)
> > >  {
> > >       struct drm_display_mode *mode = msm_host->mode;
> > >       u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
> > > @@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >                       return;
> > >               }
> > >
> > > -             dsc->pic_width = mode->hdisplay;
> > > +             if (is_dual_panel)
> > > +                     dsc->pic_width = hdisplay;
> > > +             else
> > > +                     dsc->pic_width = mode->hdisplay;
> > >               dsc->pic_height = mode->vdisplay;
> > >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> > >
> > > @@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
> > >
> > >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >                       struct msm_dsi_phy_shared_timings *phy_shared_timings,
> > > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy)
> > > +                     bool is_bonded_dsi, bool is_dual_panel,
> > > +                     struct msm_dsi_phy *phy)
> > >  {
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > >       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> > > @@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >               goto fail_disable_clk;
> > >       }
> > >
> > > -     dsi_timing_setup(msm_host, is_bonded_dsi);
> > > +     dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
> > >       dsi_sw_reset(msm_host);
> > >       dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3088b793d322a3527c 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -24,6 +24,7 @@ struct msm_dsi_manager {
> > >       struct msm_dsi *dsi[DSI_MAX];
> > >
> > >       bool is_bonded_dsi;
> > > +     bool is_dual_panel;
> > >       bool is_sync_needed;
> > >       int master_dsi_link_id;
> > >  };
> > > @@ -31,6 +32,7 @@ struct msm_dsi_manager {
> > >  static struct msm_dsi_manager msm_dsim_glb;
> > >
> > >  #define IS_BONDED_DSI()              (msm_dsim_glb.is_bonded_dsi)
> > > +#define IS_DUAL_PANEL()              (msm_dsim_glb.is_dual_panel)
> > >  #define IS_SYNC_NEEDED()     (msm_dsim_glb.is_sync_needed)
> > >  #define IS_MASTER_DSI_LINK(id)       (msm_dsim_glb.master_dsi_link_id == id)
> > >
> > > @@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, int id)
> > >               msm_dsim->is_bonded_dsi = of_property_read_bool(np, "qcom,dual-dsi-mode");
> > >
> > >       if (msm_dsim->is_bonded_dsi) {
> > > +             msm_dsim->is_dual_panel = of_property_read_bool(np, "qcom,dual-panel");
> > >               if (of_property_read_bool(np, "qcom,master-dsi"))
> > >                       msm_dsim->master_dsi_link_id = id;
> > >               if (!msm_dsim->is_sync_needed)
> > > @@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >       struct mipi_dsi_host *host = msm_dsi->host;
> > >       struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
> > >       bool is_bonded_dsi = IS_BONDED_DSI();
> > > +     bool is_dual_panel = IS_DUAL_PANEL();
> > >       int ret;
> > >
> > >       DBG("id=%d", id);
> > > @@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >       if (ret)
> > >               goto phy_en_fail;
> > >
> > > -     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_bonded_dsi, msm_dsi->phy);
> > > +     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> > > +                                 is_bonded_dsi, is_dual_panel, msm_dsi->phy);
> > >       if (ret) {
> > >               pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
> > >               goto host_on_fail;
> > > @@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >
> > >       if (is_bonded_dsi && msm_dsi1) {
> > >               ret = msm_dsi_host_power_on(msm_dsi1->host,
> > > -                             &phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
> > > +                             &phy_shared_timings[DSI_1], is_bonded_dsi,
> > > +                             is_dual_panel, msm_dsi1->phy);
> > >               if (ret) {
> > >                       pr_err("%s: power on host1 failed, %d\n",
> > >                                                       __func__, ret);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
