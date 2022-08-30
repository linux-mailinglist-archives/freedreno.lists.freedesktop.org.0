Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD75A59E7
	for <lists+freedreno@lfdr.de>; Tue, 30 Aug 2022 05:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8F10E843;
	Tue, 30 Aug 2022 03:26:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1910E843
 for <freedreno@lists.freedesktop.org>; Tue, 30 Aug 2022 03:26:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9389D614D4;
 Tue, 30 Aug 2022 03:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B168C43144;
 Tue, 30 Aug 2022 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661830009;
 bh=qXAfX2O39p0xYnrj+PD1Oizsy6+IKu8PAhhax/9rYvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IjLn74zKn6g5PJmghlBPKNE5Bdb2uypGkf9jfP3CvraMXHwhNHO1uH2QVvRMGHmlw
 D9KgH1c08TPhuWGoEDjrddYuKjTltvCGJsERz9Q+Zrh2LKr5Bvpb5Nlp+/3TtBxSC3
 2Z2On63KU0VJ0wwwAIbTt0wkradVNof4J8c2dXhn/uyKTGh5AQMAQ0pitoY6XWlMIX
 MmX4Anz3JTVsaC/zrNDJwa9h/TDIp9SAEs4vr70OU0hEs0T/89CjjQJ6El5yXCgs1h
 DIJyC7yRUaMummQ3U6e8TBcDaG2wonOeaXVynr/3H7klp+2StP+Z/yVB5h9KniLpZL
 fDkBRyz0bUQUg==
From: Bjorn Andersson <andersson@kernel.org>
To: robdclark@gmail.com,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, quic_akhilpo@quicinc.com
Date: Mon, 29 Aug 2022 22:26:45 -0500
Message-Id: <166182996517.340873.17873007815467520358.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829011035.1.Ie3564662150e038571b7e2779cac7229191cf3bf@changeid>
References: <20220829011035.1.Ie3564662150e038571b7e2779cac7229191cf3bf@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: Update gpu opp
 table
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
Cc: agross@kernel.org, robh+dt@kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 01:10:55 +0530, Akhil P Oommen wrote:
> On the lite sku where GPU Fmax is 550Mhz, voting for a slightly higher
> bandwidth at the highest gpu opp helps to improve "Manhattan offscreen"
> score by 10%. Update the gpu opp table such that this is applicable only
> on SKUs which has 550Mhz as GPU Fmax.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Update gpu opp table
      commit: ad3b0f33fa54b472d11169c1f0ada1b1d0ca5c6f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
