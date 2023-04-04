Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719FC6D6221
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532D10E6A5;
	Tue,  4 Apr 2023 13:09:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F710E6A0
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:14 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx10so15434159ljb.8
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5DzP7VQXaovbBEaHhSn8d2fnDDu3UNhzVu3sEmgPTg=;
 b=Cdt6Q6e3BpOfk47aRMYsXT5f6VKoqOqJefA2PWdGGOedRgEaibzvA0RmUW6RXlMISs
 U8vQllmPDAD1B2AfAA9ZW4pQflTZD1bCwNyKLMUQiKvLvO7TwEbnYT8vOYyiXGXPcNxC
 7sf6XCM6II1UYVfw/oHYL21groXsY8EwzlrTtBICRtnmkKO5383eCXhaaXv9B8M1cuKQ
 +0TPMUOdSWc+SJy7SncR3PnGfOzRamaWBlqjmiPMruwft1XiD7YOo4JzLv4blKfuQhOg
 bqoz1/NyE7QFy6Xq/EeKAFPDoakmwidOpXU8E3RcE0JfyLNDZ5MO3ZjrMzCddqg79h5t
 zqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5DzP7VQXaovbBEaHhSn8d2fnDDu3UNhzVu3sEmgPTg=;
 b=b24gZ4TPbMRpxsSOeOt4/+jphoezfQ61CEdtwnu44AUMZzhpUO2X7LS4PxOOjoXEfc
 H+TdSLYlp+C7/m/JwN+3ZThlse/VoOcuC7lpPCIqbd3d59d7pOwti+XCMzAaM+UuqpZG
 jcI47o3WdUjMjn0bS+HtaqQD619mVCeAH0J0tqKUQu+XUeXaiBDRrRw3ju1TJ/735qI/
 CDCfu4AZKZeHesoZ2NVDcO3wLvBLzlCONMBk6ChoP0bmDoRA2hFZbFu3VV/py3jdrNqn
 bKaJMZeIPGbi1jr5KhsQDOjQtz2F3Z8EAdn7BdfxEp+kP0sI2Xrclr2ewfwCn5haGUNo
 /Ttw==
X-Gm-Message-State: AAQBX9daPTILKq6mk4zIYfpZfV8XwHKzorT7J0xdoDv3HtjdkjtTqzWG
 6zGMHqXyV0Nl8KMa2XSmSBVpzQ==
X-Google-Smtp-Source: AKy350aSUWdS5/5HcEQbLtfJ5CCKkQDo2lvXSD84geCKRhjo7K3Xp48gqFlnFF4yTZxfof6foYIU9w==
X-Received: by 2002:a2e:9586:0:b0:293:2c65:20c8 with SMTP id
 w6-20020a2e9586000000b002932c6520c8mr744004ljh.1.1680613754364; 
 Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:04 +0300
Message-Id: <20230404130622.509628-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 24/42] drm/msm/dpu: duplicate sm8350 catalog
 entries
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Duplicate some of sm8350 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d8435c55c396..39894cbf456d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -135,6 +135,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
+static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
@@ -190,8 +196,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
-	.merge_3d = sm8350_merge_3d,
+	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
+	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

