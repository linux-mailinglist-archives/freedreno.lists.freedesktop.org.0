Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90BB2CE51
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 22:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567A110E00F;
	Tue, 19 Aug 2025 20:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzsgm6I8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F3210E00F
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 20:53:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E86D5C62EA;
 Tue, 19 Aug 2025 20:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D627C4CEF1;
 Tue, 19 Aug 2025 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755636834;
 bh=Ct16rkVZw82v7+uuxySxZhhLvccFn3UN87vyKAsTQPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gzsgm6I8sfNPAtW9b0QYKaMZGXnqrH3IRcpRZPdEko6oKUiWSb505KYj9NVzShETN
 I/rbrEDVEA96kIxJzu9QFOeSltKLutm/vCRqE1q3/EiNTi9hqHlnJ8qwEcRmlwUbA+
 QbRp0+XlR0UWF1KriqrTa4Nn9HyTpm6HT9VjNIqK6CDa5ue4Zmcfa098mampciG1HC
 mji+qAcLMYKG7gIpIYfVercpggeF5JEODBpTvpVgnGpHjENNWlZ1Pj89qkBf7f/bXx
 Zny7A8dZ6k/VSxe0VPsLPAkfFfG2gDgiu7Rhd7Zq/HMq/vQQt2BGlfyZ2VdHjX59GM
 f0kfoko2pOi8Q==
Date: Tue, 19 Aug 2025 15:53:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] soc: qcom: ubwc: more fixes and missing platforms
Message-ID: <5czfssozoq3hthm4j5jecads45itqczu7xlxosxbp3ihhhqxwv@p2fnp3tuzale>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Aug 14, 2025 at 10:22:19AM +0300, Dmitry Baryshkov wrote:
> Add missing configuration for several platforms and correct
> configuration for several other platforms.
> 
> Note: I'm not sure how to handle MSM8956/76 platforms. MDSS definitely
> doesn't have UBWC support. This doesn't provide a threat for now (as
> MDP5 driver doesn't provide UBWC support), but if we were to switch
> these platforms to the DPU driver, we might need to filter them out.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Dmitry Baryshkov (4):
>       soc: qcom: ubwc: use no-uwbc config for MSM8917
>       soc: qcom: ubwc: add more missing platforms
>       soc: qcom: add configuration for MSM8929
>       soc: qcom: use no-UBWC config for MSM8956/76
> 
>  drivers/soc/qcom/ubwc_config.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> ---
> base-commit: 0b6974bb4134ca6396752a0b122026b41300592f
> change-id: 20250814-more-ubwc-d56e4bccc23d
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
