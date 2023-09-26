Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C77AF29D
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7658910E419;
	Tue, 26 Sep 2023 18:24:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190F10E418
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:45 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5347e657a11so688745a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752684; x=1696357484; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rdOeaLeHcwftMyYfA8G29tOCdXwXQaoJFb0mcu8r5zw=;
 b=jf24Le9qR5cS+fhhexHcYAINNK7zNzXE4VwoFnNF123msoHWaoztIej/tM2jnSO3qM
 jNqS384/kwJHwloNaKeBD5XUSMC1jJURROIOBSwa6tRfLNF6lcKMTkfhHhbIgnW9ZrQc
 jRiNyzvDtoQ+Nrz7FosjWcoD1tfdjXO7e0HJIBzJ0BDO7ALkBZI6J75Xan44X8ENlEtd
 L2YbGuF9rqd02P3Lizyxg6zUhGrKfP3bI79L707ikmGCCV4aG0lNoHKo3vz3dj94Ha2P
 9Z3WWJD8aNEsMLnU6I/s/IgfU2OGiwbkQ487vf3yAkRD05K0TR1L8ptFbh4OKihRPrF1
 dhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752684; x=1696357484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rdOeaLeHcwftMyYfA8G29tOCdXwXQaoJFb0mcu8r5zw=;
 b=SCJADRIiWiGYIQ+rmrwx/lbHOFgby+1+VLKyaXcVySyaJ3v+4bOWu/uwqoVo6ZXhO0
 HHBqbNiUxEsYJ9opjUfkZw2I+KQ7PzL0IxLdy9y7AoN+iXKeXc2pJPzht9hZrx9O8Hpb
 M/4PJneu45xfBGGeYELQ/c2gnbae8DM5apA5ztp6lKDeHja+uxJDzc4JfRGmcPqSJ8ce
 VX1n01SL4J8dELAmc080Qhif1WLK2etdkTZg2+KAjStUDxwyA8/OiY9tzkBPuoaVvOOM
 Xc74vDmLJEJkFqHpzTO7rp0u/xgQLb/vTvOBEwrzQX7h5MpXZvlcJ8o8W/Xyf6V4wooX
 U+qA==
X-Gm-Message-State: AOJu0YxSRgRoEuLbfpTQ4VTAPjlnivjQrSS8NgmS/jRXST4q5iW2Rbo+
 f/NKE8DgmNqCPzJmTHHxvxPixA==
X-Google-Smtp-Source: AGHT+IFNPKWtqP96Z/0gyVWxTahuOivQkjQlQvuDt3caSQC/FoLkRgSGW7croA7ASQ1ChCEC2PL20g==
X-Received: by 2002:aa7:d0c2:0:b0:51d:f5bd:5a88 with SMTP id
 u2-20020aa7d0c2000000b0051df5bd5a88mr10428662edo.38.1695752684159; 
 Tue, 26 Sep 2023 11:24:44 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=810;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=j4J3bf93En8hfomc6iMl3gRDui2N6DxaHKguZItPSOc=;
 b=Z/8uVHWeeJiYMBhmKxURKKCY6E5ujoQW1IdowESmbyutCxeRpM55YuxSzaiPf3F/h1M6I0ebF
 Yo50w8YlEoVB1iHo9jiNgpsMDNM+4THYBPUM/ETvorOic57gT4f4kk5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 2/7] drm/msm/adreno: Add ZAP firmware name to
 A635
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

Some (many?) devices with A635 expect a ZAP shader to be loaded.

Set the file name to allow for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..16527fe8584d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -454,6 +454,7 @@ static const struct adreno_info gpulist[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
+		.zapfw = "a660_zap.mbn",
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(

-- 
2.42.0

