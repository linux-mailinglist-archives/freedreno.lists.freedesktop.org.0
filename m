Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3E547985
	for <lists+freedreno@lfdr.de>; Sun, 12 Jun 2022 11:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5593E112578;
	Sun, 12 Jun 2022 09:22:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67CF112571;
 Sun, 12 Jun 2022 09:22:33 +0000 (UTC)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id E0E5ECD3B3;
 Sun, 12 Jun 2022 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1655025752; bh=isvXvz151xa9quT3FHp3T0dcyI84C7Y5YBfGdMQhMmA=;
 h=From:To:Cc:Subject:Date;
 b=o9/ANSNedqRJigIQk70MGTfgaC+jNQhcvq9Bl0RmRLiqfBmZcK+iBTW4CC0os403e
 nQ1DJZ4+tjDtbExBe6brM1mH4UNWUq2ZZTnYV+9jv6ZVobjKgTW7vHz6ZG6ha9e0FP
 OCvhLYgAcJCsDUCkWTZlEQwvdPqduG5mXgkqftr0=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Date: Sun, 12 Jun 2022 11:22:12 +0200
Message-Id: <20220612092218.424809-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] MDSS support for MSM8953
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 James Willcox <jwillcox@squareup.com>, freedreno@lists.freedesktop.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca@z3ntu.xyz>,
 iommu@lists.linux-foundation.org, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series adds the APPS IOMMU and the MDSS block for display that is
found on msm8953 SoCs.

Luca Weiss (1):
  dt-bindings: qcom-iommu: Add Qualcomm MSM8953 compatible

Vladimir Lypak (3):
  arm64: dts: qcom: msm8953: add APPS IOMMU
  drm/msm/mdp5: Add perf data for MDP v1.16
  arm64: dts: qcom: msm8953: add MDSS

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   1 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 244 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      |   5 +
 3 files changed, 250 insertions(+)

-- 
2.36.1

