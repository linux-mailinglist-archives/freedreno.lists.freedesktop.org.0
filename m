Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D690D8FDB06
	for <lists+freedreno@lfdr.de>; Thu,  6 Jun 2024 01:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D05F10E38F;
	Wed,  5 Jun 2024 23:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mVHGkrdp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334110E38F
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jun 2024 23:55:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E7FFFCE1876;
 Wed,  5 Jun 2024 23:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B62C2BD11;
 Wed,  5 Jun 2024 23:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717631717;
 bh=Gr6FdP01TYe9geaqfK/BaFTzGY/PrnX38cvxMniy4hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVHGkrdpd9qHNUWrmVey1+Z4TOHxukh8sDqQUzLuW6femHynJhOr1wmLOphGbKF3T
 r/+MpacL7dq8FUSX58NbayI/AsXFOpwOFmQskFRQabnTXXmPLV7iOz0pT0HIsI58Yz
 nEFwLJehvnODFvQ0CU/eiivdbYHl8co2g0HTPYmjFLLdnl9KC6Ihdk/4wc2iguHv73
 vIEHYwJPUfNpaVGj0Yo1I27TpcxfFkBHIpdPsNc1W4TutRLRNXebHcc8ScQ2ApIFPY
 yvVOxeDQP11ScZjdTKGWCX6eLansVtZUx8oPxlhipWJmQnXcSMXm0covUc6W2BnQkt
 iEZedjuY6xy3Q==
Date: Wed, 5 Jun 2024 17:55:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sean Paul <sean@poorly.run>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-phy-8998
Message-ID: <171763171236.3460607.686734211960496313.robh@kernel.org>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>
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


On Tue, 04 Jun 2024 15:46:03 +0200, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

