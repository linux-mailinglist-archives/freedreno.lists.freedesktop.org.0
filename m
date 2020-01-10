Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF58137A4B
	for <lists+freedreno@lfdr.de>; Sat, 11 Jan 2020 00:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF9C6E154;
	Fri, 10 Jan 2020 23:39:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x761.google.com (mail-qk1-x761.google.com
 [IPv6:2607:f8b0:4864:20::761])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF17E6E0F7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 23:34:32 +0000 (UTC)
Received: by mail-qk1-x761.google.com with SMTP id j9so3632778qkk.1
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 15:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JkA31GZpJRUyVVUsPStUs3rgd5bRAqZiLZmu7zu6/GQ=;
 b=hi3kqs0/iEd8KL08eEsi4saGpuTaYSldKqanEeVfoiR1rHqzprQSFfYfIWo8IYFLrS
 VGhl45T75WIp7WZPR95KFzoPjCJVfVs60vJ5eHT8fuiPrY1Gyc71zB/XrQdHb+YAyKsM
 Snlrd4zfj+3sAYnnTKazCT8dths3KYuRJxM+WoeglDNOLBMshDKxiyqCOPLMPq9OXdH5
 l5jZiWlSpPB3LbJxUWHMekRNQrEWhjz26Pd+jqntD7GTGpDt37eQPR+A+wE45u1K6JtE
 yXImu4RjtWSKvOsN1e1GwKmGUOLciXehrHwempwAa4AyNJRegaiAxwDUd984WEFEYRjx
 BeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JkA31GZpJRUyVVUsPStUs3rgd5bRAqZiLZmu7zu6/GQ=;
 b=LCOqyo5Qhh1IZV2GI0Jh1YjANecaQoKiA23zvb8UDMhBMdgeaWW9At4bkrTvZTBI8M
 dJMYssIo24vPDtdlcr6FCWu8oss3ZEjIOntwqzAYxX0LGJt/hrs4uxpKhL19Q6YhCmRw
 /P3a0m3GJrgKetG+Lbo7Nj2tJnbxzduVxcneIPB/eIX1nWxGNKNS1dek2u+C4PFugqjV
 alePozKjQRIEu3SOqvS6i2Ywy+pdHRx7AIXckfzGLkIh1mt/XS9N+dKs9CNMUxvZGmn5
 0vtUfkvn/aGB5UU7e/yVkpBtXvuTNf3ULr9ykKOIvgWOQ0m7Ej5AQFD9mQ06pEV87EuW
 A1+g==
X-Gm-Message-State: APjAAAWiLeUkt1NUNjPmVW5vKac37b0DcYQY352BpftV01vmIfgVzZUB
 m5uwaMqJ8Vcu2dzEQNU2jac0fTkbdjynFP6iAeB730/eia5wBA==
X-Google-Smtp-Source: APXvYqwf9ulUEPzkERqKok65zzZZAm6h/AKyiri0/kunkZjN607FAMCduP2BhVAD77ZuOlUkAquejCAEsNgb
X-Received: by 2002:a05:620a:4a:: with SMTP id
 t10mr1144916qkt.296.1578699272001; 
 Fri, 10 Jan 2020 15:34:32 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id h26sm433007qkj.2.2020.01.10.15.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:34:31 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jan 2020 18:33:50 -0500
Message-Id: <20200110233350.138471-3-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200110233350.138471-1-brian@brkho.com>
References: <20200110233350.138471-1-brian@brkho.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jan 2020 23:39:11 +0000
Subject: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
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
Cc: robdclark@chromium.org, hoegsberg@chromium.org, Brian Ho <brian@brkho.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implements an ioctl to wait until a value at a given iova is greater
than or equal to a supplied value.

This will initially be used by turnip (open-source Vulkan driver for
QC in mesa) for occlusion queries where the userspace driver can
block on a query becoming available before continuing via
vkGetQueryPoolResults.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 60 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h    | 12 +++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..57b3f12182fe 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -36,10 +36,11 @@
  *           MSM_GEM_INFO ioctl.
  * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
  *           GEM object's debug name
- * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
+ * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
+ * - 1.6.0 - Add WAIT_IOVA ioctl
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	5
+#define MSM_VERSION_MINOR	6
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
@@ -952,6 +953,60 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
 
+static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gem_object *obj;
+	struct drm_msm_wait_iova *args = data;
+	ktime_t timeout = to_ktime(args->timeout);
+	unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
+	struct msm_gpu *gpu = priv->gpu;
+	void *base_vaddr;
+	uint64_t *vaddr;
+	int ret;
+
+	if (!gpu)
+		return 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	base_vaddr = msm_gem_get_vaddr(obj);
+	if (IS_ERR(base_vaddr)) {
+		ret = PTR_ERR(base_vaddr);
+		goto err_put_gem_object;
+	}
+	if (args->offset + sizeof(*vaddr) > obj->size) {
+		ret = -EINVAL;
+		goto err_put_vaddr;
+	}
+
+	vaddr = base_vaddr + args->offset;
+
+	/* Assumes WC mapping */
+	ret = wait_event_interruptible_timeout(
+			gpu->event, *vaddr >= args->value, remaining_jiffies);
+
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+		goto err_put_vaddr;
+	} else if (ret == -ERESTARTSYS) {
+		goto err_put_vaddr;
+	}
+
+	msm_gem_put_vaddr(obj);
+	drm_gem_object_put_unlocked(obj);
+	return 0;
+
+err_put_vaddr:
+	msm_gem_put_vaddr(obj);
+err_put_gem_object:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
+}
+
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
@@ -964,6 +1019,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
 };
 
 static const struct vm_operations_struct vm_ops = {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0b85ed6a3710..8069e5628c5e 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -298,6 +298,16 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+/* This ioctl blocks until the u64 value at bo + offset is greater than or
+ * equal to the reference value.
+ */
+struct drm_msm_wait_iova {
+	__u32 handle;          /* in, GEM handle */
+	struct drm_msm_timespec timeout;   /* in */
+	__u64 offset;          /* offset into bo */
+	__u64 value;           /* reference value */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -315,6 +325,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_WAIT_IOVA      0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -327,6 +338,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
 
 #if defined(__cplusplus)
 }
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
