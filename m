Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958929ECCBE
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 14:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79710EB47;
	Wed, 11 Dec 2024 13:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O5GWYC3l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6410EB49
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:04:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3258822f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 05:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733922273; x=1734527073; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4vcNvdRQck5PexrgH0iivqnvEVdJtfPxrI2rBVxQcFQ=;
 b=O5GWYC3llcIm6drGDMCmPU4/MGz0oxlfjBhWhZG3dn//16Myk0ptbFc0DAiqaGOcAq
 2dCnEFh5En6Wp/iKM3dDT5ZPMHMKHx6MAE+/Q1bE2SRIMrwt4aqS7dk9RlhgTSV7Ig0m
 LwfxMpuve/4MDWAPbzzHcKxdCwNRVUyap048h+MpzkuLG2f3PBLGdrhId6Qimc+4L0OA
 MBdvQSFGw4OF++q7cG41ZHt2KJutil9GZOXb3TQsqQB19I+IF1Rm5WmwsC11XjoeHjAn
 zFYVXCOSpffo5Pzm+mfBh+x1JxZFKT+0d3IHlUuPTPUxGYH2/wsrjgMlgAcT2AYaYgac
 DK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733922273; x=1734527073;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vcNvdRQck5PexrgH0iivqnvEVdJtfPxrI2rBVxQcFQ=;
 b=ft0Gzlqme13Zi2I96JCsuO/m6rKxpIk44L5d54yG216kcb7UI1tAxZNr80Vi4L9NKn
 rUqjo5oSpbXaFvsxrEq9daAwaQF4dr/TUPj1fHUB192Fc7TIrvWHgQq7WXkGch6WkJ1O
 QtJu1FI+KDCVvcOqmZLkMyVOEDQ3GUtJ2h8XFJzG6XeAD9QDGh4m8qhzXYo13HzhxLjy
 boYvI36UCy7z6klWTWN9gbPPtmjOYIsAlEjRnvDECC31JI4wEUsIz3CsswVuHCCTVbfQ
 UbyzG72CNDbYpxF4tk+VsN9Lv6Jt8O4MgpsSufQbn/+/hezbh0A66XMc9E/3tmVQmbaf
 NR7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEO6nN4navKh9UXUlXJvGKZ75T0Co6V5yuLRliseztn0EBOe4/6XoQQG5NvJuiW2X9A0/FI8RglWs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUwc//tbq7i+CXv0j5Xg2RN23xBJtQhF2ErjNFCKXgdbt604V8
 LfhEKhm9RjSigqiw7uUmxBnUtQWN7dNhytwJSEV4YaTauKLE2Uom6mvzPx7c/sM=
X-Gm-Gg: ASbGncuNdVMF4XMOPP18uInOvORlFtbvuEXte9xFW6gcz90H0pGUZNd+N2g8sf0/9zN
 U5yyod8E8/ktck3SQDWp7tp+6QTKwrp7civUZveAyK5p19dcvYkYY5v/USRqFGLtCt+3Za8w9J8
 ramrjHlLzwrByEc/EQvj3eVWf4iu61lfhPtbB1T37hOnBkuLQKiycuvQ7Q4MFxEPAJMochJFkY1
 ap0pncltLdaDmhKy37FVzr/Xc/tSDXKN9DyjgR8BShFH/1vGDbknA==
X-Google-Smtp-Source: AGHT+IHGNMAtT86/Ll/waDUhwZx90OxCs6KJuTJWJULw9nEvrDR6OYRpOHWgU0GB0l6D/LQb2iNCOw==
X-Received: by 2002:a05:6000:2a3:b0:385:f6b9:e762 with SMTP id
 ffacd0b85a97d-3864cec3a86mr2328956f8f.36.1733922272749; 
 Wed, 11 Dec 2024 05:04:32 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 05:04:32 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:13 +0200
Subject: [PATCH v2 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-2-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=+kjpSyZKMfYDv7GSGvBVLk0oNBwdg69xxssowfQbXBQ=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3WaTT+6VyZh/3rm82/2TydUPnkTOBrLlbTe
 +haYEToEU6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN1gAKCRAbX0TJAJUV
 Vv+EEAC/mhtx4BAo7l+Gpv7VfDJluKQ2IVW2JLA7gcOtRG3KrQ2/7TWoudUHdxCdj7ntdS+AnsM
 clIT7XQej+oMg6vOX1ZCXxtpgnAEUw6dZpkmhzOYWol6pF2ijiTaabFDaE4hxbjS09E5UrRZM7L
 E9wBLGyv24EGZgibP130Ecc9BM9ssTSQedas/qKUgRrrggCoyv2M4Jp6NRpSNuun+whR+CXSMT9
 kxLmdTXL2xT7zAKn2sZcwW/AmK4HYFCFvctGDBadMaiVeHuxGmZJ5iZ2hM1n7bJVw6YXz8p0f/C
 KxyW7r1DTixUkJgcrtKAkeiM+DmuWpfenRgJjbc7FlA6jh01UD/kbm1l3sYNjpmQpIML0BDirLI
 uZ5gbyQ8/zrV3uJpS9ZT5p1SontVtUSOh+PZhGnB3y8cYILLJbxLw1BiljIx9OtFy1d7gSUsJtd
 6MCwPHrB6gUSO608/zFBFJQTuBU4S/xPoKqtEJ1WORQ3QEsF5K5LGTbLeZWedVe24NDrFrKlqbl
 yI5lqEJ/KYUB/ecDm7+9AnH/8At1uJUrzKPhY+MCdOyZNR4zr56pMxHGPqyZWgvQPFvC3UibWrI
 PpQg/dk4ZYkrxuDOet/C0VL4bGZMh1CxyUhO5OyuCK8MP16O/ETSv+MgSpzUrkRtUS87sATbAz3
 05z8rijWelGI5Ng==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1

