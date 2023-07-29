Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4847680FA
	for <lists+freedreno@lfdr.de>; Sat, 29 Jul 2023 20:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA2610E0E8;
	Sat, 29 Jul 2023 18:31:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039F610E0F8
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:31:39 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 83F1E3F261;
 Sat, 29 Jul 2023 20:31:37 +0200 (CEST)
Date: Sat, 29 Jul 2023 20:31:36 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
 <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-07-29 02:59:32, Dmitry Baryshkov wrote:
> On 27/07/2023 23:03, Marijn Suijten wrote:
> > On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
> >> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> >> Rather than checking for the flag, check for the presense of the
> >> corresponding interrupt line.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > That's a smart use of the interrupt field.  I both like it, and I do
> > not.  While we didn't do any validation for consistency previously, this
> > means we now have multiple ways of controlling available "features":
> > 
> > - Feature flags on hardware blocks;
> > - Presence of certain IRQs;
> > - DPU core revision.
> 
> I hesitated here too. For INTF it is clear that there is no other good 
> way to check for the TE feature. For PP we can just check for the DPU 
> revision.

For both we could additionally check the DPU revision, and for INTF we
could check for TYPE_DSI.  Both would aid in extra validation, if we
require the IRQ to be present or absent under these conditions.

It might also help to document this, either here and on the respective
struct fields so that catalog implementers know when they should supply
or leave out an IRQ?

- Marijn

> > Maybe that is more confusing to follow?  Regardless of that I'm
> > convinced that this patch does what it's supposed to and gets rid of
> > some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
> > feature could alleviate the above concerns thoo.  Hence:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> index 9298c166b213..912a3bdf8ad4 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
> >>   	c->idx = cfg->id;
> >>   	c->caps = cfg;
> >>   
> >> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> >> +	if (cfg->intr_rdptr) {
> >>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> >>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> >>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
