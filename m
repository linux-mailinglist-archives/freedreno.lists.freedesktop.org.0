Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD15FB4AD
	for <lists+freedreno@lfdr.de>; Tue, 11 Oct 2022 16:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DFF10E577;
	Tue, 11 Oct 2022 14:38:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0E110E7D4
 for <freedreno@lists.freedesktop.org>; Tue, 11 Oct 2022 07:55:28 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 w190-20020a257bc7000000b006c0d1b19526so4683740ybc.12
 for <freedreno@lists.freedesktop.org>; Tue, 11 Oct 2022 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r9hdE1ma60AvuVxA5HLJSW2/ZKfSQyXvLxIYq7eW4LQ=;
 b=GK1Ld7Snxtw6fTjzpXViebq+kfUfdvfDmnwHCV5VQCaew+nzUmYh31FH71I8LuTTuP
 Ar2ugsAB59c4cj7rlU/8GrExj0cdhTRc31UiXK4i3ARDbvJ2XxaNCJGOTlgjmRo0I5e4
 plBAm5AeIQL/jC5xlZwm/uzXx87VsSj0UdEi73uOcA4UHFI+fcWuz8Dc2/i+UjLruvj2
 c2RWRKjiZEKfCqoUjV34QpqZXerwEJiqbPAGubElw8f7KjQfdR0zx8O2p/dWNsQiVeYY
 vm8M7uapP7F9yZq9w9TcPebfB8LjQ4aXFX2nvuE3XbTDdhA3GttZaGwrfHQR2Wvu3WaU
 dg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r9hdE1ma60AvuVxA5HLJSW2/ZKfSQyXvLxIYq7eW4LQ=;
 b=aMgIldfpWjO9YiNtgnMhg7fYrkDXuPPRKnBUpEyYoK2lTGIYPvXa92Bw+6vI7gr+uY
 JumC64RXcp4M72BlzOnkGH4CdR0+HILobPBji18qG4w/TwYK8r4ROYnDc2kf2mJqrRTq
 ewfBv48lMoi3NR0d0G3eWv1L8f4Ar1whg7SV+koOAdb2XIBMxK1XXPvVrYjY9SurfJAR
 PiWDkDpXSsdJV72St3jTyY1rykWIFQBufwcq7CDYUj19eVhheCaOtykAOJK8AQcwiob9
 3g48ytpEre6OZIk5W1wYZUPuEVEJc5K7aUV35TFE3LWJHJO1f0dJhqwalSw4cqT55qe1
 tHDA==
X-Gm-Message-State: ACrzQf3xM25mHvnmcjZXSX/i1qPDpfQZxvp6BuA/eDae5eXD/F5Mlbqg
 pq5IDi2VvS+wcMILLmZ7FoA8K/OqCjCR
X-Google-Smtp-Source: AMsMyM4AquAT123mEtwqvuKxEJ9kf71pBi3ilDdgVY1MCVJH189FexuumcZnRxDHTRKsb2XAtqTTjkL0eCt4
X-Received: from ezekiel.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a0d:e581:0:b0:356:cd48:a936 with SMTP id
 o123-20020a0de581000000b00356cd48a936mr20553028ywe.397.1665474927474; Tue, 11
 Oct 2022 00:55:27 -0700 (PDT)
Date: Tue, 11 Oct 2022 13:25:19 +0530
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221011075519.3111928-1-shraash@google.com>
From: Aashish Sharma <shraash@google.com>
To: Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 11 Oct 2022 14:38:01 +0000
Subject: [Freedreno] [PATCH] drm/msm: Remove redundant check for 'submit'
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
Cc: Sean Paul <sean@poorly.run>, Aashish Sharma <shraash@google.com>,
 kernel test robot <lkp@intel.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rectify the below smatch warning:
drivers/gpu/drm/msm/msm_gem_submit.c:963 msm_ioctl_gem_submit() warn:
variable dereferenced before check 'submit'

'submit' is normally error pointer or valid, so remove its NULL
initializer as it's confusing and also remove a redundant check for it's
value.

Signed-off-by: Aashish Sharma <shraash@google.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5599d93ec0d2..74fe1c56cd65 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -706,7 +706,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit = NULL;
+	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -946,8 +946,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (submit)
-		msm_gem_submit_put(submit);
+	msm_gem_submit_put(submit);
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
-- 
2.38.0.rc2.412.g84df46c1b4-goog

