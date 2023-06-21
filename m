Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46C738FB5
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 21:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F82210E34F;
	Wed, 21 Jun 2023 19:12:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E43510E34F
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 19:12:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1E6B2200E2;
 Wed, 21 Jun 2023 21:12:35 +0200 (CEST)
Date: Wed, 21 Jun 2023 21:12:33 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <kyu4ho6mf4jkccqxevlcd65aqxz2zwvze24f3qm7cbq4idk6ua@oownvgek6hwp>
References: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v4 0/2] retrieve DSI DSC through priv-dsi[0]
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-21 09:18:16, Kuogee Hsieh wrote:
> moving retrieving struct drm_dsc_cofnig from setup_display to
> atomic_enable() and delete struct drm_dsc_config from
> struct msm_display_info.

Abhinav suggested to reword this for clarity in v3, but none of that
seems to have made it through?

- Marijn

> Kuogee Hsieh (2):
>   drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
>   drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 --
>  3 files changed, 26 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 
