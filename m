Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45C7117F4
	for <lists+freedreno@lfdr.de>; Thu, 25 May 2023 22:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E02A10E758;
	Thu, 25 May 2023 20:18:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1133110E1A3
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 20:18:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2B1543F696;
 Thu, 25 May 2023 22:18:31 +0200 (CEST)
Date: Thu, 25 May 2023 22:18:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
 <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
Subject: Re: [Freedreno] [PATCH v14 3/9] drm/display/dsc: Add
 drm_dsc_get_bpp_int helper
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-24 15:38:23, Jessica Zhang wrote:
<snip>
> >> +	WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> > 
> > You did not add linux/bug.h back, presumably because Dmitry added
> > another use of WARN_ON_ONCE to this file in a previous series and it
> > compiles fine as the definition trickles in via another header?
> 
> Yep, this compiles fine without any error or warning.

Yes it does, just curious (CC Dmitry) if that is expected/intended: I am
not familiar enough with the current header includes to say for sure.

Dmitry seemed to rely on it already being available in
https://git.kernel.org/torvalds/c/2b470e5531f57c1b9bfa129cca0ee17a2ecd2183
but that could have been an oversight?

- Marijn
