Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDE6FEBA3
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 08:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3742110E5A5;
	Thu, 11 May 2023 06:18:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D16710E5A5
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 06:18:10 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DFAF32030C;
 Thu, 11 May 2023 08:18:07 +0200 (CEST)
Date: Thu, 11 May 2023 08:18:06 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <mbiijomkmkrwixpbg2rnpv3hb5y7gnsqqv2rkektgh4xvxig6u@iazy42chd7b5>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
 <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
 <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
Subject: Re: [Freedreno] [PATCH v7 2/8] drm/display/dsc: add helper to set
 semi-const parameters
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-11 07:26:28, Dmitry Baryshkov wrote:
> On 11/05/2023 01:35, Jessica Zhang wrote:
> > 
> > 
> > On 5/9/2023 11:29 PM, Marijn Suijten wrote:
> >> On 2023-05-09 15:06:48, Jessica Zhang wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add a helper setting config values which are typically constant across
> >>> operating modes (table E-4 of the standard) and mux_word_size (which is
> >>> a const according to 3.5.2).
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >> Same question about ordering.
> > 
> > Hi Marijn,
> > 
> > This patch was authored by Dmitry and originally part of his DRM DSC 
> > helpers series [1], but was removed from that series for mergeability 
> > reasons.
> > 
> > Looking over the kernel documentation, the last Signed-off-by should be 
> > from the patch submitter [2], so I think my s-o-b tag should be at the 
> > bottom.

That's true, but I also think the S-o-B at the top should match the
 From: author.

> > As for the order in the previous patch, I can add a duplicate s-o-b 
> > before Dmitry's so that it reflects the history of the patch.
> 
> I think this is an overkill. Instead you can drop my SOB from the patch 
> 1. We do not need this level of detail.
> 
> For this patch the ordering of tags is correct.

So indeed, that either means duplicating the S-o-B or dropping it
entirely as we do not care that it was part of that series earlier.
Dmitry will likely sign this off once again when picking the patches.

- Marijn
