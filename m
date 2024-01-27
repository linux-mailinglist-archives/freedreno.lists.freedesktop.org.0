Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4983E9E5
	for <lists+freedreno@lfdr.de>; Sat, 27 Jan 2024 03:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909941121AA;
	Sat, 27 Jan 2024 02:42:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75E31121AA
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jan 2024 02:42:01 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc221f01302so1005197276.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 18:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706323261; x=1706928061; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hUp4R3G5K0b0qFLHcr/cOpx+NS8Mc1cXrSzXsFHbacA=;
 b=lWOAs0/Se8KpdBgxO1DZV1/FL2DsTSaX8PcDygSCHcH6U7yVaRcxsaIsYVSPYwtEUz
 GajWfmk73X5M2kfeOgR+/3WjZ2Rws75JouaQ8NMc13OsQ0b0IK8qq7POEW8UnMwRcwEw
 knjW4SReNbIfNtqhuZKy1nomxBHcgZ+nbR4XM7wx7wYhUQUyb8XVRzvRLSaUWnIpTWOY
 mG03rcggIJ01jTX219jfS098ab1TVxy4V+oUYQvvQVozn2P7ZeGGTRCpNdm91u+NU3dT
 Ibd6/muumzA5APulqf/cPfj/2ivzevEwb5F8CvyqbjYtoJlWU2FVh86JTrK5OUEvU9Uh
 R7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706323261; x=1706928061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUp4R3G5K0b0qFLHcr/cOpx+NS8Mc1cXrSzXsFHbacA=;
 b=soZvlII1W3jyyNf4HjNwaoNkeISbZHnoku7zltTY0Kr8nBhzo1BBgYewBdRA5W8I3/
 hJ4P9fqPe4gVsgJPQzzYCZVG1t23D+1OptLBMHJcCwPXRolgGIN8hFKugVqithG2Pw09
 hp5RlM+OXCmnk/WnQU/YITZcapHSUxUMlVuEv0E+zEkAm/v85aknHCQBB3J1RC/g9Qz+
 wgF81avxDbx5zcX3D3PvIdgkAzOIw2j0+9h26I2on/f8FjOXgF0lX5RqygmXvJ3UM36s
 cKOHdAflMhKBBb+61+68kswl8NEUVLKxQTH9Bb0hxZu4nqTCWWpJa8V7ZDgDMkOyGvb+
 VN/Q==
X-Gm-Message-State: AOJu0Yx+YriLhFBXawZdFYqnImEf1wEoOmVlOiw9nu+aiO48sJutRFhd
 /dDGxPS1y0IuLRJB/1wckL4omgz8CZNc1bFk917cIzm3DjaULtjz9qibrxFpZSlEIY9OspvSvcb
 3gn2hUn0kigPsDxCtOyuSjr1UGup7GOgMlPAzhQ==
X-Google-Smtp-Source: AGHT+IFl5KM2DayKQsdqSXm8wP4PvfN+DaW42LO1FrlsiGk4naIA6mberq3SqqU7k1GBpX0iEX7aYWy0MaJPudi3KP0=
X-Received: by 2002:a81:9115:0:b0:5ff:828e:20a with SMTP id
 i21-20020a819115000000b005ff828e020amr1154393ywg.48.1706323260795; Fri, 26
 Jan 2024 18:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com>
 <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
 <1351d4b7-846c-f736-ac17-332291ed8609@quicinc.com>
In-Reply-To: <1351d4b7-846c-f736-ac17-332291ed8609@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 04:40:49 +0200
Message-ID: <CAA8EJpq7OB1=e+K16ZywPj_JU8Z7R2=LKDwrAD1ZFnurwHvC+A@mail.gmail.com>
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 27 Jan 2024 at 02:58, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:23 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> YUV420 format is supported only in the VSC SDP packet and not through
> >> MSA. Hence add an API which indicates the sink support which can be used
> >> by the rest of the DP programming.
> >
> > This API ideally should go to drm/display/drm_dp_helper.c
> I'm not familiar how other vendors are checking if VSC SDP is supported.
> So in moving this API, I'm going to let the other vendors make the
> changes themselves.

