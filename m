Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6277322CB
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 00:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8336610E562;
	Thu, 15 Jun 2023 22:32:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614510E562
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 22:32:16 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C7723200CC;
 Fri, 16 Jun 2023 00:32:14 +0200 (CEST)
Date: Fri, 16 Jun 2023 00:32:13 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a3lfr4tgdhhcvdf5h6q25gstajtth772isjgaibmxtalhzxnsk@u4dbwpjva4yd>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 00/22]drm/msm/dpu: another catalog rework
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

On 2023-06-15 14:31:22, Dmitry Baryshkov wrote:
> 
> On Tue, 13 Jun 2023 03:09:39 +0300, Dmitry Baryshkov wrote:
> > Having a macro with 10 arguments doesn't seem like a good idea. It makes
> > it inherently harder to compare the actual structure values. Also this
> > leads to adding macros covering varieties of the block.
> > 
> > As it was previously discussed, inline all foo_BLK macros in order to
> > ease performing changes to the catalog data.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/5efc0fec31d8
> [02/22] drm/msm/dpu: correct MERGE_3D length
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/f01fb5e211fd
> [03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/17bf6f8efc50

The first two patches are fixes, the third one is not?

- Marijn

> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
