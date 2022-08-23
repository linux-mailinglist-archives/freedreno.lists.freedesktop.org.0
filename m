Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A5259E449
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 15:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7911128B8;
	Tue, 23 Aug 2022 13:32:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F63D10E2DA;
 Tue, 23 Aug 2022 11:59:52 +0000 (UTC)
X-QQ-mid: bizesmtp83t1661255657thh0jeh9
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 19:54:15 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: QityeSR92A2vaqJieZ/C2jnDkFbth8pjx3vQqtP3jMyy0sZWScZTMt10dIAvc
 coxdEzrmw4eC0mba6f9Lyze/fe7WzGcnv9+djNypt7nBnhYE2gAfCzvFj2qEOKmMgr47gH0
 VT3ZJPyrAvJ4IxuF4FwLuzG5l7sMPVeSjQRa12mzDewrUg9tnV6ijeQKaa3VrYx9dMiG9ai
 cRbqb745UVlw7yt5SBOhvTK2sQDL4Ot9mJ3SqHWOZUbpTzUm3rTxpO/85/2q+g7WcfWAGWd
 bAPk+xNZ6YN9O7fPNiKrCp8np5rxQFv0SorgMJnj4hgcfQzyfkEU/wuc1jTjzemU2uQTnfB
 uzk+bcOWk6htSdSKrzDeTI4eqKvcqeiouWuTMeZXVeEZBW/Hav3/c1RFlDogg==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 23 Aug 2022 19:54:09 +0800
Message-Id: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:31:55 +0000
Subject: [Freedreno] [PATCH] drm/msm: fix repeated words in comments
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
Cc: linux-arm-msm@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

 Delete the redundant word 'one'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c75d3b879a53..e300c70e8904 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -118,7 +118,7 @@ struct msm_gem_object {
 	 * An object is either:
 	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
 	 *     (depending on purgeability status)
-	 *  active   - on one one of the gpu's active_list..  well, at
+	 *  active   - on one of the gpu's active_list..  well, at
 	 *     least for now we don't have (I don't think) hw sync between
 	 *     2d and 3d one devices which have both, meaning we need to
 	 *     block on submit if a bo is already on other ring
-- 
2.36.1


