Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0D515FC6
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 20:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1B10EA03;
	Sat, 30 Apr 2022 18:09:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E1A10EA00
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 18:09:20 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y32so19106507lfa.6
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
 b=BvpO04TPgDmJx6pkxWI3UlhkhdLFsL9WBcBRyADD0GuV9sCDLEnTy0W/cFK2zC/nxe
 Y8jTWhZRXimMY+tgCHyRQ/p8goLwo1rnevJU0Ef40MSQl+Ohxg1uyE73ZmRJbB9shuWM
 GDqUEtzPhb5u6BM34uNQJOotHLNfH2Oo0k/7U+jHUarO7elXZcdv1VnRY7h6/dKB01e6
 4wC6vO5rw46TJPKnyBdRfzEOQSL5lH7mM9+4xVrB/96YMUZ735+jNHezMq5zUvcXtdXX
 lmpSXUQ+hRZNSx7y4CGDpeNKJRjlNe4kXYcZZTKjgoGiNxYo9dcbvTtcFBSmaM8xydLF
 L92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
 b=yEKBiJP2lap6yjjGSWPd3zWpE0o8u7Xh6kfQ1hWMFdxeTLj3mg/WqyNV33imPkZWuT
 nCHtV9RHIx/AGZV/YOpaJ6+r3AsidM/rgUat/3QIBwSL5AmW7TMxFH6Kz6mNLhdNYlx/
 qVqxYRxsdCjZyt67bKVk9P63eRaoFI1rkIx/YusZcHMgzY/xLTodPOgSvKO4HgCo3lsM
 b1M1hzfuiF3tu41kHYsCKkMzySza0AnEC0/IbD8GUxbEthVdTAPs6E/9Oo3GIFiIlUvd
 IWRQOSXEFo0p5PY4qGjaBKVNqXONls8sgKlnggcuHOdt9gqGO7Jki8Gl0HW+7mQMyc0n
 h+Fg==
X-Gm-Message-State: AOAM532ISxkZdrxTAkYA0XVZWPSaBL8pXstSQWbSmX4MEMQNGmZLw6f9
 Q8MSOszNf7x+657EfnlYYSyXUw==
X-Google-Smtp-Source: ABdhPJw2eY91hUFi+7oNkK/2T2qyHWtGTfkq3iDxqQaCY9SfqxMm2XuvX/PN6px1rFay88oJuHUAZA==
X-Received: by 2002:ac2:424e:0:b0:46b:9249:8ce3 with SMTP id
 m14-20020ac2424e000000b0046b92498ce3mr3639302lfl.282.1651342158880; 
 Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k12-20020a2e888c000000b0024f3d1daed5sm598428lji.93.2022.04.30.11.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 30 Apr 2022 21:09:17 +0300
Message-Id: <20220430180917.3819294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: add missing include to msm_drv.c
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add explicit include of drm_bridge.h to the msm_drv.c to fix the
following warning:

drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? [-Werror=implicit-function-declaration]

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Fixed file name in the commit message.
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f3dce334553..4a3dda23e3e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-- 
2.35.1

