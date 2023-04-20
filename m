Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3DE6E9E15
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 23:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392010E2CC;
	Thu, 20 Apr 2023 21:47:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5334510E2CC
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 21:47:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 39341205A5;
 Thu, 20 Apr 2023 23:47:03 +0200 (CEST)
Date: Thu, 20 Apr 2023 23:47:02 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3njpny4lxaexyrcpcpbvbiampqdcgc3nbrmvwxmfmin2esweat@oysuxu6b4iks>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-7-ef76c877eb97@somainline.org>
 <f9e8a86f-3c69-4fda-01b9-2d4cd261bee8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e8a86f-3c69-4fda-01b9-2d4cd261bee8@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 07/17] drm/msm/dpu: Sort INTF registers
 numerically
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 David Airlie <airlied@gmail.com>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-20 03:47:57, Dmitry Baryshkov wrote:
> On 17/04/2023 23:21, Marijn Suijten wrote:
> > A bunch of registers were appended at the end in e.g. 91143873a05d
> > ("drm/msm/dpu: Add MISR register support for interface") rather than
> > being inserted in a place that maintains numerical sorting.  Restore
> > that.
> 
> Assuming that = "sort order":

This is what I mean(t) to say, but not what I meant to write.  See the
previous sentence: "restore that" refers to "numerical sorting" (not
just "sort order") right before.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> If I don't forget, I'll fix it when applying.

If you feel the above explanation is inadequate, feel free to replace
the sentence with "Restore said numerical sorting".

- Marijn

> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> 
> 
> -- 
> With best wishes
> Dmitry
> 
