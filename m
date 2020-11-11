Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0C2AEBF5
	for <lists+freedreno@lfdr.de>; Wed, 11 Nov 2020 09:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9806589FCA;
	Wed, 11 Nov 2020 08:32:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m176115.mail.qiye.163.com (m176115.mail.qiye.163.com
 [59.111.176.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CC89FCA;
 Wed, 11 Nov 2020 08:32:01 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by m176115.mail.qiye.163.com (Hmail) with ESMTPA id ADB9D6672A5;
 Wed, 11 Nov 2020 16:31:47 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brian Masney <masneyb@onstation.org>, Shawn Guo <shawn.guo@linaro.org>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@redhat.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2020 00:31:17 -0800
Message-Id: <20201111083131.39817-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSU5KSRhNSR0ZSRpKVkpNS05LQ0hOS0NKT0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phw6PSo5Dz8aNxcsSwguCRYI
 MUoKFCxVSlVKTUtOS0NITktDTk1PVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSU1PTDcG
X-HM-Tid: 0a75b66ead6d9373kuwsadb9d6672a5
Subject: [Freedreno] [PATCH 0/5] add KERN_LEVEL to printk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi:

When call printk, set the KERN_LEVEL is suggested by the community.
This patch sereies add KERN_* level to printk which do not set
this level.

Bernard Zhao (5):
  adreno/a2xx_gpu.c: add KERN_LEVEL to printk
  adreno/a3xx_gpu.c: add KERN_LEVEL to printk
  adreno/a4xx_gpu.c: add KERN_LEVEL to printk
  adreno/a5xx_gpu.c: add KERN_LEVEL to printk
  adreno/adreno_gpu.c: add KERN_LEVEL to printk

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 +++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.29.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
