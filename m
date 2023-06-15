Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F87318ED
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6886310E195;
	Thu, 15 Jun 2023 12:25:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8897D10E18C
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 12:25:42 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4F5AF3FB06;
 Thu, 15 Jun 2023 14:25:37 +0200 (CEST)
Date: Thu, 15 Jun 2023 14:25:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <m4q4atgpxgl765ct432bqn6apw5z2hjouplawhckxd6s2sf4y5@nkfz72etdjah>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <168682860387.384026.9115594076193676039.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168682860387.384026.9115594076193676039.b4-ty@linaro.org>
Subject: Re: [Freedreno] [PATCH v6 0/6] Add DSC v1.2 Support for DSI
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
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-15 14:31:26, Dmitry Baryshkov wrote:
> 
> On Fri, 09 Jun 2023 15:57:12 -0700, Jessica Zhang wrote:
> > This is a series of changes for DSI to enable command mode support
> > for DSC v1.2.
> > 
> > This includes:
> > 
> > 1) Rounding up `hdisplay / 3` in dsc_timing_setup()
> > 2) Adjusting pclk_rate to account for compression
> > 3) Fixing incorrect uses of slice_count in DSI DSC calculations
> > 4) Setting the DATA_COMPRESS bit when DSC is enabled
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] msm/drm/dsi: Round up DSC hdisplay calculation
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/21bf617110ba
> [2/6] drm/msm/dsi: Reduce pclk rate for compression
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/7c9e4a554d4a
> [3/6] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/22598cfc94bb
> [4/6] drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/1642b5803473
> [5/6] drm/msm/dsi: Remove incorrect references to slice_count
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/155fa3a91d64
> 
> Note, patch 6 is skipped for now

Note that we also haven't finished discussions on where the ratio in
patch 2/6 comes from and how that should be outlined in patch 6.
Related to the widebus patches which affect the ratio as well.

- Marijn
