Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948F8D1298
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2024 05:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CDA10EFE3;
	Tue, 28 May 2024 03:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KebHt+it";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE2F10EECB
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 03:33:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FE0D61DDF;
 Tue, 28 May 2024 03:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D77C3277B;
 Tue, 28 May 2024 03:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716867180;
 bh=zHzPimdv2KnLlpvH1GAVPTimdIR9npkRiUWf44lJ1t0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KebHt+itAEv9yfI2JA9+XW32CQUiTkzPgYQSpMtY5GiMwicgpm3v47lHd8R/ZAmEA
 NNbxkZyVA0h3x0ETmvO1kchMY7TCHukkFEfN8Xl8blQRNCRVUVDOnGYdvcbPpCuy1k
 4naSMEoH3R71l8XiPhC4mX+Qokck++Dk/cLwcCFGUsOpdExDkGkm3KommKVN5Hm8WU
 ipEKvJ/h2jGPGE1nDWc3NnEPaILGlbhg2j1Xnweang0q1P6i1jtDh6gplSFYCLfqkD
 VCllth9x5vbKialVa9gHcaS+AQ10VBmA9K2c3F3jasVRiaxi4f5TNu8tgOGI2m70WV
 KQB7bZGBoWL9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by
 default
Date: Mon, 27 May 2024 22:32:22 -0500
Message-ID: <171686715153.523693.15237677868673432565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
References: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 15 May 2024 16:27:44 +0200, Marc Gonzalez wrote:
> 15 qcom platform DTSI files define an adreno_smmu node.
> msm8998 is the only one with adreno_smmu disabled by default.
> 
> There's no reason why this SMMU should be disabled by default,
> it doesn't need any further configuration.
> 
> Bring msm8998 in line with the 14 other platforms.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8998: enable adreno_smmu by default
      commit: 98a0c4f2278b4d6c1c7722735c20b2247de6293f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
