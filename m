Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD4603E67
	for <lists+freedreno@lfdr.de>; Wed, 19 Oct 2022 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C96710EAB9;
	Wed, 19 Oct 2022 09:13:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454A10EAB9
 for <freedreno@lists.freedesktop.org>; Wed, 19 Oct 2022 09:13:47 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3BF2A3F34E;
 Wed, 19 Oct 2022 11:13:42 +0200 (CEST)
Date: Wed, 19 Oct 2022 11:13:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20221019091341.bqkro3zmnojcqvnu@SoMainline.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
 <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
Subject: Re: [Freedreno] [RFC PATCH] drm/msm: lookup the ICC paths in both
 mdp5/dpu and mdss devices
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2022-08-26 12:16:40, Dmitry Baryshkov wrote:
> On 05/08/2022 15:24, Marijn Suijten wrote:
> > On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
> >> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
> >> components") changed the MDP5 driver to look for the interconnect paths
> >> in the MDSS device rather than in the MDP5 device itself. This was left
> >> unnoticed since on my testing devices the interconnects probably didn't
> >> reach the sync state.
> >>
> >> Rather than just using the MDP5 device for ICC path lookups for the MDP5
> >> devices, introduce an additional helper to check both MDP5/DPU and MDSS
> >> nodes. This will be helpful for the MDP5->DPU conversion, since the
> >> driver will have to check both nodes.
> >>
> >> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> >> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
> > 
> > But I'm not sure about giving my Reviewed-by to this, as I'd rather
> > *correct* the DT bindings for sdm630 and msm8996 to provide
> > interconnects in the MDSS node unless there are strong reasons not to
> > (and I don't consider "backwards compatibility" to be one, this binding
> > "never even existed" if mdp5.txt is to be believed).
> 
> As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu 
> device node. In the end, the interconnects describe the path between the 
> display controller and the DDR, not the path between the whole MDSS and DDR.
> 
> So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe 
> even move existing inerconnects to the dpu node).

Sure.  In that case, do you want to rework this patch / code again to
only look in the DPU/MDP, and not at MDSS at all?  (Or is that another
DT API break we'd rather not make?)

- Marijn
