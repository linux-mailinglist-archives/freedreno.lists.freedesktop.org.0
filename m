Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6EF78173C
	for <lists+freedreno@lfdr.de>; Sat, 19 Aug 2023 05:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5AA10E010;
	Sat, 19 Aug 2023 03:43:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5AD10E010;
 Sat, 19 Aug 2023 03:43:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E4E763986;
 Sat, 19 Aug 2023 03:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB2EC433C8;
 Sat, 19 Aug 2023 03:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692416628;
 bh=WSE734VY3ZnmlV6G0lUar/9DJf0XC0U6UkYAUOV3ACI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AXTyCP+UWMMgiqgYsTyHl8tUeQmXeaQjmcFQLxx7Ey4xL+FAcoAnPUTAFrn6g8EKT
 Qwag9GMj5XxSp+0geXKrIlfDioXyBqFmMsssf+0O4kN6bLo3dNKDfAICmMZXf3pQjg
 W2SfyWDsFJddmk30udPhF82RZcFwMzDpFvKV5rnZe7KXijlPC+H1vHvp7DPYGGWPk2
 KJOE369/Sg9TAgtyzThKRTK2aqB2eSID3rCSAiFvXHr7jTmRFlGpg5VdftaXLTbegd
 6KlYAm34hkBaBWkJepnEs4tzDh4Ln4e9QabTqxgVRj5GsHPeW8F8lpMiysnPtHDswc
 ImJvCNFdKaf7w==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 18 Aug 2023 20:46:27 -0700
Message-ID: <169241678226.2537898.15004991100741182949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726132719.2117369-1-amit.pundir@linaro.org>
References: <20230726132719.2117369-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v6 1/2] dt-bindings: display/msm:
 mdss-common: add memory-region property
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
Cc: dt <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 26 Jul 2023 18:57:18 +0530, Amit Pundir wrote:
> Add and document the reserved memory region property in the
> mdss-common schema.
> 
> For now (sdm845-db845c), it points to a framebuffer memory
> region reserved by the bootloader for splash screen.
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
      commit: 110e70fccce4f22b53986ae797d665ffb1950aa6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
