Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A923C181B9B
	for <lists+freedreno@lfdr.de>; Wed, 11 Mar 2020 15:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5472089973;
	Wed, 11 Mar 2020 14:45:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C6389C8F
 for <freedreno@lists.freedesktop.org>; Wed, 11 Mar 2020 07:34:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CEE9AF5B;
 Wed, 11 Mar 2020 07:34:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Wed, 11 Mar 2020 08:34:10 +0100
Message-Id: <20200311073410.6599-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Wed, 11 Mar 2020 14:45:29 +0000
Subject: [Freedreno] [PATCH] drm/msm: Use scnprintf() for avoiding potential
 buffer overflow
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 7fd29829b2fa..1d5c43c22269 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -673,7 +673,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 		return NULL;
 
 	for (i = 0; i < l; i++)
-		buf_itr += snprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
+		buf_itr += scnprintf(buf + buf_itr, buffer_size - buf_itr, "%s",
 				ascii85_encode(src[i], out));
 
 	return buf;
-- 
2.16.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
