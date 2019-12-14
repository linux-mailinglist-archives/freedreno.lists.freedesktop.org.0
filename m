Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1165F11F12A
	for <lists+freedreno@lfdr.de>; Sat, 14 Dec 2019 10:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A52E6E09C;
	Sat, 14 Dec 2019 09:40:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD266E32C
 for <freedreno@lists.freedesktop.org>; Sat, 14 Dec 2019 09:40:34 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 789BE513A76B2BD7BFE2;
 Sat, 14 Dec 2019 17:24:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 17:24:28 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Date: Sat, 14 Dec 2019 17:31:46 +0800
Message-ID: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH 0/4] drm/msm: Remove unneeded semicolon
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

zhengbin (4):
  drm/msm/hdmi: Remove unneeded semicolon
  drm/msm/mdp5: Remove unneeded semicolon
  drm/msm/dpu: Remove unneeded semicolon in dpu_plane.c
  drm/msm/dpu: Remove unneeded semicolon in dpu_encoder.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c    | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

--
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
