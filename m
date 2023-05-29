Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE3714AF7
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 15:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACA210E2AD;
	Mon, 29 May 2023 13:53:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B24110E2AE
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 13:52:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f5021faa16so1034242e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368370; x=1687960370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lDSZyiWV1L3BRZwRMeS6SIoOfuaLOZofn1lovAqE5Sk=;
 b=jdau9cNGT3OQ5ByQWLmTcbNwOu28BAHrM+zgswlKGdh0yjQH/jvJ2OG+zd+XXMDaBu
 cJrLfJwjjMB5ANos89CMzKv2ilRT+iYk5Pr0U/D8/WzAhqTD/lVIyt5Ld4d+9QrzUDbK
 v8fkayaepQHPQChfu22LbH34e0Fv0Kd9oWCdbUsm79JyARfE4xrl32IhKc2nHN1mHWYQ
 XWsiaU41wec9wmuVHhBesjnU1WcAuyekPFiZPuzAduyiB2gJOMnfNOn88fk3UX7v4PwE
 0DV620eE5LKUN0hDPybVoRSV/KNte3uj9DNBViHVOO2t/MDmmgEGVNaCXk+VFSix5nOh
 KTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368370; x=1687960370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDSZyiWV1L3BRZwRMeS6SIoOfuaLOZofn1lovAqE5Sk=;
 b=TGwvFJ8hW3DesPH0wAheTTqrxQ+FUDoDgR4CerbieG5+dbD9fzdVBVJLJeyIjTFMJ0
 tirynktKwMRKX0deRpmo1FJHYg+Vf8EQqVqf/KAZiUDSM4zvxShZq2PV8fO+rCt6S0Kk
 KHTWogBE03XY6OgeJ701FJsD0v+3RSY5m3YjUvkqpOlFSXMqsruAVZzwjI99po6k7gT4
 LRsNqqE/8IxjlvIJpXc4ZYUrkWY4ddfZXTUJR0/o9WwxoAM9PzknfOMgK3oBomAaO+6B
 CGgzJkDYZEWZ2wI7uf41EYxMQwfXChc3REcVaPIytdUVSSYpGXahRx3IeLDWAXjCd3uk
 4oow==
X-Gm-Message-State: AC+VfDzdGfK6TbbUNt5Tm6fVaQo8U8aGNc4rG3gzsdG77eTzDBhPuubw
 vtx/fyx4/Sb42fTy/iZJiztDaA==
X-Google-Smtp-Source: ACHHUZ7XgylCe5x8c31PNsGKQidKa7ddP8MW48epA/QIXyhfVy5nG5DMKTZEEZDh0IhZNes7NbqP2w==
X-Received: by 2002:ac2:5204:0:b0:4f4:c937:9dc4 with SMTP id
 a4-20020ac25204000000b004f4c9379dc4mr4453715lfl.67.1685368370091; 
 Mon, 29 May 2023 06:52:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-17-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=2033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gUTIPidqDWS0P1lNtbrS0Px4anPItm4IBqiFMyfoOxc=;
 b=BvUhulc/6Bw/MuEau8P6DGoJnIw9T0wdrzyGspLuR6E71zrUFFTJ/lVWz/hYaFuMnnttmKNC4
 uLsYGoq/f5HDcWEdrzmUfLwv0SGrtjvxois6uMGcwAuXSvrK71uOuSk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v8 17/18] drm/msm/a6xx: Add A619_holi speedbin
 support
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ca4ffa44097e..d046af5f6de2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2110,6 +2110,34 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_holi_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
+	 * and SM6375 (blair). Limit the fuse matching to the corresponding
+	 * SoC to prevent bogus frequency setting (as improbable as it may be,
+	 * given unexpected fuse values are.. unexpected! But still possible.)
+	 */
+
+	if (fuse == 0)
+		return 0;
+
+	if (of_machine_is_compatible("qcom,sm4350")) {
+		if (fuse == 138)
+			return 1;
+		else if (fuse == 92)
+			return 2;
+	} else if (of_machine_is_compatible("qcom,sm6375")) {
+		if (fuse == 190)
+			return 1;
+		else if (fuse == 177)
+			return 2;
+	} else
+		pr_warn("Unknown SoC implementing A619_holi!\n");
+
+	return UINT_MAX;
+}
+
 static u32 a619_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2170,6 +2198,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_is_a619_holi(adreno_gpu))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 

-- 
2.40.1

