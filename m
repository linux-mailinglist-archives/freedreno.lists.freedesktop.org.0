Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B98A3390
	for <lists+freedreno@lfdr.de>; Fri, 12 Apr 2024 18:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A53B10E299;
	Fri, 12 Apr 2024 16:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JWAHd/iQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6710E299
 for <freedreno@lists.freedesktop.org>; Fri, 12 Apr 2024 16:19:41 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso1115090276.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Apr 2024 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712938780; x=1713543580; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sXWmd/wW6yAOCZNpTbTji8xLWInbQYVnfn18RNMYZIU=;
 b=JWAHd/iQsWPtytuAMJaYpvigmfKvbMYGtWA7gcOJjH3c0FKD3boyGbR2OBCCWOIfTM
 0uMCDLk1j1NvXe4u9ggzkR1ssMFmomhJDTe5kJfR2XQCoElr/l6eRQbPOj5LIuCZpYxc
 9PFAfAscWpzlqYK8AeOK+tk8J4FGZPn3lAYZX5s5AmqHoZ1zSyWeevEK+qCmy/mAFLMO
 0eILbGi5hnzaqj1W/RmhEXKYTRUJSWGhq2J1SAKyYPvagm0orynVqSwSrsvqGHQfYR+n
 dwHkVvFWp/uwdPIBNyeAM8wSFcYeHVRaWfkOx1CXs5jbejj8fxsAMquEmfqVOM3VdUUx
 rGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712938780; x=1713543580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXWmd/wW6yAOCZNpTbTji8xLWInbQYVnfn18RNMYZIU=;
 b=RQ+Jbh7ygoUnvuJmiucc/8OLqlmi5B7et3Hor3THdqfGPNdrQL6eeIlS2PTjpj8DYq
 uLQtBUBGNnyGIJO6r+aEsYOuucSQzcxDXJcrMJfuxDK1CZHB8kFD2T1S7u6eMMQruSpG
 0gHc4RMfv+sASJ+ms79UhtqVdwAMBVfSGpEfZZpZ+iktgBlmBNJGYM19XjOCmEY8qEQS
 HPagpKAnr4z/uLijMKOZXwf9+DlCMx2asiZVxFsIwj0cO320M2NSENh3b0IA49P+MJg4
 e9NZ/ELODankuJunEPoKUcloxcyhtcKf/aR9XNsd81p/PjuSuPpdAQMUwgYpHHYAjbxL
 g1Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9uSJKBtn9XkAR940uVsnSYcTZ6cUB0iqdqBIkByX0TqLP+ojB2m2AjArkwGUmN2P/vreoUpIWV9B0Oi0q/a5J0buedeW5f4iUvDWGwgDj
X-Gm-Message-State: AOJu0YykIp/Tav0B/vkk0GxEtsqyNQueNetfI15CSlzLH9UibxEEq3Gl
 VA1R/ZOKMm0ckXnLmixw2C1zcRHgNUkGIngcGdirues5IMZY9TQI/e+2ZKxHE0rpTwfXqxlExOY
 k36HtUq8Zu2ZvrDMtauzp1forZJLMybBEMIeFyQ==
X-Google-Smtp-Source: AGHT+IEqNVrU1E7+mCyG84cbO8h59i2bINsxyaP0WfD9IexHFJ+pdY6S2lQDTnhR6UCiSqnuNOZ12kESOxdIrB1xdko=
X-Received: by 2002:a25:b941:0:b0:dd1:491e:bf0 with SMTP id
 s1-20020a25b941000000b00dd1491e0bf0mr2579657ybm.60.1712938779740; Fri, 12 Apr
 2024 09:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org>
 <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
In-Reply-To: <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 19:19:28 +0300
Message-ID: <CAA8EJpoVb-K_AqDCYTtYJb_aGWO9P2jZ6XCjX7sASxovHr8WUQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/18] drm/msm: generate headers on the fly
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
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

