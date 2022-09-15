Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0E5B932E
	for <lists+freedreno@lfdr.de>; Thu, 15 Sep 2022 05:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F8B10EA5A;
	Thu, 15 Sep 2022 03:37:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AE210EA5A;
 Thu, 15 Sep 2022 03:37:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B4C4B81D86;
 Thu, 15 Sep 2022 03:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13EC4347C;
 Thu, 15 Sep 2022 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663213031;
 bh=KxdZUKe1FhFDeqYOXN6BYRfxXZGj21xAg5hE3J+Cd5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kWKUEfmG+e/tYxbHra/T7k7GOJ/jZCv4yTs8pwDMCc2cibgNiws5zwPshLWp3CQF1
 DL6zmPDYq/RtwvemGwmWY9EoHq7DySOQaBpOOMWpHSnhTWH9QpWx3Zj2oNa8fllGBU
 mYO3fslzKWCE2akRA45YWXL6Z4xDBngzO/tvyniiE7iQFkwSm/3C9CLmUnURbN7kJx
 KxPNrLv9ynMVsDDNUVEunM3SnqTOBEakbcBw6vvhSLKm1eB6vY8T77zhoUL7+OaKis
 X/ESlHNH1+bFH6WcjtVHyjPm09L3F7vPLSzJ3gxjOSPF1AVXU8TnN/9XvIg426mOVI
 ZOp1J9HTH6qQA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dmitry.baryshkov@linaro.org, robh+dt@kernel.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run,
 krzysztof.kozlowski+dt@linaro.org
Date: Wed, 14 Sep 2022 22:36:53 -0500
Message-Id: <166321302054.788007.13905269452519533105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v3 0/3] drm/msm/hdmi: turn MSM8996
 HDMI PHY into OF clock provider
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, linux-phy@lists.infradead.org, kishon@ti.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 4 Jul 2022 19:11:45 +0300, Dmitry Baryshkov wrote:
> On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
> used by the MMCC. Add support for providing this clock to the OF
> framework by registerding the clock provider and adding #clock-cells
> property to the DT node.
> 
> The dt-bindings from this series depends on changes from [1] (part of
> linux-next, but not of the msm-next yet).
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI PHY node
      commit: 157b615066288f84e1812964a439603cfe8c1a19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
