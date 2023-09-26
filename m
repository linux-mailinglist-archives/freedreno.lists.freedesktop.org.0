Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03A7AF2AC
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFC110E41F;
	Tue, 26 Sep 2023 18:24:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44610E41F
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5043120ffbcso14463882e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752692; x=1696357492; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zKAfj40wX2rYb9qZjVM1hdFI0nJkjq0ie36nV/sob5U=;
 b=hT2ZBTOUukqDUQwprg3h4mfI9Z2psY3WmdV9Tlx+0h++8ItZHfI64gQysFW3vaiZR8
 tuQ+pavxEUrS+EjOCsSqXYjzFkoF8HP3ymSmvHviTtWEBdfSB5T7IvJ8wDKhz4nVz+8K
 K/zAzEeRojS+koMOBphhn9z8cybLAUb6PB6rKVGzRTfzqvzDgW1B1Cz6HiUGBblm30mD
 V97lBOB9P7sJ0WVN3chqlGbe3VhZl7o5+qxxKoiLFBCIjECwJdhf1PnOIFfsqhyUt+7n
 PvcCJfLUif8q3rPKWziykrwIP3hS+heKay4nwnr9P/mwl+WS8fQ9I6KkBTq+K0TAB+7g
 pQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752692; x=1696357492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKAfj40wX2rYb9qZjVM1hdFI0nJkjq0ie36nV/sob5U=;
 b=viTtQ9ZvVVk8hMM4vnZmGJYE43oPsjyWeorQMZfLnG5EAFnV+gd/1a/15sDK/WHaHK
 GveZZ+nDhu9LE+k7NGsWerq04SXg4p4iNNhV8DBeW9VsFfXcYbYeDYD161b4DGQUy4WV
 WlNBm+xRiKTLkdC06u1qEQw0WKWqFxlPt5UnylFplbHrhrbPZkmfgZel730e2JihKgzx
 ln+CYW880NQsTJ76kz56efVMMicw+IU27Ln+BTP0VGzCIWbb388yQPNCs/ADmwxPsrEb
 nj3+hWYeAx708FCFmQWCQ8cwBdlXLz6dPHGbg5wcChfOrBzuNFnXen7BePm0jvuBJez5
 OOOQ==
X-Gm-Message-State: AOJu0YxxLQWeXq6+7SnnC7FqcWj2QVuZuX3FF7VQmcVEK+t3SD4NnDm/
 zb0vT85zxq3TyL8EJ9/N6wEdoQ==
X-Google-Smtp-Source: AGHT+IFEOjsJYPfc1unWH5iDo2ktLsd6gTLh2AKJS4VABLvGaC7NWjan6T+Fe2gwP9NdJvAjyY+giw==
X-Received: by 2002:a05:6512:318d:b0:4fd:f84f:83c1 with SMTP id
 i13-20020a056512318d00b004fdf84f83c1mr10394815lfe.64.1695752692402; 
 Tue, 26 Sep 2023 11:24:52 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-6-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=676;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Hpz3dGOzkgvsLU7CVLEOv6AKepEoumYODOZQCFrh/Q4=;
 b=j5r+TqjW4AL2kSlLuLWqK7jEIUZkSCZmLEB7jrljedUKqzufTLJ82XEyKjXd1g+Xdn85ktzDP
 aNUnRkQeTI7Aooar0OseWXWM8mz1d5aWQL5knIH/Qmhu93CpmvmbPvp
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 6/7] arm64: dts: qcom: sc7280: Mark Adreno SMMU
 as DMA coherent
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
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The SMMUs on sc7280 are cache-coherent. APPS_SMMU is marked as such,
mark the GPU one as well.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0d96d1454c49..edaca6c2cf8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2783,6 +2783,7 @@ adreno_smmu: iommu@3da0000 {
 					"gpu_cc_hub_aon_clk";
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {

-- 
2.42.0

