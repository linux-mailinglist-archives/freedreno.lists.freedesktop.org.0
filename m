Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877C6E9E1D
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 23:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644610E2CC;
	Thu, 20 Apr 2023 21:51:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446E910E2CC;
 Thu, 20 Apr 2023 21:51:39 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B91F320548;
 Thu, 20 Apr 2023 23:51:36 +0200 (CEST)
Date: Thu, 20 Apr 2023 23:51:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fxph57xh3waxv7fpjnmgai4krpgrdxf3bmp2b3vbpgqbmkcy6u@ib3ds6idhgwz>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-11-ef76c877eb97@somainline.org>
 <20fab838-e05b-163d-aa72-bd8235df9f2c@linaro.org>
 <38030486-f08a-33e6-f8d1-3f4de379a75b@linaro.org>
 <3d1b08f0-adf9-8815-46f7-c31b54a7140c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1b08f0-adf9-8815-46f7-c31b54a7140c@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 11/17] drm/msm/dpu: Disable MDP vsync
 source selection on DPU 5.0.0 and above
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

On 2023-04-20 04:03:31, Dmitry Baryshkov wrote:
[..]
> >>>    -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
> >>> +static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
> >>>            struct dpu_vsync_source_cfg *cfg)
> >>
> >> In my opinion _v1 is not really descriptive here. Could you please rename it to dpu_hw_setup_vsync_source_no_vsync_sel() ?
> > v1 refers to the CTL rev 100 a.k.a 1.0.0 a.k.a 1, but that's not
> > yet very well formulated upstream.. if we even need it..

I think v1 just refers to "the first next variant of this function",
similar to how for example Microsoft COM APIs start without a suffix,
then get 1, 2, 3 etc appended as new variants "of the same" trickle in.

> Yeah, but this mdp_top, not the ctl. And for CTL I'd probably rename _v1 
> to _active to follow actual feature name.

Correct, I just got lazily inspired by downstream here.  There it
switches on SDE_MDP_VSYNC_SEL which is based on DPU >= 5.0.0 as
explained in the patch.

> >> Or maybe rename dpu_hw_setup_vsync_source() to dpu_hw_setup_vsync_source_vsync_sel() and drop _v1 from this function.

Maybe add _and_ in there?

> >>
> >> Up to you.

- Marijn
