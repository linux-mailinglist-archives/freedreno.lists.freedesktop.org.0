Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE61460FB
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2020 04:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C49E6F97A;
	Thu, 23 Jan 2020 03:33:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF46F976;
 Thu, 23 Jan 2020 03:33:37 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2086EF4ECCCD3E17BF0F;
 Thu, 23 Jan 2020 11:33:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Thu, 23 Jan 2020 11:40:39 +0800
Message-ID: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH 0/4] drm/msm/dpu: fix comparing pointer to 0
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

Zheng Bin (4):
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_cmd.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_vid.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_vbif.c
  drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c             |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

--
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
