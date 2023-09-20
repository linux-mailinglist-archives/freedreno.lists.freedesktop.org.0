Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F57A702D
	for <lists+freedreno@lfdr.de>; Wed, 20 Sep 2023 04:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0C010E2BC;
	Wed, 20 Sep 2023 02:10:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172110E2BB;
 Wed, 20 Sep 2023 02:09:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 882866182A;
 Wed, 20 Sep 2023 02:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1F3C433CB;
 Wed, 20 Sep 2023 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695175798;
 bh=kPXR+UXVZ0VUqE2ympbrGREBDM3xaV8v9dfBKtmEy6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nx0P0H3RkFdheOnYYhN0PIhuWW9/vdQJmU7w6YHyBDRKdz/QZZ7bwPHmScB77quyC
 wNA4dng2SixGia8gSU3aiQwBH9zlTyGGX6CsnU/z9kPcFj7Ihj3id44YyvzbeHetRo
 S7fP0wo6RMqygW2CwwUzakApUuLMa9JFNdqsB+tgDeMLjmkg+HMw/6p77Ml0anFm5h
 adQoa9mkskNTtQwY6YqqN0NEMb2vTBi7arB5dLFSrwehv3fDhkaQwLAELXdce1jeB9
 iM/viZ1Bkyu9cnh7bVJMmpAtCAc7/k39z6hUQW5IAQwx9tg5lbrQqE3iTs1Q8J6lf/
 TsS1AkUXRhYjA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Sep 2023 19:13:58 -0700
Message-ID: <169517603985.822793.10273451924979552545.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5:
 enable DP support
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 09 Jul 2023 07:19:21 +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sm8250: Add DisplayPort device node
      commit: 956aa24b16350a50d3a6beb9237bc35aa2f447d6
[3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
      commit: d342e1c993bd7589cad9d2da099c6a9c652ecb9f
[4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport controller
      commit: 96387ee7534dc449be35a9bb98b7668da2bed545
[5/5] arm64: dts: qcom: qrb5165-rb5: enable DP altmode
      commit: b3dea914127e9065df003002ed13a2ef40d19877

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
