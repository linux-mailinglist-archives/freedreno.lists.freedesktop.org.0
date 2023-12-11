Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593E80CB0E
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 14:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD3710E0FC;
	Mon, 11 Dec 2023 13:30:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at gabe;
 Mon, 11 Dec 2023 13:30:57 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1EA9A10E0FC
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 13:30:57 +0000 (UTC)
Received: from 8bytes.org (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id EDD521A44AA;
 Mon, 11 Dec 2023 14:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1702300854;
 bh=k8UNSBAVgRXS6Dhpbyra/RJhgjDKIBpHGX+kNVBZNVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wO4JFVbhOJqAAa9UhOL1vlYp4E+Pq8SJdKRMas8p8iMhwN5dvh4oppfaQr9svFDjZ
 k0D0a4WmDo4rjtSXunVfLRjkVWUH2buCO6E5cZZilyE/LvI/GjFKFWouZmmCbXaPUc
 TTVpl1XfYoeGzg/fw1nEiwD20Wi0Zg3FMv1JnajvDXywiwykyfhUKoSdvTVKQWW6KD
 Re6+D59HtS7Qfz4eOEX5bF2aYOH/huLzRpO1+1MIxl6xUB5GGIsKqpXLCmY1+XIAHS
 G8NUoiIQXwTGdraayNrcJSgoMcw9xdznKvM4qm8s6b0fI2ZBi9q3gs1A2yO9fUEh8/
 v7W5gZc8VHglg==
Date: Mon, 11 Dec 2023 14:20:52 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/msm-iommu: don't limit the driver too much
Message-ID: <ZXcMtNrJLb9_W-lH@8bytes.org>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
 <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
 <6397268c-7990-42f6-9453-44fdc638d5c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6397268c-7990-42f6-9453-44fdc638d5c9@arm.com>
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:06:09PM +0000, Robin Murphy wrote:
> On 07/12/2023 12:54 pm, Dmitry Baryshkov wrote:
> > In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
> > driver just to those machines. Allow it to be built for any 32-bit
> > Qualcomm platform (ARCH_QCOM).
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>
> 
> Unless Joerg disagrees, I think it should be fine if you want to take this
> via the SoC tree.

No objections:

Acked-by: Joerg Roedel <jroedel@suse.de>

