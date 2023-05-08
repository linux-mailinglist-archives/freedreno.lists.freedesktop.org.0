Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA36FBA47
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 23:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D237A10E30B;
	Mon,  8 May 2023 21:53:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27210E30A
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 21:53:32 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 973663F5A5;
 Mon,  8 May 2023 23:53:30 +0200 (CEST)
Date: Mon, 8 May 2023 23:53:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <6ygvv536afltvmlsfugadwae5jwotv2g5vc5oycdfei6iwhvrh@tpoeqc4zpnda>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <6b93e2a9-58aa-bb91-f615-3fdec52596da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b93e2a9-58aa-bb91-f615-3fdec52596da@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: Add
 DPU_INTF_DATA_COMPRESS feature flag
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-08 10:36:09, Konrad Dybcio wrote:
<snip>
> > Depending on who lands first, this flag should be split.
> I'll adapt my patches. Jessica, no changes required on your side.

Looks like no split is needed after moving HCTL to SC7180.  Your SM6375
series can use SC7180 instead of SC7280 now and everything will be right
without a change here.

> > I still see value in inlining and removing these defines, though that
> > brings a host of other complexity.
> right, we should totally do it after we settle down from the patch
> flurry

But we just got a nice velocity, I'd rather keep going :) - we can
totally address these cleanups somewhere along the line though.

- Marijn
