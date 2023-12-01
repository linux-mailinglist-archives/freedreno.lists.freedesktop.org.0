Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219980052E
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 09:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0E10E810;
	Fri,  1 Dec 2023 08:06:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB9910E80F;
 Fri,  1 Dec 2023 08:06:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15B75CE25B5;
 Fri,  1 Dec 2023 08:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9066FC433C7;
 Fri,  1 Dec 2023 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701417971;
 bh=rSTgwpB4g0HFcXSHaBEs360QwFlsfjE5INflcdboa6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bxgvgbWMEJ996BM61zZpPKE1MFIbj/k5V8TbNU7apa3Wb1IQwowCQR8wyo+Vc8UbW
 gtAd2d0aA9g1Eke/dZmv5v4yHxQKmoo2AW7Hpe+trJfxlhIR+lVal1W/1O2KH0lksH
 1ds/DqxuZYCb1bQ5rHCwI+zvhr/KjA5BoufD5hDsReZ2+31HYGTsxw5/x90mZXiz9v
 9oPc+3PwFG9L1uczidEz60/ufBYaPuKwTT6HvBFUzV6RFLi1HxmbCrZ1Y4beb1C+3a
 9n39e2EEv2A0TVsXhUA10xh7KDMblgJn9Opzw2llVou4V2GrB8NZBQmTEPU1ddD0Ed
 2X4Im0pVhtn/A==
Received: from johan by xi.lan with local (Exim 4.96.2)
 (envelope-from <johan@kernel.org>) id 1r8yXt-0005H6-2b;
 Fri, 01 Dec 2023 09:06:46 +0100
Date: Fri, 1 Dec 2023 09:06:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Message-ID: <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in
 sc8180x catalog
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 04:35:01PM -0800, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")

Missing CC stable tag?

> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Johan
