Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3489A9EF
	for <lists+freedreno@lfdr.de>; Sat,  6 Apr 2024 11:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567BF10EFAE;
	Sat,  6 Apr 2024 09:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ag1LVMaD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62D10EFAE
 for <freedreno@lists.freedesktop.org>; Sat,  6 Apr 2024 09:19:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61821609FE;
 Sat,  6 Apr 2024 09:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E35DC43394;
 Sat,  6 Apr 2024 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712395144;
 bh=1iz5fj0staSEBeBD4iubGSRLqhDhiBIKfBjemrptmJE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ag1LVMaDwFBCTCC8hW1EdfxpTKqKuWopYK1dHwSVtSR/m3ufyCM+/Z3lJh7EEqYUf
 e7jhCey2MXWcUUfwrdL4uynOmNDwHTY3ZxHFtLPIiRYjWeV5n5V5+Y6+QTlQHMfKsm
 O7YjYL0RGSRrtD9eWDMy/R0Sr7NP2EH/hkZrwqtzXCIMzU1CQcQMcPjqiijTs8vZp5
 sxp4txYdi7whwSjcTgg/J9iZJEabVirHvAshc3/Lim7i7YSeZnPqxLpr62nsY7RvE/
 DcEm+q1gHrMVa48qfo0WQHhdqpR8E3kYXzSZ5lJS6Isp40I4Tqzo5+fBXivY8uilDi
 jnwJxow/JBuIw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
In-Reply-To: <20240405000111.1450598-1-swboyd@chromium.org>
References: <20240405000111.1450598-1-swboyd@chromium.org>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix register base for
 QSERDES_DP_PHY_MODE
Message-Id: <171239513898.352254.11562819537572881543.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 14:48:58 +0530
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


On Thu, 04 Apr 2024 17:01:03 -0700, Stephen Boyd wrote:
> The register base that was used to write to the QSERDES_DP_PHY_MODE
> register was 'dp_dp_phy' before commit 815891eee668 ("phy:
> qcom-qmp-combo: Introduce orientation variable"). There isn't any
> explanation in the commit why this is changed, so I suspect it was an
> oversight or happened while being extracted from some other series.
> Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
> suspect this is dead code, but that can be fixed in another patch. It's
> not good to write to the wrong register space, and maybe some other
> version of this phy relies on this.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-combo: Fix register base for QSERDES_DP_PHY_MODE
      commit: ee13e1f3c72b9464a4d73017c060ab503eed653a

Best regards,
-- 
~Vinod


