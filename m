Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E26EFA9F
	for <lists+freedreno@lfdr.de>; Wed, 26 Apr 2023 21:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841E510EA09;
	Wed, 26 Apr 2023 19:08:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D9210E812
 for <freedreno@lists.freedesktop.org>; Wed, 26 Apr 2023 19:08:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A1F3C3F7C9;
 Wed, 26 Apr 2023 21:08:29 +0200 (CEST)
Date: Wed, 26 Apr 2023 21:08:28 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <vwejuayy7ulq3frpqpqetkyhyefgrmgo6222how4hp4bissepx@uauvwlhsekgn>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-6-693b17fe6500@somainline.org>
 <d44022e0-bc09-122e-5a48-1994cb025ba8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44022e0-bc09-122e-5a48-1994cb025ba8@quicinc.com>
Subject: Re: [Freedreno] [PATCH v3 06/21] drm/msm/dpu: Use V2 DITHER
 PINGPONG sub-block in SM8[34]50/SC8280XP
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
 David Airlie <airlied@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-26 09:24:19, Abhinav Kumar wrote:
> 
> 
> On 4/25/2023 4:05 PM, Marijn Suijten wrote:
> > According to downstream sources this DITHER sub-block sits at an offset
> > of 0xe0 with version 0x20000.  The PP_BLK_DITHER macro is _not_ used as
> > downstream still says the size of the PINGPONG block is 0xd4 and not 0.
> > 
> 
> the PINGPONG block size is 0x0 on sm8350, sm8450 and sc8280xp.
> 
> and length of dither is 0x20 and they all start at 0xe0.
> 
> So now does anything prevent us from using PP_BLK_DITHER macro for these?

Nothing prevents it from being used (if you are referring to our
previous conversations) besides this information not being available in
public DTS (I simply did not know) and the fact that all these many
fixes - however necessary they are - distract from the main topic of
this series: bringing INTF TE support to DPU1.

I'll fit in that patch though, as I have to send v4 anyway.

- Marijn
