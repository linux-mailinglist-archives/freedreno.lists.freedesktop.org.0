Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5428BCB8
	for <lists+freedreno@lfdr.de>; Mon, 12 Oct 2020 17:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DFE6E51C;
	Mon, 12 Oct 2020 15:46:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 12 Oct 2020 14:00:48 UTC
Received: from smtp2207-205.mail.aliyun.com (smtp2207-205.mail.aliyun.com
 [121.197.207.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BF6E484;
 Mon, 12 Oct 2020 14:00:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3466635|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.0583757-0.0215271-0.920097;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=frank@allwinnertech.com; NM=1;
 PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.IiEO.rd_1602510932; 
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com
 fp:SMTPD_---.IiEO.rd_1602510932)
 by smtp.aliyun-inc.com(10.147.41.137);
 Mon, 12 Oct 2020 21:55:38 +0800
From: Frank Lee <frank@allwinnertech.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, eric@anholt.net, tiny.windzz@gmail.com,
 kholk11@gmail.com, emil.velikov@collabora.com, gustavoars@kernel.org
Date: Mon, 12 Oct 2020 21:55:14 +0800
Message-Id: <20201012135517.19468-1-frank@allwinnertech.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Oct 2020 15:46:06 +0000
Subject: [Freedreno] [PATCH 0/3] Introduce devm_pm_opp_set_* API
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
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi, this patchset introduce devm_pm_opp_set_prop_name() and
devm_pm_opp_set_supported_hw().

Yangtao Li (3):
  opp: Add devres wrapper for dev_pm_opp_set_supported_hw
  opp: Add devres wrapper for dev_pm_opp_set_prop_name
  drm/msm: Convert to devm_pm_opp_set_supported_hw

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
 drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
 include/linux/pm_opp.h                | 14 +++++
 3 files changed, 95 insertions(+), 1 deletion(-)

-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
