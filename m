Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F352274E84B
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 09:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EE610E32B;
	Tue, 11 Jul 2023 07:45:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300210E32B
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:45:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C99061362;
 Tue, 11 Jul 2023 07:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699D7C433C7;
 Tue, 11 Jul 2023 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689061505;
 bh=TtqMpM4hW9AyV/Tt+Gydfd5XB5pw625KQ3mnbG3pd44=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qPjCG+heQ/6Lr135KxiYrFt07VW7BfjXXzHEfKRbDcx8eFfxVfBoF67MpxEKYYALP
 mKzZQAzfXWH78LKfbO27R2FHXSfGxsC0qBXX1fz5CIkq3vxAzVbtBdz0v37cjPPdhM
 0Ux4AJvyLrfZlUHtspdwEh2pdzPQV6BK6Z0gjMzu8HFQ7NGYhn6M74oAJhC8wLgwZy
 MqpOylsvpUVqJP5deghUAC1Rdckwpuo+Vvv12UQsDwGRPPPUM4gaWL6vbkU4fNtUyr
 Vaqn8lqzLbgxppmjXISmqiqEQdF0WFao1iiV2Nw9IUlVpK1RUwB0AyRuQ8ZvHlJ1WC
 3IoJu2ivsK4Og==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
Message-Id: <168906150192.189433.12057457685611728687.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:15:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Subject: Re: [Freedreno] [RESEND PATCH 0/7] phy: qcom: qmp-combo: rework
 register access
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 21 Jun 2023 18:33:10 +0300, Dmitry Baryshkov wrote:
> For some reason I used the wrong script to send this patchset, resend it
> including proper (linux-phy & maintainers) recipients.
> 
> The patch at [1], which added another function just to have v4 vs v6
> register address difference prompted me to take a look at the combo PHY
> driver. We already have mechanism, register layout descriptions, for
> coping with register address differences, which I ignored while adding
> v4 support. It looks like nowadays this has exploded somehow, resulting
> inseveral almost-identicatical functions.
> 
> [...]

Applied, thanks!

[1/7] phy: qcom: qmp-combo: correct bias0_en programming
      commit: 8fa60f5ab940ba732644c996c3570b78b10b8fdc
[2/7] phy: qcom: qmp-combo: reuse register layouts for more registers
      commit: 211ddf1d89cfb6be8aead2092c95bb285bf790b6
[3/7] phy: qcom: qmp-combo: reuse register layouts for even more registers
      commit: 01f363f4eb0c0c35aa88a0ff2a329c4d88dc1da0
[4/7] phy: qcom: qmp-combo: reuse register layouts for some more registers
      commit: 245fa640ea46ad430cd962351fef0618f71ffda9
[5/7] phy: qcom: qmp-combo: drop similar functions
      commit: f4ed3532ca7422811083d15a204f91b8f5f8b49a
[6/7] phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
      commit: 8e4137dc4eac0982aeb4f3fd103598a41c4f165d
[7/7] phy: qcom: qmp-combo: extract common function to setup clocks
      commit: 315a1a400d9c6533823e3e3af9b07cb4d0555f77

Best regards,
-- 
~Vinod


