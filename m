Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDA198DB3
	for <lists+freedreno@lfdr.de>; Tue, 31 Mar 2020 09:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8E46E5B0;
	Tue, 31 Mar 2020 07:56:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9186E5AB
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 07:56:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585641407; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mw7u0T8in9Wk7yv/+Jn7zUsruVSN8kOaTj5sQ3nzoGI=;
 b=Kmr84shWGyavG8fayDEroJoDf/Yxzs/PRE9ahfqUbVglwohhdrWJsO1NkXdxqBQdPV58a3+O
 Dvz5nLseK5TvkCfESvfP+8Vf6wpAvgtzC/0CavbkTGXnbNi5P+06YEjMzP9VeZnzp/4svUnW
 naxZ6tay5YF54v1HeuGfCylCeeY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7b0.7f9b3a196928-smtp-out-n03;
 Tue, 31 Mar 2020 07:56:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C641C433D2; Tue, 31 Mar 2020 07:56:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B378C433D2;
 Tue, 31 Mar 2020 07:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B378C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Date: Tue, 31 Mar 2020 13:25:48 +0530
Message-Id: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH 0/5] Add support for GPU DDR BW scaling
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
Cc: saravanak@google.com, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, sibis@codeaurora.org,
 viresh.kumar@linaro.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series adds support for GPU DDR bandwidth scaling and is based on the
bindings from Sarvana[1]. This work is based on Sibi's work for CPU side [2]
which also lists all the needed dependencies to get this series working.
My workspace is based on a chrome tag [3]. Although the bindings add support
for both peak and average bandwidth votes, I have only added support for peak
bandwidth votes.

[1]: https://patchwork.kernel.org/cover/11277199/
[2]: https://patchwork.kernel.org/cover/11353185/ (this lists further dependencies)
[3]: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2097039/3

Sharat Masetty (5):
  arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
  arm64: dts: qcom: sc7180: Add GPU DDR BW opp table
  drm: msm: scale DDR BW along with GPU frequency
  drm: msm: a6xx: Fix off by one error when setting GPU freq
  dt-bindings: drm/msm/gpu: Document OPP phandle list for the GPU

 .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 52 +++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 43 ++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 44 +++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 ++++
 5 files changed, 197 insertions(+), 14 deletions(-)

--
2.7.4
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
