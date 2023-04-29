Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBD6F2694
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 23:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E3F10E1D3;
	Sat, 29 Apr 2023 21:25:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2410E1D4
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 21:25:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so1543559e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682803513; x=1685395513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YzZiLQ1RhTm38hAxrhMQzyPsWjTgF1J/NPZGUhERY3E=;
 b=N7FoHRYFf4K1l/3EoarHccuAcPRdzs9127z9uCcZVmMTtyZf8mhh6dvHIRbxVKkHUY
 ZiyMwkOzIWmSPyzzfgDx1EMRylzGT4g8dD+IA0TQRvor1DE0KYvM8Oo6AvzzyK1YAsU4
 KCPdyQfOP1TrBTPAJboRLVYBaJG5k4fzzPC5Jqt6WeThEI3vOnc87sNDwa4TkrVZbYfM
 zr7lSqTL0gPD03E/JL3L92e97gmTvwlUDf79XntaAYSuGFzxfXy/rV7rMXEl29fWmrO3
 cOIE1621/pu/C44LCTYv9V1yD9HhoNTAeFbr0zBIT7N0XxsjfHDpBxrc+ACZPrN6nDia
 N7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682803513; x=1685395513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YzZiLQ1RhTm38hAxrhMQzyPsWjTgF1J/NPZGUhERY3E=;
 b=VxrgZNRHIZ5EtbZsqovMfnVVLSzqE4ORR/eS07dpLs3bZn9Wu0ZAmLgtTCgrycOYqb
 pN6D3YtF//3gwvTrJJv4+4kt2PdnTGdHTyDrfXr0sXaUfF2uytNSn7Y+GkI8cUJIif4t
 N6GVPZMl/nF76pVQqkpqLUaIYOSlvNwQHogXAhuwfNenM+ZUhiVs9lgGAPKl64BiIZkS
 SImtZWzigOJ1Pdwc1iect0vlWg78fO3/fI67848NTFP7YLLxB7JB7+aIjrlmM/q+etBv
 58N12yXI8/mNj7SL/5H0tLSCQ0XpgLVzUEnw0VUJNQBhRKuIqoeBV3/SlnBkEtiIsUzM
 +rGA==
X-Gm-Message-State: AC+VfDx6cFwhw+elSj6nJn4RzB9jyThZZ4bf4ByWbc6m5PRJuPConuud
 szoDpeNieHYYdgzOXwkTCAPtTw==
X-Google-Smtp-Source: ACHHUZ6F33DBbHIwsessNyI4Vtu3/pIFgR7cmO5CUmi6h8UUWtP/uJ1DYP/Tcx8WzQP9aq9U758YHQ==
X-Received: by 2002:ac2:4904:0:b0:4f0:da5:773f with SMTP id
 n4-20020ac24904000000b004f00da5773fmr2594598lfi.25.1682803513079; 
 Sat, 29 Apr 2023 14:25:13 -0700 (PDT)
Received: from eriador.lan (78-27-120-86.bb.dnainternet.fi. [78.27.120.86])
 by smtp.gmail.com with ESMTPSA id
 w14-20020ac25d4e000000b004eed8de597csm3929345lfd.32.2023.04.29.14.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 14:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 30 Apr 2023 00:25:12 +0300
Message-Id: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block
 information
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2:
- Fixed commit message to remove igc block mention.

Changes since v1:
 - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 69d1f1e59db1..b2831b45ac64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -380,9 +380,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

