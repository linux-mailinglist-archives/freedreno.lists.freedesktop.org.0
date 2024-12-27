Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573629FD00A
	for <lists+freedreno@lfdr.de>; Fri, 27 Dec 2024 05:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49AD10E01F;
	Fri, 27 Dec 2024 04:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P+Kh4rUY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB78610E01F
 for <freedreno@lists.freedesktop.org>; Fri, 27 Dec 2024 04:15:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BFA135C274D;
 Fri, 27 Dec 2024 04:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BACC4CED0;
 Fri, 27 Dec 2024 04:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735272930;
 bh=ONtBFaGNx9XwKn01Y5d1keOMVgEwo5mlV60lhtsPxNw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P+Kh4rUYawbH0qd5CUGeu7RuUmLfnRCy6tey3nVkm9wbwbc9fvHE3Tec7hC7enawT
 8IwIRCd6qVobO6sdxlVp5fKInz2UNkENwJI6b+H7UMDqJNXk86lvmO65glGV7iPh+M
 +ab19mjIUcFTMs+JIiEAimxHFAaKyQSD6RDRYkdzJJEy5X2nvFT8evOwxobItjp/d1
 s+uqpj5sx5Wg4SVAc1XIhW6n6MCq7zYHSWRXd6os+nZKWlg5JNFLBrR0i1I1gtJGml
 8Kcfm3rinOkRP5aJV8UEr68kIb2+xU/Yjtimjx0+T06PG3yxVmBpIyefHPWdZZHjsD
 7stjMr/UByT/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 stable@kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS
 interconnects
Date: Thu, 26 Dec 2024 22:15:20 -0600
Message-ID: <173527291942.1467503.6964791268697075537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
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


On Sat, 26 Oct 2024 20:59:39 +0300, Dmitry Baryshkov wrote:
> Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
> LLCC->EBI path, while it should only be used for the MDP->EBI paths.
> 
> This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
      commit: b8591df49cde459e3b84cdc0517d7bf92053d244
[2/2] arm64: dts: qcom: sm8650: correct MDSS interconnects
      commit: 9fa33cbca3d2842f1f47ed4e5f6574e611dae32b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
