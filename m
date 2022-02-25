Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74194C5164
	for <lists+freedreno@lfdr.de>; Fri, 25 Feb 2022 23:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4B10EB21;
	Fri, 25 Feb 2022 22:17:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15910EB20
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 22:17:42 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j24so8643431oii.11
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 14:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dXvo0FUwxGOK+PzYKSVnOxYz4S+No09K3o4P0/XBEQY=;
 b=Zka9dxzwevyuRP7bh7bB+2VLzJcEohGN+IkaQhrqR9tqMLIIhFDAdgjwyUobMemgHG
 HxbUt/MRrIU5ANvMryCf/IOd5w5VhcWy+QIBZrpdrCO4tJhHOIU/JKKO4sbYy5isTFRF
 SvjEbvOQ88lMyrUNYjFcACdeObaqTYceEfTfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dXvo0FUwxGOK+PzYKSVnOxYz4S+No09K3o4P0/XBEQY=;
 b=o2OnJYE0sAGX7ZyH9VFr1OGOdQklPmwGcDbvyzrJbBej/H3MiB6gkW8ZN0mW3PVvsl
 4SoTKhphBw8WfiXO7KThWOT93InqGDu517a/v3DAnyqusn0maGdD2K9eSPpe65QcFL86
 +uNX3tE06ySpH4Gy9l1sZeqyPPyWx2h0d1LFdmbIugUiHB0u75tbyo4aLDWxaczYY8wG
 BlZoRmcvx5+v8sw8EvCeEMBi1Jrn0sK+bn4EqrkMvLSN8+TQP9TOuJhUhFNr2FDMnd5w
 Lv9CkZHI9IzGloVctXtSDkHkPfsr27VXgJ6u/H/6MugtwN9vg2MnijtG2eQGyKte+I84
 j25A==
X-Gm-Message-State: AOAM531qLpSdEnDhGcvm9M3abrKGspulYolJdd7GWFNTTOMOoaFKHIBM
 b41N3g+Y9UlXh06w6lOzvQ90TTraLDM5wNjpKeuaHQ==
X-Google-Smtp-Source: ABdhPJwZkpsXKtTOoOCmoxhBmLUBoDoC7bnujscOdTuslS997FSPo3U4IMVbsNIzko5zK+fYiQ4P/xGtoL+aut7gVPs=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr3055013oib.32.1645827461436; Fri, 25
 Feb 2022 14:17:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 14:17:41 -0800
MIME-Version: 1.0
In-Reply-To: <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
References: <1645824192-29670-1-git-send-email-quic_khsieh@quicinc.com>
 <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 14:17:40 -0800
Message-ID: <CAE-0n53s11KHrj-rzRkjV4q775XCoxzZCLK-HRCt=H1++DR-YQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v12 4/4] drm/msm/dp: enable widebus feature
 for display port
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-25 13:23:12)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> This feature now is required to be enabled to easy migrant to higher
> resolution applications in future. However since some legacy chipsets
> does not support this feature, this feature is enabled by setting
> wide_bus_en flag to true within msm_dp_desc struct.
>
> changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
> -- enable widebus feature base on chip hardware revision
>
> Changes in v5:
> -- DP_INTF_CONFIG_DATABUS_WIDEN
>
> Changes in v6:
> -- static inline bool msm_dp_wide_bus_enable() in msm_drv.h
>
> Changes in v7:
> -- add Tested-by
>
> Changes in v9:
> -- add wide_bus_en to msm_dp_desc
>
> Changes in v10:
> -- add wide_bus_en boolean to dp_catalog struc to avoid passing it as parameter
>
> Changes in v11:
> -- add const to dp_catalog_hw_revision()
> -- add const to msm_dp_wide_bus_available()
>
> Changes in v12:
> -- dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> -- msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
