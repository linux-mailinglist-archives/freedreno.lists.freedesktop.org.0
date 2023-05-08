Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CB6FBA34
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 23:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809F10E068;
	Mon,  8 May 2023 21:48:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF110E068
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 21:48:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E642F3F409;
 Mon,  8 May 2023 23:48:00 +0200 (CEST)
Date: Mon, 8 May 2023 23:47:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fb6lhe5ure5jpzorvjb7zjz65qiso5yz476ir6apfb4mehyj2s@uk4s3pzeu4uv>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <a5748e3d-3f8d-b1ff-c40b-ee40dcfe6f2e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5748e3d-3f8d-b1ff-c40b-ee40dcfe6f2e@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: Add
 DPU_INTF_DATA_COMPRESS feature flag
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-07 22:21:35, Dmitry Baryshkov wrote:
<snip>
> > Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
> > to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
> > erroneously also receive this feature flag and write the new
> > DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).
> 
> Yeah, that's why I had the idea of including at least the DPU major in 
> the mask name.

Yes please, that would be much more clear.  We could even drop the SoC
name altogether.

> It looks like we should enable DPU_DATA_HCTL_EN at least for 
> sm8150/sm8250 (and other DPU 6.x) too. I am not sure if it is present on 
> sdm845.

Agreed, thanks for sending that patch!

<snip>

- Marijn
