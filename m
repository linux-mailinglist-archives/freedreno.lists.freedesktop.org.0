Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B466B6E2982
	for <lists+freedreno@lfdr.de>; Fri, 14 Apr 2023 19:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E110EE3F;
	Fri, 14 Apr 2023 17:34:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7630F10EE36
 for <freedreno@lists.freedesktop.org>; Fri, 14 Apr 2023 17:34:32 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9C8AC3FA14;
 Fri, 14 Apr 2023 19:34:29 +0200 (CEST)
Date: Fri, 14 Apr 2023 19:34:28 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <6s42sutrd2c6tme46t6tchd6y6wonmpwokseqqz2frkrfext7v@vnv44tzwyva4>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
 <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
 <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
 <e78e576a-2a04-e7ca-f6c4-701d508541ad@quicinc.com>
 <mfzi535qsjtcznwdvgb7qyzk25rcsrkwozah6ji4thqsj73n3m@asybxllomisg>
 <049697ba-d997-62c0-6e21-ffb287ac3100@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <049697ba-d997-62c0-6e21-ffb287ac3100@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: always program dsc active bits
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
 dianders@chromium.org, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-14 08:48:43, Abhinav Kumar wrote:
> 
> On 4/14/2023 12:35 AM, Marijn Suijten wrote:
> > On 2023-04-12 10:33:15, Abhinav Kumar wrote:
> > [..]
> >>> What happens if a device boots without DSC panel connected?  Will
> >>> CTL_DSC_FLUSH be zero and not (unnecessarily, I assume) flush any of the
> >>> DSC blocks?  Or could this flush uninitialized state to the block?
> >>>
> >>
> >> If we bootup without DSC panel connected, the kernel's cfg->dsc will be
> >> 0 and default register value of CTL_DSC_FLUSH will be 0 so it wont flush
> >> any DSC blocks.
> > 
> > Ack, that makes sense.  However, if I connect a DSC panel, then
> > disconnect it (now the register should be non-zero, but cfg->dsc will be
> > zero), and then replug a non-DSC panel multiple times, it'll get flushed
> > every time because we never clear CTL_DSC_FLUSH after that?
> > 
> 
> If we remove it after kernel starts, that issue is there even today 
> without that change because DSI is not a hot-pluggable display so a 
> teardown wont happen when you plug out the panel. How will cfg->dsc be 0 
> then? In that case, its not a valid test as there was no indication to 
> DRM that display was disconnected so we cannot tear it down.

The patch description itself describes hot-pluggable displays, which I
believe is the upcoming DSC support for DP?  You ask how cfg->dsc can
become zero, but this is **exactly** what the patch description
describes, and what this patch is removing the `if` for.  If we are not
allowed to discuss that scenario because it is not currently supported,
neither should we allow to apply this patch.

With that in mind, can you re-answer the question?

- Marijn
