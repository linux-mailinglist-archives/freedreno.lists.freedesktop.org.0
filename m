Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354262F60C
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 14:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE5A10E088;
	Fri, 18 Nov 2022 13:30:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D37D10E088
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 13:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F81C62523;
 Fri, 18 Nov 2022 13:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1507AC433C1;
 Fri, 18 Nov 2022 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668778217;
 bh=DVByPI99cziskeMpw3/H3Sw35EfmuI4W+QBBcElCutc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9ycSFlGC0m5cG9RlAnwnYROpSROstzfMcobdK7fyIuqni/nBCox5zZU8Zxm5JPQU
 0NKbCmOwLN6yHLstgSag0cb2GLcS31zJxM9bJyFPJoQbzVy0V+liMcYT8YrNRwTQeL
 qSmMkZ5+8tMznQrISNGyBBCqpy/mixDrZFEFn29bfIz6oaPXPdMENCV02yPhFm3bUK
 OvRzNp9qluquzn86ncaH7paGu3Fl+Wb1WI3H/owbh/Ebept7Fs7ZUMT0DXwOR40Mrr
 GFtFiDEUOAwpp8v8bklsGXmYphMFUeCoL9ls0we38VSPdLs4lerFm/lfDqQXfsdhW6
 /XmJuSgBbZbLQ==
Date: Fri, 18 Nov 2022 13:30:10 +0000
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20221118133009.GA4046@willie-the-truck>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
 <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 01:41:24PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> > The main goal of this patchset is to define a generic qcom,smmu-500
> > binding to be used by newer Qualcomm platforms instead of defining each
> > and every SoC line with no actual differences between the compats.
> > 
> > While preparing this change it was required to cleanup the existing
> > bindings and to rework the way the arm-smmu-qcom implementation handles
> > binding to IOMMU devices.
> > 
> > Changes since RFC v2:
> >  - Dropped the dts patch, picked up by Bjorn
> >  - Fixed minor nits in commit messages and in-file comments (noted by
> >    Krzysztof and Richard Acayan)
> > 
> > Changes since RFC v1:
> >  - Added the dts patch fixing order of clocks in msm8996.dtsi
> >  - Fixed the DT bot errors
> >  - Added separate clause for Google Cheza devices
> 
> Please continue the version numbering. RFC is also a patch and also a
> version. This is v3. Your next will be v4.

I queued this already, so hopefully there won't be a next version!

Will
