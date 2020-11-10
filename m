Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983A2AD0E8
	for <lists+freedreno@lfdr.de>; Tue, 10 Nov 2020 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF85898BF;
	Tue, 10 Nov 2020 08:11:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFF0898BF
 for <freedreno@lists.freedesktop.org>; Tue, 10 Nov 2020 08:11:02 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 6443F1A3B86;
 Tue, 10 Nov 2020 16:10:27 +0800 (CST)
Message-ID: <AI*ANACSDfnjQejyeNXUnKoQ.1.1604995827401.Hmail.bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Drew Davenport <ddavenport@chromium.org>, 
 Bernard Zhao <bernard@vivo.com>, Zheng Bin <zhengbin13@huawei.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.157
MIME-Version: 1.0
Received: from bernard@vivo.com( [58.213.83.157) ] by ajax-webmail (
 [127.0.0.1] ) ; Tue, 10 Nov 2020 16:10:27 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 10 Nov 2020 16:10:27 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTB5JGUhOGkkdTR9LVkpNS09CQk5DSUxPQ05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzoyUTo1OjgoPx0VESoeEQIeNSMu
 FTAUKlVKVUpNS09CQk5DSUxCQk1VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWU5DVUlK
 SFVDSFVKTkxZV1kIAVlBSUJDTzcG
X-HM-Tid: 0a75b134c6e093b4kuws6443f1a3b86
Subject: [Freedreno] =?utf-8?q?=5BResend=5D=5BPATCH=5D_drm/msm=3A_delete_?=
 =?utf-8?q?conversion_from_bool_value_to_bool_return?=
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Delete the conversion from bool value to bool function return.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 8493d68ad841..411222f4cd6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -37,7 +37,7 @@
 
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 {
-	return (phys_enc->split_role != ENC_ROLE_SLAVE) ? true : false;
+	return (phys_enc->split_role != ENC_ROLE_SLAVE);
 }
 
 static bool dpu_encoder_phys_cmd_mode_fixup(
-- 
2.29.0



_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
