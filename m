Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B66E5119
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A150B10E045;
	Mon, 17 Apr 2023 19:41:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E0D10E045
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 19:41:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B9701F637;
 Mon, 17 Apr 2023 21:41:09 +0200 (CEST)
Date: Mon, 17 Apr 2023 21:41:07 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <5tjwn4p3nkpjuczudipkrvhy63kfzos6x7o7aufwdei7auujcz@oba37opujh5r>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
 <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
 <df059f88-6ff6-5906-58f1-4f6c752c4214@quicinc.com>
 <20230214130636.ldckqgcq6ajph372@SoMainline.org>
 <d514591a-2891-8c2d-2cd4-5af8283748f5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d514591a-2891-8c2d-2cd4-5af8283748f5@quicinc.com>
Subject: Re: [Freedreno] [RFC PATCH 5/7] drm/msm/dpu: Document and enable
 TEAR interrupts on DSI interfaces
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-02-14 09:54:57, Abhinav Kumar wrote:
[..]
> >>>> Just wondering, how were the lengths calculated for the INTF blocks?
> >>>> The values in general seem a little off to me.
> > 
> > These (for MSM8998) have been taken from downstream specifically; my
> > series starts using INTF_STATUS at 0x26C which conveniently is the
> > register right after 0x268, matching the fact that INTF TE and these
> > registers weren't supported/available yet on MSM8998.
> > 
> >>>> For example, I'm looking downstream and it seems to me that the length
> >>>> for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm
> >>>> seeing that length for INTF + tearcheck should be 0x2c4.
> > 
> > There are many different downstream sources and tags with seemingly
> > conflicting/confusing information.  For v2 [2] I've picked the highest
> > register used by the driver which is INTF_TEAR_AUTOREFRESH_CONFIG at
> > 0x2B4 (but there might always be more registers that don't need to be
> > poked at by the driver, but contain magic debug information and the
> > like... those would be useful to capture in the dump going forward).
> > 
> > [2]: https://github.com/SoMainline/linux/commit/2bbc609dd28aa0bd0a2dede20163e521912d0072
> > 
> 
> Not entirely correct.TEAR_AUTOREFRESH_STATUS is at 0x2c0 for sm8350 and 
> sm8450 as well so 0x2b4 is a bit short. DPU code uses autorefresh status 
> today.Esp after your changes it will use the autorefresh status from 
> intf te which is at offset 0x2c0

Revisiting this, I don't see current DPU code nor downstream 5.4 / 5.10
SDE techpack on some of my checkouts use this register, only
INTF_TEAR_AUTOREFRESH_CONFIG at 0x2b4..0x2b7.  Am I missing something
critical here?

> >>> We have discussed INTF lengths in [1]. The current understanding of the
> >>> block lengths can be found at [2]. Please comment there if any of the
> >>> fixed lengths sounds incorrect to you.
> >>>
> >>> [1] https://patchwork.freedesktop.org/patch/522187/
> >>> [2] https://patchwork.freedesktop.org/patch/522227/
> >>>
> >>> [skipped the rest]
> >>>
> >>
> >> Please correct my understanding here, it was agreed to fix intf blocks
> >> to 0x2c4 here https://patchwork.freedesktop.org/patch/522227/ but I dont
> >> see this was merged?
> >>
> >> It was agreed to first land INTF_TE and then add the higher addresses
> > 
> > Seems like it, at least if I interpret [3] correctly.  My series adds a
> > new define that will hardcode _len to 0x2B8 for now, and Dmitry/Konrad
> > can later extend it to whatever is stated by the correct downstream
> > source.
> > 
> 
> Like mentioned above it should be 0x2c0 for intf block.
> 
> If you face any conflicting information in downstream code, you can 
> always check with me on IRC.

Ack, it looks like others landed these changes for me now via the
catalog rework, so I have just rebased and kept the lengths in.

- Marijn