On Fri, 12 Apr 2024 at 19:15, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Dmitry,
>
> On 01/04/2024 03:42, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   2 files changed, 77 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
> > new file mode 100644
> > index 000000000000..9ab870da897d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/.gitignore
> > @@ -0,0 +1 @@
> > +generated/
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 26ed4f443149..c861de58286c 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -1,10 +1,11 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   ccflags-y := -I $(srctree)/$(src)
> > +ccflags-y += -I $(obj)/generated
> >   ccflags-y += -I $(srctree)/$(src)/disp/dpu1
> >   ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
> >   ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
> >
> > -msm-y := \
> > +adreno-y := \
> >       adreno/adreno_device.o \
> >       adreno/adreno_gpu.o \
> >       adreno/a2xx_gpu.o \
> > @@ -18,7 +19,11 @@ msm-y := \
> >       adreno/a6xx_gmu.o \
> >       adreno/a6xx_hfi.o \
> >
> > -msm-$(CONFIG_DRM_MSM_HDMI) += \
> > +adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> > +
> > +adreno-$(CONFIG_DRM_MSM_GPU_STATE)   += adreno/a6xx_gpu_state.o
> > +
> > +msm-display-$(CONFIG_DRM_MSM_HDMI) += \
> >       hdmi/hdmi.o \
> >       hdmi/hdmi_audio.o \
> >       hdmi/hdmi_bridge.o \
> > @@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
> >       hdmi/hdmi_phy_8x74.o \
> >       hdmi/hdmi_pll_8960.o \
> >
> > -msm-$(CONFIG_DRM_MSM_MDP4) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDP4) += \
> >       disp/mdp4/mdp4_crtc.o \
> >       disp/mdp4/mdp4_dsi_encoder.o \
> >       disp/mdp4/mdp4_dtv_encoder.o \
> > @@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
> >       disp/mdp4/mdp4_kms.o \
> >       disp/mdp4/mdp4_plane.o \
> >
> > -msm-$(CONFIG_DRM_MSM_MDP5) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDP5) += \
> >       disp/mdp5/mdp5_cfg.o \
> >       disp/mdp5/mdp5_cmd_encoder.o \
> >       disp/mdp5/mdp5_ctl.o \
> > @@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
> >       disp/mdp5/mdp5_plane.o \
> >       disp/mdp5/mdp5_smp.o \
> >
> > -msm-$(CONFIG_DRM_MSM_DPU) += \
> > +msm-display-$(CONFIG_DRM_MSM_DPU) += \
> >       disp/dpu1/dpu_core_perf.o \
> >       disp/dpu1/dpu_crtc.o \
> >       disp/dpu1/dpu_encoder.o \
> > @@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
> >       disp/dpu1/dpu_vbif.o \
> >       disp/dpu1/dpu_writeback.o
> >
> > -msm-$(CONFIG_DRM_MSM_MDSS) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDSS) += \
> >       msm_mdss.o \
> >
> > -msm-y += \
> > +msm-display-y += \
> >       disp/mdp_format.o \
> >       disp/mdp_kms.o \
> >       disp/msm_disp_snapshot.o \
> >       disp/msm_disp_snapshot_util.o \
> > +
> > +msm-y += \
> >       msm_atomic.o \
> >       msm_atomic_tracepoints.o \
> >       msm_debugfs.o \
> > @@ -115,12 +122,12 @@ msm-y += \
> >       msm_submitqueue.o \
> >       msm_gpu_tracepoints.o \
> >
> > -msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> > -     dp/dp_debug.o
> > +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> >
> > -msm-$(CONFIG_DRM_MSM_GPU_STATE)      += adreno/a6xx_gpu_state.o
> > +msm-display-$(CONFIG_DEBUG_FS) += \
> > +     dp/dp_debug.o
> >
> > -msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> > +msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> >       dp/dp_catalog.o \
> >       dp/dp_ctrl.o \
> >       dp/dp_display.o \
> > @@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> >       dp/dp_audio.o \
> >       dp/dp_utils.o
> >
> > -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> > -
> > -msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> > +msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> >
> > -msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> > +msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> >                       dsi/dsi_cfg.o \
> >                       dsi/dsi_host.o \
> >                       dsi/dsi_manager.o \
> >                       dsi/phy/dsi_phy.o
> >
> > -msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> > -msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> > +
> > +msm-y += $(adreno-y) $(msm-display-y)
> >
> >   obj-$(CONFIG_DRM_MSM)       += msm.o
> > +
> > +quiet_cmd_headergen = GENHDR  $@
> > +      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
> > +
> > +$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
> > +             $(src)/registers/adreno/adreno_common.xml \
> > +             $(src)/registers/adreno/adreno_pm4.xml \
> > +             $(src)/registers/freedreno_copyright.xml \
> > +             $(src)/registers/gen_header.py \
> > +             $(src)/registers/rules-fd.xsd \
> > +             FORCE
> > +     $(call if_changed,headergen)
> > +
> > +$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
> > +             $(src)/registers/freedreno_copyright.xml \
> > +             $(src)/registers/gen_header.py \
> > +             $(src)/registers/rules-fd.xsd \
> > +             FORCE
> > +     $(call if_changed,headergen)
> > +
> > +ADRENO_HEADERS = \
> > +     generated/a2xx.xml.h \
> > +     generated/a3xx.xml.h \
> > +     generated/a4xx.xml.h \
> > +     generated/a5xx.xml.h \
> > +     generated/a6xx.xml.h \
> > +     generated/a6xx_gmu.xml.h \
> > +     generated/adreno_common.xml.h \
> > +     generated/adreno_pm4.xml.h \
> > +
> > +DISPLAY_HEADERS = \
> > +     generated/dsi_phy_7nm.xml.h \
> > +     generated/dsi_phy_10nm.xml.h \
> > +     generated/dsi_phy_14nm.xml.h \
> > +     generated/dsi_phy_20nm.xml.h \
> > +     generated/dsi_phy_28nm_8960.xml.h \
> > +     generated/dsi_phy_28nm.xml.h \
> > +     generated/dsi.xml.h \
> > +     generated/hdmi.xml.h \
> > +     generated/mdp4.xml.h \
> > +     generated/mdp5.xml.h \
> > +     generated/mdp_common.xml.h \
> > +     generated/sfpb.xml.h
> > +
> > +$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > +$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
> > +
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
>
>
> I noticed that some of our builders were failing to build the latest
> -next and it was after this commit that things broke. The builders
> have an older version of python3 and the gen_headers.py script fails
> in a couple places with syntax errors. The following changes
> resolved the issues for python 3.5 ...

Could you please post them as a proper patch?

>
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index 9b2842d4a354..90d5c2991d05 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -323,7 +323,7 @@ class Array(object):
>                          indices = []
>                  if self.length != 1:
>                          if self.fixed_offsets:
> -                               indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
> +                               indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
>                          else:
>                                  indices.append((self.index_ctype(), self.stride, None))
>                  return indices
> @@ -942,7 +942,8 @@ def main():
>          parser.add_argument('--rnn', type=str, required=True)
>          parser.add_argument('--xml', type=str, required=True)
>
> -       subparsers = parser.add_subparsers(required=True)
> +       subparsers = parser.add_subparsers()
> +       subparsers.required = True
>
>
> I know that anything before python 3.8 is now EOL, but I did see a
> similar thread on dri-devel [0] for supporting python 3.6 and so
> wanted to see if there is any objections to the above?

I don't have any objections from my side.

>
> Thanks!
> Jon
>
> [0] https://lore.kernel.org/dri-devel/20240118123752.bl3qss3qbbxgvpdk@suse.de/
>
> --
> nvpublic



-- 
With best wishes
Dmitry
