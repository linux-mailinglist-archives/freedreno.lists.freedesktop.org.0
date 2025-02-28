Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C43A48EBD
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 03:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5974410EBE7;
	Fri, 28 Feb 2025 02:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SM9zzDTB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565D910EBDF
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-545fed4642aso1589021e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710444; x=1741315244; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I4yYgoXSkPDEHxZJYvKHSYFoTnrDSY0PIOlWyJbY7oM=;
 b=SM9zzDTBekpiI3w0AHojwtG4iRnfYjNSCfdIPDi1hDaNXRwrISENwrJO29Kxmx7W5m
 QZsBIiw0oQyGI8lZDSejKiHlwjAk7gmEaVomzqAFMsn37VhtQ721qOMuOXt5+69LS2CW
 bqz83pkHsPbIIT+9NhpxZlL7I8fmvigATGyeB7lzWkXb/cIaJXBrxK2qIndjt6xsGDhL
 eZjy+8yizyFe+gyopXBlZj4TadlnXnPDYJC8cFlo5+Uf8vREU6y4iqP2c3wPfcTpaQpd
 WoZydOW5BOhxvHA29OlWNKZUnhnyzBEu16D206TikA9C0WL5pY3qnMYcn2bZ/CxdW5Fk
 VP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710444; x=1741315244;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I4yYgoXSkPDEHxZJYvKHSYFoTnrDSY0PIOlWyJbY7oM=;
 b=IbS/bDaX91J88aESnbzp43+JCIlY4UqR5A2URDHfHT8LCNeEQfznDPowfx5ulOvP3A
 GHe0qAYZ5jhl/BTLDWpu6jd84SsVm2HMgDuYmKVknZirDsauMLJNx6KzbG1iYppXK1HK
 z7CI6JejcsOEpKYYPwpt8x3qhhZWTtgemGkDQxjuLfH9rlZzsOfWwyUMvG9J2gaPbagm
 FsF79yBKypsbJw9cmVjfvtarltv/cQKgpUb+SzBPruYox+XpfLKepsuSA6h9tasKnd/S
 YM0LyhyNGjDut4EdJetmu8VgC1O3gSYlnjYPKGbILOzdTBrIIpPt68SFkQcENGuWLBDE
 0SLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSS/fzrH/hZO5nGr6Ns+P11ssp6wgWKz9PNwTqX8DkL/JnuyKIrdYIpk7Z4m5tXw8xkwcQ7rbcvxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoluheMaw8RDFb2j8bdGJbIRxb9BXVpXDyOB13ij+05LWLV9T5
 O6yoYn7cnrQHx3Sg/kmoTUK1Vsm7CVtcm9h15CVrE3bmWQnzSJDK6poouhmXq7A=
X-Gm-Gg: ASbGncuSCK4fLwj6QgP5cMCBY6s8doZ07yG5UdRMIpKKJn1qXH1WbdDXLudruL5UnjM
 XOR1Wm/bagM1UQYNhOewWgzYjrnb1UXIPP9XbyvUfuM9qlqge5rgbC5D4blIHEH5b5MlssbrXwG
 q1dJVe+a9zcKicOW0Y3bjxkk0Ym/ZgroX5hSdB/WjRV/VJgePGoBKVuBPWQhS8KS1+obqacOntm
 W9k8bPtNNriohPz87yFSn9E16+jbLr6SGte2SnMuRk8s/Oz1hGq9QXTzvNxSPb+lqlBeV2mEL7/
 7R8+2EvkUG8iDpv80K+nni0jsu2rY0E7yQ==
X-Google-Smtp-Source: AGHT+IEtW0WMPANQ6F9JpDf+C1+6JFlyEN+Vr6zomJwOBX9tkR/2r9ue9QaM1C6U7eBAlBJHB7ZBbQ==
X-Received: by 2002:a05:6512:e8b:b0:545:296e:ac1d with SMTP id
 2adb3069b0e04-5494c36f2c0mr538764e87.51.1740710443803; 
 Thu, 27 Feb 2025 18:40:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/dpu: disable DSC on some of old DPU models
Date: Fri, 28 Feb 2025 04:40:37 +0200
Message-Id: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUiwWcC/x2MQQqAIBAAvxJ7bsGWiuwr0cF0s4Ww0Iog+nvSc
 RhmHkgchRP0xQORL0myhQxVWYBdTPCM4jIDKWoUUYduP3GWG605zLp5bGvtpmq2pE0LudojZ/0
 fh/F9P29WEudhAAAA
X-Change-ID: 20250228-dpu-fix-catalog-649db1fc29a6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NqHFkZTNSAOJT6jUtd40Rvhz1aSYBkpu5FVcerkF0Jc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIo20QqL+PSUtzMvu2VMoizDb8f7qpVvsxX+
 ee6P7F2eHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1RIxB/9DmOc9LFEh7/7feQPzGvjW/BRBpCsJ4lENZIx6U+ByPKdT5v2qDT4+NRfGKfq4u8OVIwm
 b1hT8PQf3Kx24uw/Yu7XgggS+nahjQE0T0i689EqYkMHON/DsOqxgRrjjRAx4TsR9VuMuM8nY/7
 ZZXb6fl3xHc3uRFi2iGydqJYRs6uk+IP/NyZVllESvieHOqAxhW5KH0cijdaPsljJEI+PRNEM/o
 XoL7fmb2jXrYhsIkKm01znKQvs+F/LNwQLD18F8UKOYbCqOats/SYHkddp6HT5uzCvM8R8SOt1u
 sxZyXYxO48mPbZu1iffvBy+E8dzZ0/h1AH33BKTd3vMuKiUx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

During one of the chats Abhinav pointed out that in the 1.x generation
most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
didn't provide DSC support. Disable DSC on those platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 5 +++--
 4 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250228-dpu-fix-catalog-649db1fc29a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

