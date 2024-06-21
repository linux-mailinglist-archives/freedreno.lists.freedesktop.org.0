Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48921911A5F
	for <lists+freedreno@lfdr.de>; Fri, 21 Jun 2024 07:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44310E2A1;
	Fri, 21 Jun 2024 05:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AbzoZuTN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6682110E2A1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Jun 2024 05:29:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0AA3ECE2B48;
 Fri, 21 Jun 2024 05:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36923C2BBFC;
 Fri, 21 Jun 2024 05:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718947761;
 bh=QjmxWRJZUIUfwMxmk0zGTkg+d0XCMnt3cBBK3lXH05M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AbzoZuTNohYOJhrILmd4nL50tBzN+8Y5M4Zqciwu57tEHewyi6k642lzp4WTF5lp6
 X8c2Llu6freeBYgBFUgNnRsBLgKDuRnelr4Bk+VC2suJmT8hi8DoEcrBTJFYozU2eX
 ej5N6/cyvXBag5nwq8/i2olSB0UPd6VgfsCrxxEoGU+K5XNHrqBQeFc0fxtno18GrV
 gBN1qCMiLXGKZZP9jQjDO/8sIdX7Cctq+NZYYyFpF+hNvlAz2kScco2Ky8E6WOFeXG
 12E0/8HpED7sdZafVOtrNsWwODS0mwWoHNJl5u6p7q4AIDhH2cUdKO3pPLIw5pGT+X
 OVfyFN3KVCi4A==
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
Subject: Re: (subset) [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
Date: Fri, 21 Jun 2024 00:29:15 -0500
Message-ID: <171894775429.6672.4139305245535140845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
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


On Tue, 30 Apr 2024 11:43:16 +0100, Connor Abbott wrote:
> This will used by drm/msm to initialize GPU registers that Qualcomm's
> firmware doesn't make writeable to the kernel.
> 
> 

Applied, thanks!

[2/6] firmware: qcom_scm: Add gpu_init_regs call
      commit: 158ed777e330e9bf6bd592daaf1e860d965ec8b5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
