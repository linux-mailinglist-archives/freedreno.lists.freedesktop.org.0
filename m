Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211768B9081
	for <lists+freedreno@lfdr.de>; Wed,  1 May 2024 22:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D2A112414;
	Wed,  1 May 2024 20:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIxWD699";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ABD112414
 for <freedreno@lists.freedesktop.org>; Wed,  1 May 2024 20:21:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3C93619E2;
 Wed,  1 May 2024 20:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC04C072AA;
 Wed,  1 May 2024 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714594861;
 bh=mPOJh2JLb4+G/HCcjgvW7ybqGHrgyvCNEINt8rp7a4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PIxWD699KeUiyeFE2xiqaZDvUCYwCCjpg9klaKw2r0ORAtkZQ2o9x9b9ilBZbdnx3
 vmiiKBT4puN/hh8EAfpUewufEK69gFvB3aIlR7czMeR85JuHdgWrGglEoCUykl0Ajc
 UB8WdQWssYmDZFjJIzqlYoqseSciHZWluyQozvL/KCRF2Tyji+N7MHWsscIptcznPa
 SlsAFzi1dXUqQjZm3gPq2JCoTFG9Z2LRhiyBsSaGs//R14U6i7nDDP5txHv8L4zhRl
 Sq2SXRi+66m8z8+/UaOww2OL+E5TKCOVprdYBMr62Gd2DvXGS2SjVPQgdK9iBuXlRL
 ew8RfMfdnOpOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/6] drm/msm: Support a750 "software fuse" for
 raytracing
Date: Wed,  1 May 2024 15:20:51 -0500
Message-ID: <171459484204.41039.10194647929173496026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
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


On Fri, 26 Apr 2024 19:33:58 +0100, Connor Abbott wrote:
> On a750, Qualcomm decided to gate support for certain features behind a
> "software fuse." This consists of a register in the cx_mem zone, which
> is normally only writeable by the TrustZone firmware.  On bootup it is
> 0, and we must call an SCM method to initialize it. Then we communicate
> its value to userspace. This implements all of this, copying the SCM
> call from the downstream kernel and kgsl.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      commit: 0d80ac75cba26fde5cae55323b7617f0fec5322b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
