Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CA2F019E
	for <lists+freedreno@lfdr.de>; Sat,  9 Jan 2021 17:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F346E920;
	Sat,  9 Jan 2021 16:32:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97D56E847
 for <freedreno@lists.freedesktop.org>; Sat,  9 Jan 2021 13:51:16 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0F3A51F4EA;
 Sat,  9 Jan 2021 14:51:14 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Date: Sat,  9 Jan 2021 14:51:07 +0100
Message-Id: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 16:31:58 +0000
Subject: [Freedreno] [PATCH 0/5] Clock fixes for DSI 10nm PLL
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com,
 martin.botka@somainline.org, daniel@ffwll.ch,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DSI 10nm PLL driver was apparently ported from downstream, but some
of its "features" were not ported over, for a good reason.
Pity is that the removal of the downstream dependencies broke the clock
calculation logic for this driver and that made it impossible to use any
DSI display on at least MSM8998.

This patch series fixes the calculation issues and also solves some TODOs
that I've found in this driver.

Tested on:
- Sony Xperia XZ Premium (MSM8998) dual-dsi command-mode LCD display
- F(x)Tec Pro1 (MSM8998) single dsi, video-mode OLED display

AngeloGioacchino Del Regno (5):
  drm/msm/dsi_pll_10nm: Fix dividing the same numbers twice
  drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits assignment
  drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation and prescaler
  drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
  drm/msm/dsi_pll_10nm: Convert pr_err prints to DRM_DEV_ERROR

 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 43 ++++++++++------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
