Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F16E9CA6
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 21:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75E610E2E8;
	Thu, 20 Apr 2023 19:48:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BB310E203
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 19:48:24 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E936720540;
 Thu, 20 Apr 2023 21:48:20 +0200 (CEST)
Date: Thu, 20 Apr 2023 21:48:18 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <enkpndd2yc5uke2zwjpu372my7ql4t6o2edvnkamaq7kqgcdlw@kumof55foww4>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
 <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-20 21:01:04, Dmitry Baryshkov wrote:
> On 20/04/2023 04:36, Konrad Dybcio wrote:
> > 
> > 
> > On 20.04.2023 03:28, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
> >>>
> >>>
> >>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
> >>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
> >>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
> >>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
> >>>>> more, but none of them are supported upstream.
> >>>>>
> >>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
> >>>>
> >>>> Does this mean that we will see gamma_lut support soon?
> >>> No promises, my plate is not even full, it's beyond overflowing! :P
> >>>
> >>> Konrad
> >>
> >> So I think I wrote about this before during the catalog rework/fixes that the gc registers are not written to / programmed.
> >>
> >> If thats not done, is there any benefit to this series?
> > Completeness and preparation for the code itself, if nothing else?
> 
> The usual problem is that if something is not put to use, it quickly 
> rots or becomes misused for newer platforms. We have seen this with the 
> some of DPU features.
> 
> In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we 
> have three options:
> - drop the unused GC from msm8998_sblk.
> - keep things as is, single unused GC entry
> - fill all the sblk with the correct information in hope that it stays 
> correct
> 
> Each of these options has its own drawbacks. I have slight bias towards 
> the last option, to have the information in place (as long as it is 
> accurate).

Normally I'm all for rigorously and completely defining the hardware,
porting the entire downstream DT in one go while looking at it anyway.
(And it leaves less room for error when looking at DT properties while
 having no clue where they should end up in the catalog, or why they
 wouldn't be there)

In this case though, as you say, it's unused so there's no way to test
and validate anything, especially future changes we **might** make to
the looks and layout of the catalog.

What's worse, this series shows zero efforts towards at the very least
explaining that GC is the Gamma Correction block, what the benefits are
in defining/having it, and that it is currently not used by the DSPP
driver block at all.  That's my major reason for NAK'ing this.

- Marijn
