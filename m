Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE30664B3B
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 19:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85A110E637;
	Tue, 10 Jan 2023 18:40:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959AC10E634;
 Tue, 10 Jan 2023 18:40:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1F6F61880;
 Tue, 10 Jan 2023 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23554C433F2;
 Tue, 10 Jan 2023 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673376008;
 bh=peUKivG1RFYc2AUIx1t3veHp32Gl6+m50j+8BpqHDMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Shc2EQ6946YqnAZWwq9bgeO3taUA3ksNGbQXFeHy/O0qMANoD6mroMZrVaV2475bo
 RS6cJFhc+0j60u08fzYtd/1yQYOMaiJcLIBftoSbz7+CYc+k4q8RmOJfksP2aEOQPH
 OH70pelcJGUfB+8vREUERrQ4bIrmTlN1wmrrLFCLNSjfH6D8x3pCUExV+7Ey03Rx0+
 C8zSxdImmPPF2k3FG1z9qfbQC2JFtr+V9G/0WBorulAa0QYbqWg2lHr0jo2/7f2oyW
 RAdocxIpURHhoTPphGidCwgIRNNGgZRp32PH98Uzsn6+JPArWbOWYo0eJs0ROq+jkP
 ttYgGcoDnjuRA==
From: Bjorn Andersson <andersson@kernel.org>
To: robh+dt@kernel.org, sean@poorly.run, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, agross@kernel.org, konrad.dybcio@linaro.org
Date: Tue, 10 Jan 2023 12:40:04 -0600
Message-Id: <167337600117.2164548.7307616788379672932.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH 1/3] ARM: dts: qcom: msm8974: Add
 compat qcom, msm8974-dsi-ctrl to dsi1
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, bryan.odonoghue@linaro.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 10 Jan 2023 07:54:31 +0200, Dmitry Baryshkov wrote:
> Extend the secon DSI interface with the SoC-specific compat entry,
> following the change for the first DSI interface.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sm8150: Add compat qcom,sm8150-dsi-ctrl
      commit: b0b8b34a8d6b4c50dac086ca18964fae5e6954d4
[3/3] arm64: dts: qcom: sm8450: Add compat qcom,sm8450-dsi-ctrl
      commit: b7f4f6971d62f0019c27142ee6b703d8cab96e38

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
