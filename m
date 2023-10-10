Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5527BF557
	for <lists+freedreno@lfdr.de>; Tue, 10 Oct 2023 10:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788AA10E326;
	Tue, 10 Oct 2023 08:10:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D310E326;
 Tue, 10 Oct 2023 08:10:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5183A1F8B8;
 Tue, 10 Oct 2023 10:10:52 +0200 (CEST)
Date: Tue, 10 Oct 2023 10:10:50 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <dxcfxhqesrauyo5bscwwj5ejrlulsndiewwfahmnhhztj4gil5@vowdkbp5bsqj>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
Subject: Re: [Freedreno] [PATCH RFC 0/5] drm/msm: dpu1: correctly implement
 SSPP & WB Clock Control Split
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-10-09 18:36:11, Neil Armstrong wrote:
> Starting with the SM8550 platform, the SSPP & WB Clock Controls are
> no more in the MDP TOP registers, but in the SSPP & WB register space.
> 
> Add the corresponding SSPP & WB ops and use them from the vbif QoS
> and OT limit setup functions.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (5):
>       drm/msm: dpu1: create a dpu_hw_clk_force_ctrl() helper
>       drm/msm: dpu1: add setup_clk_force_ctrl() op to sspp & wb
>       drm/msm: dpu1: vbif: add dpu_vbif_setup_clk_force_ctrl() helper
>       drm/msm: dpu1: call wb & sspp clk_force_ctrl op if split clock control
>       drm/msm: dpu1: sm8550: move split clock controls to sspp entries

Fyi we're all using drm/msm/dpu: now :)

- Marijn

> 
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 35 +++++++++-----------
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  9 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  9 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         | 23 +------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        | 21 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  9 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  9 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 38 +++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           | 12 ++++---
>  13 files changed, 120 insertions(+), 61 deletions(-)
> ---
> base-commit: 9119cf579b4432b36be9d33a92f4331922067d92
> change-id: 20231009-topic-sm8550-graphics-sspp-split-clk-43c32e37b6aa
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 
