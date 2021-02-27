Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F1326ABE
	for <lists+freedreno@lfdr.de>; Sat, 27 Feb 2021 01:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADDF6E200;
	Sat, 27 Feb 2021 00:26:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D266E200
 for <freedreno@lists.freedesktop.org>; Sat, 27 Feb 2021 00:26:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e9so6159423plh.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Feb 2021 16:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/UVGg/ISF601pQ44Q+AW/V2c0aA7uu1NXfRGhEzBS0=;
 b=keTd5zYbqA9gwk4Uaro+3JqZ9872UDO1JsC80/jsTJxIsyuig3TVI/q4lNsDYk5ftd
 S7N6YBXAhQY7hlWOxjTl0Iic+WFw/i+v7dcGsQzxxBJR8GHd/DbPSSg5Kq9uFsXdrs2/
 L+etcLD4oHplqJ3hp7Wo1d4Tepqr7omII7sT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/UVGg/ISF601pQ44Q+AW/V2c0aA7uu1NXfRGhEzBS0=;
 b=O7m/Bd3z6lUbanAE4nA6h2wZMWZbJcl+If7oQcKySFsnwtsNiXQXmjH9BF3f2fMePj
 dCsdkwjVKLCdsuIA11SvKj9JXkPXqk4qQpz8ZLNVbGOGt0KNYdpBE7gSIuD2stFp8S+/
 3M+LOBumxzh1b8WEY4fVMYKgW2GroKG9dgWUvHi+89lviSk0yutEup43vTQVyeKTf8JB
 KNcnITCqaMgJngEKI+zQZzYpyzXZHaoSFcG0Vit4A/fx81oHqsCL9OpDu1f65fwAuHtM
 fQuBZCbllesvy+Eci0wLPzTPBdlu+CwXMLVLF+RK3Ye4a86i1d3xhLi9LPbAzbWOlP3W
 oEQw==
X-Gm-Message-State: AOAM533h5SK2/vwUD/P1PeyCYTE3hbFKY+VdT7uLyX5+yjsBtfrx4ixK
 1PH7DIeyXrT6ecuVULNb2GWNVg==
X-Google-Smtp-Source: ABdhPJzIq2C5D14QoUWkzHAZD2YlxQuywims+rrfXXpNGQ/xXi+aZQWAi1bXsvy4+Ten03V0eUsjgA==
X-Received: by 2002:a17:90b:1c03:: with SMTP id
 oc3mr6085295pjb.124.1614385586622; 
 Fri, 26 Feb 2021 16:26:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:7525:b50:4b48:1a6d])
 by smtp.gmail.com with ESMTPSA id t6sm9793744pgp.57.2021.02.26.16.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:26:25 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Jordan Crouse <jcrouse@codeaurora.org>
Date: Fri, 26 Feb 2021 16:26:01 -0800
Message-Id: <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210227002603.3260599-1-dianders@chromium.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/3] drm/msm: Fix speed-bin support not to
 access outside valid memory
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
Cc: freedreno@lists.freedesktop.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When running the latest kernel on an sc7180 with KASAN I got this
splat:
  BUG: KASAN: slab-out-of-bounds in a6xx_gpu_init+0x618/0x644
  Read of size 4 at addr ffffff8088f36100 by task kworker/7:1/58
  CPU: 7 PID: 58 Comm: kworker/7:1 Not tainted 5.11.0+ #3
  Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
  Workqueue: events deferred_probe_work_func
  Call trace:
   dump_backtrace+0x0/0x3a8
   show_stack+0x24/0x30
   dump_stack+0x174/0x1e0
   print_address_description+0x70/0x2e4
   kasan_report+0x178/0x1bc
   __asan_report_load4_noabort+0x44/0x50
   a6xx_gpu_init+0x618/0x644
   adreno_bind+0x26c/0x438

This is because the speed bin is defined like this:
  gpu_speed_bin: gpu_speed_bin@1d2 {
    reg = <0x1d2 0x2>;
    bits = <5 8>;
  };

As you can see the "length" is 2 bytes. That means that the nvmem
subsystem allocates only 2 bytes. The GPU code, however, was casting
the pointer allocated by nvmem to a (u32 *) and dereferencing. That's
not so good.

Let's fix this to just use the nvmem_cell_read_u16() accessor function
which simplifies things and also gets rid of the splat.

Let's also put an explicit conversion from little endian in place just
to make things clear. The nvmem subsystem today is assuming little
endian and this makes it clear. Specifically, the way the above sc7180
cell is interpreted:

NVMEM:
 +--------+--------+--------+--------+--------+
 | ...... | 0x1d3  | 0x1d2  | ...... | 0x000  |
 +--------+--------+--------+--------+--------+
              ^       ^
             msb     lsb

You can see that the least significant data is at the lower address
which is little endian.

NOTE: someone who is truly paying attention might wonder about me
picking the "u16" version of this accessor instead of the "u8" (since
the value is 8 bits big) or the u32 version (just for fun). At the
moment you need to pick the accessor that exactly matches the length
the cell was specified as in the device tree. Hopefully future
patches to the nvmem subsystem will fix this.

Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba8e9d3cf0fe..0e2024defd79 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1350,35 +1350,20 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 		u32 revn)
 {
 	struct opp_table *opp_table;
-	struct nvmem_cell *cell;
 	u32 supp_hw = UINT_MAX;
-	void *buf;
-
-	cell = nvmem_cell_get(dev, "speed_bin");
-	/*
-	 * -ENOENT means that the platform doesn't support speedbin which is
-	 * fine
-	 */
-	if (PTR_ERR(cell) == -ENOENT)
-		return 0;
-	else if (IS_ERR(cell)) {
-		DRM_DEV_ERROR(dev,
-				"failed to read speed-bin. Some OPPs may not be supported by hardware");
-		goto done;
-	}
+	u16 speedbin;
+	int ret;
 
-	buf = nvmem_cell_read(cell, NULL);
-	if (IS_ERR(buf)) {
-		nvmem_cell_put(cell);
+	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
+	if (ret) {
 		DRM_DEV_ERROR(dev,
-				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
+			      ret);
 		goto done;
 	}
+	speedbin = le16_to_cpu(speedbin);
 
-	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
-
-	kfree(buf);
-	nvmem_cell_put(cell);
+	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
 done:
 	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
