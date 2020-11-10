Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D982AD0E7
	for <lists+freedreno@lfdr.de>; Tue, 10 Nov 2020 09:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0323898C0;
	Tue, 10 Nov 2020 08:11:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D15898BC
 for <freedreno@lists.freedesktop.org>; Tue, 10 Nov 2020 08:11:01 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 994491A3B66;
 Tue, 10 Nov 2020 16:10:24 +0800 (CST)
Message-ID: <AGIA*AAMDRjj8OgGeBDLQarV.1.1604995824613.Hmail.bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Drew Davenport <ddavenport@chromium.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Zheng Bin <zhengbin13@huawei.com>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.157
MIME-Version: 1.0
Received: from bernard@vivo.com( [58.213.83.157) ] by ajax-webmail (
 [127.0.0.1] ) ; Tue, 10 Nov 2020 16:10:24 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 10 Nov 2020 16:10:24 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSxhNHkofHhpIHR9CVkpNS09CQk5DSU9MSkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo8MjpROjo2PykREUM0HDweOT83
 KhoJLVVKVUpNS09CQk5DSU5JS09VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWU5DVUlK
 SFVDSFVKTkxZV1kIAVlBSE9LQzcG
X-HM-Tid: 0a75b134bc0a93b4kuws994491a3b66
Subject: [Freedreno] =?utf-8?q?=5BResend=5D=5BPATCH=5D_drm/msm=3A_delete_?=
 =?utf-8?q?conversion_from_bool_value_to_bool_variable?=
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove the conversion from bool value to bool variable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c258b553..e99a543da243 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1362,7 +1362,7 @@ void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
 	unsigned long lock_flags;
 	bool enable;
 
-	enable = frame_event_cb ? true : false;
+	enable = (frame_event_cb != NULL);
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
-- 
2.29.0



_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