Let me show it for you:

bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
{
        u8 dprx = 0;

        if (drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
                              &dprx) != 1)
                return false;
        return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
}


> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> >>   drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>   3 files changed, 34 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index ddac55f45a722..f6b3b6ca242f8 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge
> >> *drm_bridge,
> >>           !!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> >>         dp_display->dp_mode.out_fmt_is_yuv_420 =
> >> - drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> >> + drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> >> +        dp_panel_vsc_sdp_supported(dp_display->panel);
> >>         /* populate wide_bus_support to different layers */
> >>       dp_display->ctrl->wide_bus_en =
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 127f6af995cd1..af7820b6d35ec 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -17,6 +17,9 @@ struct dp_panel_private {
> >>       struct dp_link *link;
> >>       struct dp_catalog *catalog;
> >>       bool panel_on;
> >> +    bool vsc_supported;
> >> +    u8 major;
> >> +    u8 minor;
> >>   };
> >>     static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> >> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct
> >> dp_panel_private *panel)
> >>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
> >>   {
> >>       int rc;
> >> +    ssize_t rlen;
> >>       struct dp_panel_private *panel;
> >>       struct dp_link_info *link_info;
> >> -    u8 *dpcd, major, minor;
> >> +    u8 *dpcd, rx_feature;
> >>         panel = container_of(dp_panel, struct dp_panel_private,
> >> dp_panel);
> >>       dpcd = dp_panel->dpcd;
> >> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel
> >> *dp_panel)
> >>       if (rc)
> >>           return rc;
> >>   +    rlen = drm_dp_dpcd_read(panel->aux,
> >> DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
> >> +    if (rlen != 1) {
> >> +        panel->vsc_supported = false;
> >> +        pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> >> +    } else {
> >> +        panel->vsc_supported = !!(rx_feature &
> >> DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> >> +        pr_debug("vsc=%d\n", panel->vsc_supported);
> >> +    }
> >> +
> >>       link_info = &dp_panel->link_info;
> >>       link_info->revision = dpcd[DP_DPCD_REV];
> >> -    major = (link_info->revision >> 4) & 0x0f;
> >> -    minor = link_info->revision & 0x0f;
> >> +    panel->major = (link_info->revision >> 4) & 0x0f;
> >> +    panel->minor = link_info->revision & 0x0f;
> >>         link_info->rate = drm_dp_max_link_rate(dpcd);
> >>       link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> >> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel
> >> *dp_panel)
> >>       if (link_info->rate > dp_panel->max_dp_link_rate)
> >>           link_info->rate = dp_panel->max_dp_link_rate;
> >>   -    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >> +    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major,
> >> panel->minor);
> >>       drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>       drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >> link_info->num_lanes);
> >>   @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel
> >> *dp_panel, bool enable)
> >>       dp_catalog_panel_tpg_enable(catalog,
> >> &panel->dp_panel.dp_mode.drm_mode);
> >>   }
> >>   +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
> >> +{
> >> +    struct dp_panel_private *panel;
> >> +
> >> +    if (!dp_panel) {
> >> +        pr_err("invalid input\n");
> >> +        return false;
> >> +    }
> >> +
> >> +    panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >> +
> >> +    return panel->major >= 1 && panel->minor >= 3 &&
> >> panel->vsc_supported;

Anyway, this check is incorrect. Please compare the whole revision
against DP_DPCD_REV_13 instead of doing a maj/min comparison.

> >> +}
> >> +
> >>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>   {
> >>       struct dp_catalog *catalog;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h
> >> b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> index 6ec68be9f2366..590eca5ce304b 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
> >>           struct drm_connector *connector);
> >>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
> >>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> >> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
> >>     /**
> >>    * is_link_rate_valid() - validates the link rate
> >



-- 
With best wishes
Dmitry
