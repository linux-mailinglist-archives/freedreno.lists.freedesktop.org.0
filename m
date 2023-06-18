Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C29734769
	for <lists+freedreno@lfdr.de>; Sun, 18 Jun 2023 19:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3151710E0FF;
	Sun, 18 Jun 2023 17:58:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 481 seconds by postgrey-1.36 at gabe;
 Sun, 18 Jun 2023 15:02:42 UTC
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898D810E080
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jun 2023 15:02:42 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QkbXD5fTMzBJTDD
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jun 2023 22:54:36 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1687100076; x=
 1689692077; bh=Ycho+bN0cSAaFhdFtGizO8c/EFquN3+WpUviiSP5YR8=; b=F
 XPLeXBJWSqqIFstR0Ml+DtnxWTCvt8+m+az5wy7SbjOK1ylQkI/L3me/JCn/HFdE
 vas70yi+BmShFLXHLSoDDdteQUSx7rEiLEVCHDx9SSyT7veTBQ+IBhSC8Y3uMFG5
 TfLhOgfpEeIvRB/HzfRo1LKZqY4T25EaQVaUo5QVzrXpAsV5r+BAkL+e+DyTRdm5
 SoTmpclXZXpfhP0g1KMcYpnnUqMNbl/y+Sjmp9ELWYWF4OLp3pSpufCabem3hZA6
 UQKObqJTpBpWqwGt3qfQwLYePO1cDcFuIUYU28XWhIWARFGQQgIXCmIalVQB4QLH
 U7UcTIJTr72YPT6QfKUAA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vMdrRtApx3b2 for <freedreno@lists.freedesktop.org>;
 Sun, 18 Jun 2023 22:54:36 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QkbXD111szBJJDJ;
 Sun, 18 Jun 2023 22:54:36 +0800 (CST)
MIME-Version: 1.0
Date: Sun, 18 Jun 2023 22:54:36 +0800
From: zhumao001@208suo.com
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, sean@poorly.run
In-Reply-To: <20230618143813.15142-4-dengshaomin@cdjrlc.com>
References: <20230618143813.15142-1-dengshaomin@cdjrlc.com>
 <20230618143813.15142-4-dengshaomin@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <610b47a2989976b9dae162ecc55ddc85@208suo.com>
X-Sender: zhumao001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_bd33facbe9810b6ba40fa09dc0a42d93"
X-Mailman-Approved-At: Sun, 18 Jun 2023 17:58:51 +0000
Subject: [Freedreno] [PATCH] drm/msm: Fix typo in comment
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--=_bd33facbe9810b6ba40fa09dc0a42d93
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Fix typo in comment of msm_gem.c.

Signed-off-by: Zhu Mao <zhumao001@208suo.com>
---
  drivers/gpu/drm/msm/msm_gem.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c 
b/drivers/gpu/drm/msm/msm_gem.c
index 20cfd86d2b32..ef81074416af 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -503,8 +503,8 @@ void msm_gem_unpin_locked(struct drm_gem_object 
*obj)

  /* Special unpin path for use in fence-signaling path, avoiding the 
need
   * to hold the obj lock by only depending on things that a protected by
- * the LRU lock.  In particular we know that that we already have 
backing
- * and and that the object's dma_resv has the fence for the current
+ * the LRU lock.  In particular we know that we already have backing
+ * and that the object's dma_resv has the fence for the current
   * submit/job which will prevent us racing against page eviction.
   */
  void msm_gem_unpin_active(struct drm_gem_object *obj)
--=_bd33facbe9810b6ba40fa09dc0a42d93
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Fix typo in comment of msm_gem.c.<br /><br />Signed-off-by: Zhu Mao &lt;zhu=
mao001@208suo.com&gt;<br />---<br />&nbsp;drivers/gpu/drm/msm/msm_gem.c | 4=
 ++--<br />&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br /><br /=
>diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c=
<br />index 20cfd86d2b32..ef81074416af 100644<br />--- a/drivers/gpu/drm/ms=
m/msm_gem.c<br />+++ b/drivers/gpu/drm/msm/msm_gem.c<br />@@ -503,8 +503,8 =
@@ void msm_gem_unpin_locked(struct drm_gem_object *obj)<br />&nbsp;<br />&=
nbsp;/* Special unpin path for use in fence-signaling path, avoiding the ne=
ed<br />&nbsp;&nbsp;* to hold the obj lock by only depending on things that=
 a protected by<br />- * the LRU lock. &nbsp;In particular we know that tha=
t we already have backing<br />- * and and that the object's dma_resv has t=
he fence for the current<br />+ * the LRU lock. &nbsp;In particular we know=
 that we already have backing<br />+ * and that the object's dma_resv has t=
he fence for the current<br />&nbsp;&nbsp;* submit/job which will prevent u=
s racing against page eviction.<br />&nbsp;&nbsp;*/<br />&nbsp;void msm_gem=
_unpin_active(struct drm_gem_object *obj)</div>

</body></html>

--=_bd33facbe9810b6ba40fa09dc0a42d93--
