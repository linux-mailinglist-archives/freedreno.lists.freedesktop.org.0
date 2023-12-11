Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF1A80C60A
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 11:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4010E437;
	Mon, 11 Dec 2023 10:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C3510E444
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 10:10:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B7D6CE0F12;
 Mon, 11 Dec 2023 10:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65093C433C7;
 Mon, 11 Dec 2023 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702289443;
 bh=xegFE43EsxyDEc3X4/P6wFMt65swkGo0cmYpTfXFMNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/d66fRvTIHZc+1tPtr4CYU+RquwqoOlqN2HfoxjeD6nhSx7Tr7hAznWzqWfOPFcP
 +VuZz1oSq9AmKmlRe0ZPBOfq/se1RO2d7wKCOmsqjHO5x4hLNXuitHBXfhJYsNdduA
 6v5lfqbLkyCb31oVZr7l936XUXZFQPYlBPDvexlsHpOTzeKtsQLxnF4Kkrk4MAG59x
 u90ynnHr5nQDPeqo9bKNGmReO9cYIL4W9vJLGlPu55BmQA9b9RtCqtrSfA2L2sKG1i
 7di11AS03a/4c7oIoqgbtr3+0B6RsQkgo98fRmItwkJTUgFvt7NlGV8u1366zKLZqr
 sjfDAjQv4J0SA==
Received: from johan by xi.lan with local (Exim 4.96.2)
 (envelope-from <johan@kernel.org>) id 1rCdG5-0005bi-0v;
 Mon, 11 Dec 2023 11:11:29 +0100
Date: Mon, 11 Dec 2023 11:11:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add missing GMU entry to match
 table
Message-ID: <ZXbgUeuf0-dYBOYV@hovoldconsulting.com>
References: <20231210180655.75542-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210180655.75542-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux-foundation.org,
 Danila Tikhonov <danila@jiaxyga.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Dec 10, 2023 at 10:06:53AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In some cases the firmware expects cbndx 1 to be assigned to the GMU,
> so we also want the default domain for the GMU to be an identy domain.
> This way it does not get a context bank assigned.  Without this, both
> of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
> allocating and configuring a context bank.  So GMU ends up attached to
> both cbndx 1 and later cbndx 2.  This arrangement seemingly confounds
> and surprises the firmware if the GPU later triggers a translation
> fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
> getting wedged and the GPU stuck without memory access.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Tested-by: Johan Hovold <johan+linaro@kernel.org>
