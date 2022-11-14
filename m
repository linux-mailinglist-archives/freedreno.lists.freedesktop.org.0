Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B50628269
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 15:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ED610E0BC;
	Mon, 14 Nov 2022 14:23:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CE310E0BC
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 14:23:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82CD7B81037;
 Mon, 14 Nov 2022 14:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84CC43470;
 Mon, 14 Nov 2022 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668435814;
 bh=9E255QG+3FQ8gHO/W6Krz66A4Vs6SmwNv5u1uPI2t3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=japqIyjyyhj7IK10C+Wcni5A0JAKXPbZnQvXNcTtsDTr1J+r+mzPXrkTv/XAbO0wN
 sLoaHRvi/44QaD6WMUXHQg0OY7Lk97o8GZOhq/BXi98vof6YBpOl1/RqMxv456NvqO
 zk7GiIz/6Tone8q8Yc3bbJ/47mIkAEIjX7nRfhauF+TWf38iqmkXly8zC8m88oh/3x
 Ksxn8119brgKtT2bC1VBIlTr41y8eO/aODIyl/W1Wqorb7TRL/pEMfmdIs2YgVL+/E
 Go/md/MDpP9T9nD9ZUCm90Bgn1TO2rppcmT5HVi8Jext3ow6gWObzlo/zwLN6/0qsx
 CWUhGLJABRgng==
Date: Mon, 14 Nov 2022 14:23:27 +0000
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20221114142326.GH30263@willie-the-truck>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [RFC PATCH v2 00/11] iommu/arm-smmu-qcom: Rework
 Qualcomm SMMU bindings and implementation
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
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 09:44:09PM +0300, Dmitry Baryshkov wrote:
> The main goal of this patchset is to define a generic qcom,smmu-500
> binding to be used by newer Qualcomm platforms instead of defining each
> and every SoC line with no actual differences between the compats.

Thanks for doing this, I really like the cleanup and the possibility
that we can stop adding all these pointless strings every release!

It looks like Bjorn picked up patch 1, so could you please rebase the
rest of the series onto my SMMU bindings queue:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/bindings

and address the minor review comments you had so that I can pick this up?

Cheers,

Will
