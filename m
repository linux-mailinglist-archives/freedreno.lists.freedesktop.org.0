Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F221389A9EC
	for <lists+freedreno@lfdr.de>; Sat,  6 Apr 2024 11:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399D10EFAC;
	Sat,  6 Apr 2024 09:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ryhhr482";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0E410EFAC
 for <freedreno@lists.freedesktop.org>; Sat,  6 Apr 2024 09:18:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E9E76091A;
 Sat,  6 Apr 2024 09:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905D4C433A6;
 Sat,  6 Apr 2024 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712395138;
 bh=CKx+Sd6xfsfIpNID92BJjS5Q/0Wk3rO67hmInznC/5Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ryhhr482/stDZaEN/VQttZWuBNtZbYJa+0k2Mm+MCL97kevMFtmJKqRZUejPMxS/C
 fCIwj6Y+Rq7elkWblvVBrKlHsphTOM+EHjgREosXHjMkEjMm9QlLAD31sAT6kUWE7k
 h5BCmCMvkPjYqaoRILptvnDhA9QIKjWun8biVBOBK7hVQXq5NL4P61vc9RsyOlBw0I
 AQCj0Rv+PwqrwwsjAhmjZYEvv46bKyKG4kkbE3wOGIL/DApCw706tUDstqBcuNDWK5
 +XdvZHT5+VwjQxBdNAU/6KmJU+Dgxvgx5C63RU3pIYxxNtOZgRYujdpbWZgVVFmED3
 QWskxeTmOmb8g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, freedreno@lists.freedesktop.org, 
 Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240404234345.1446300-1-swboyd@chromium.org>
References: <20240404234345.1446300-1-swboyd@chromium.org>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix VCO div offset on v3
Message-Id: <171239513422.352254.9763002024133782932.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 14:48:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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


On Thu, 04 Apr 2024 16:43:44 -0700, Stephen Boyd wrote:
> Commit ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to
> setup clocks") changed the offset that is used to write to
> DP_PHY_VCO_DIV from QSERDES_V3_DP_PHY_VCO_DIV to
> QSERDES_V4_DP_PHY_VCO_DIV. Unfortunately, this offset is different
> between v3 and v4 phys:
> 
>  #define QSERDES_V3_DP_PHY_VCO_DIV                 0x064
>  #define QSERDES_V4_DP_PHY_VCO_DIV                 0x070
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-combo: Fix VCO div offset on v3
      commit: 5abed58a8bde6d349bde364a160510b5bb904d18

Best regards,
-- 
~Vinod


