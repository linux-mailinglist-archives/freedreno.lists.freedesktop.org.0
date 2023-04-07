Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417E6DB1C5
	for <lists+freedreno@lfdr.de>; Fri,  7 Apr 2023 19:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E766810EE2E;
	Fri,  7 Apr 2023 17:38:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C355910EE2E
 for <freedreno@lists.freedesktop.org>; Fri,  7 Apr 2023 17:38:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 535B960CA0;
 Fri,  7 Apr 2023 17:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C1FC4339B;
 Fri,  7 Apr 2023 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680889117;
 bh=KPIevUfhOCnsYWGl++KgpaVzp3iMelMgZUHcaQzbHrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NhzB+Ima+sIrbFEAGM90EVhtvmotJR+DjUqi6rvvECD6iojuImvFKYeqNca9XhBXr
 lSCgD5jqsgM2S+FDIXuxInq2hwEZooNzT6ZMLvK+aorFe27YQZuyhyQIbb3xcq0vJ0
 OiQnQ3kZNRtGDBUZwSSuobnqk/fEe8hIOok/Kjy/T7UTcGnLqDB8lCxjYy3bS51k7X
 MpH4JrsHptqhTL/+eaFYR9kMLcRMkuivCRQl+TBGx+ax1xfBiqoesHqks0BhHSWsVK
 51H1RO5cn/VdBaQE5Ydf7baah/ChiyfAUJe5ty5avOdAezjYNpOmnZM1DnqjPrpZkL
 bnXsmTin8r/iA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Date: Fri,  7 Apr 2023 10:41:15 -0700
Message-Id: <168088927579.2561591.16300478555888489452.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
References: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: remove hbr3
 support on herobrine boards
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
Cc: quic_bjorande@quicinc.com, dianders@chromium.org, swboyd@chromium.org,
 konrad.dybcio@linaro.org, robdclark@gmail.com, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023 16:34:16 -0700, Abhinav Kumar wrote:
> There are some interop issues seen across a few DP monitors with
> HBR3 and herobrine boards where the DP display stays blank with hbr3.
> This is still under investigation but in preparation for supporting
> higher resolutions, its better to disable HBR3 till the issues are
> root-caused as there is really no guarantee which monitors will show
> the issue and which would not.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards
      commit: 75eab749e7aec0b7b515d7c50ed429ef4e1c5f3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
