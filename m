Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5F620848
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 05:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90B10E220;
	Tue,  8 Nov 2022 04:36:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BF810E220
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 04:36:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89D81B810C2;
 Tue,  8 Nov 2022 04:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D60BC433D6;
 Tue,  8 Nov 2022 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667882191;
 bh=9xpt49gT45y/+nP1FfaBQXR9URrzOWIJn66IA+DB+sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HjCBJUeBgGz2ODaX1HRfOnfsBtvMUnH2fl3S2+1qoij+ELta2STas35VnJ0cZE8On
 /AmM2XQk8QBDzICPthsipx1OgPsvRb1+Zsnshrz+QPQQZzUHMDPIHG0cyMPpf4Zt8+
 pHH5uDOjqMiX6XnDCeYBW9OgN7f06gEwrCuoLUZ2CFJMv/xhJuQ8QR67eaIWUYMyWQ
 PUkq/n+3z4fDK7h0d4r9MD/CkgCMB5mwk9P4n6/0C0CkvChi3Xg3yrLHklhmZ0EueJ
 hvjAQEc/TNEwIVg4OAHp4gOA3ywFvJKY9ED4T7vYB2wU2VFnqCi0+JqqZWpFIVzLWs
 zRYGIPwHBb/Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, will@kernel.org,
 robh+dt@kernel.org, joro@8bytes.org, konrad.dybcio@somainline.org,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com
Date: Mon,  7 Nov 2022 22:36:25 -0600
Message-Id: <166788218325.625965.13235761598838044244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [RFC PATCH v2 01/11] arm64: dts: qcom:
 msm8996: change order of SMMU clocks on this platform
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
Cc: devicetree@vger.kernel.org, quic_saipraka@quicinc.com,
 linux-arm-msm@vger.kernel.org, vkoul@kernel.org, iommu@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 2 Nov 2022 21:44:10 +0300, Dmitry Baryshkov wrote:
> Change order of SMMU clocks to match the schema.
> 
> 

Applied, thanks!

[01/11] arm64: dts: qcom: msm8996: change order of SMMU clocks on this platform
        commit: d6e636787d462c047a424dd442b68a249edde2a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
