Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF75A587B
	for <lists+freedreno@lfdr.de>; Tue, 30 Aug 2022 02:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD9010E18C;
	Tue, 30 Aug 2022 00:34:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CA810E10D
 for <freedreno@lists.freedesktop.org>; Mon, 29 Aug 2022 23:46:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96674613F7;
 Mon, 29 Aug 2022 23:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C93FC43146;
 Mon, 29 Aug 2022 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661816783;
 bh=BcISCDdMWOEJ+xzkFdwcDlRGMcDYB/o5RAI/t3OmKcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bwQl48SSoyQuulN2Gy7WU4X004ZR/96+PACXaHzZL5CVvZZm0C3oKQVpLcCIzgjm7
 hEQKyPM5BBo7sXHJCEpqupq3jSb94Rm81jlZ5qNdfDHdOATA2z/FSBctMoraXvQSfq
 GHT+jT6Gjmd+49901Q+wHfeVCqVwHs3+l0MrnZlMz/F+QgPgcjzvboq2hhGFxfpzfX
 KYjsgs5goqDjDDH29aifS39I7S84TuJk50qziUk4IiPsZvgDfGh8MQ89N//rCHrd6a
 LLCjfDTDCFRWNfcQrstcDc/REqmoUFWUgZf1bASSmQ0tCCOgLe5calEsKvN+QDs1Pt
 tfAdp+mKXtrtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
 Bjorn Andersson <andersson@kernel.org>, konrad.dybcio@somainline.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org
Date: Mon, 29 Aug 2022 18:45:45 -0500
Message-Id: <166181675991.322065.10538388207761075162.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Aug 2022 00:34:50 +0000
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sm8250: move DSI opp
 table to the dsi0 node
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 22 Aug 2022 22:11:38 +0300, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0 node
      commit: 9ea5ae629914c265c0ebb008865f93bd3480e09a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
