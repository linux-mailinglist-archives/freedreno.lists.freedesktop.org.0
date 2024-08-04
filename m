Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60837946C47
	for <lists+freedreno@lfdr.de>; Sun,  4 Aug 2024 07:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326BD10E0D3;
	Sun,  4 Aug 2024 05:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lr7RJEwb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ABC10E0D3
 for <freedreno@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:33 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-530c2e5f4feso1496685e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750031; x=1723354831; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I8Wu94fGKiTMPD1PzKnesNCvm5Ij4LDiKxVI9I0uyRk=;
 b=lr7RJEwbmXTZ0KFaJK5DIOyvRYoIyqpn8fscFAB6h2672ynzOqTeQj6w0POiCzSZjj
 44yBsCAYGZ71k80/xPnHiE+V1ra10YE3annmYK9rYdFibCcCONacXdzDYU/w7eWE317e
 tGEdZGUoToxpoZ/VfeCVm5a/lSSaCP3wFiVDr7Sv2GBEsGKbqMN3I3+Yu4QTF0a2HsSp
 4KV8C3UGlIRtFP7JPRIpD8IpO+4C2MHeCveSWmqxh0Ap1V7poVfnYnbWqKBx4X2VlWud
 d4mWKBYJvoJ28Z2/MKhDQVPvZZMN1aKGQuq5hXCJmkljKG2DrYRAdR6huMfudVgIFEI3
 VV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750031; x=1723354831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8Wu94fGKiTMPD1PzKnesNCvm5Ij4LDiKxVI9I0uyRk=;
 b=GuFXptp7FmX3IsBvtV7xGEL3ssR/P7aCemZtPblWqh9llnze5kipwvZLoNI7v1l28s
 ay/I8lre1yIis77r/g3pGP9Fssi1rTq96CvagduetH+W1S18JOakNWnqvtEAQxYZ4Lsn
 XpSr4Sg9Fzx9b4WYAhG4TWzqwSr9DcFrGCd/XVxh5MaeJsHtBT6+0an8dMfjO2dZu46E
 dS9aqU0ucHTGeUTaA/4GOG/vcj5qCAWpJYr/rIiBu6czmfaBwvQ7hY70O6vHzKemBBXM
 8kVU6ykrIOa2vEfO6mJ8V+W3rVaHu2BQhL/V9Zq/W3d8vKFfaJn71KwjMYyUmHm6rylw
 35ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWelCIiQO+mvshGESMV2cSpTNvIfLc9d8YsOAQ83xo83SFgc1gtXTQPRgl9B3ezjQ+e/93wE/vSDr2TL11nhx5JzafkSq/jhlFyiMfsgsTn
X-Gm-Message-State: AOJu0YzZj7tdn0S7f7NqbxsafIaT3Rnxj4f4NUxEFZzNL5G8l0puguxi
 vkxgpIPsbVJmE86pL/Af0/HZlviXDpc/VfnLzWzx0ymskEMV5MhnmB1fdgx2rpM=
X-Google-Smtp-Source: AGHT+IFfmnlD6mrDT3KruFvoon8BUGprvXegwalTaKHvGV+9P6kPPphMtaSDcjG1NUuShKFfX0CTEw==
X-Received: by 2002:a05:6512:1590:b0:52c:e28f:4da6 with SMTP id
 2adb3069b0e04-530bb3b1517mr4682167e87.51.1722750031400; 
 Sat, 03 Aug 2024 22:40:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:12 +0300
Subject: [PATCH 08/11] interconnect: qcom: sm8250: Enable sync_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-8-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZI9fPJt840zyCD0T/bdD2HXJKwtHsbp4pPiV3WmPfv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/jMwL35sKEU5D9Tjp6mYCnOmmqoQLsUae1
 0DawQf91CuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1Wd1CACoGYeZT9QIFHk06IumJN0/f3vOzPfA9od+eKNLVIGC6yd7rm9bCEyQzomcgGvPKr0Hxzz
 ppcABqc8lJWSoKS3xOJDQ8kD5vZCwVV4MGJ3acpjzTsYn0F2T6GXEp3Sj7DGftexTbNh3Z/JhBx
 RYS5hdWYsl6yIgSeVKkIo2KoCxvbv3NtX6o/AylXee2y6ZgOXlE90ASOPKaRg+siUF2I7SFsWvR
 ALaRIt8XmnvWLl2KLVShljReh+EiVuvwBXguCSYi3RqH9dFpHFgdW50ru6PZyu6FO35ucww3HlT
 CKHK8YPjkcXBS9TJ6g3zS4L3BiEv95HTup5R9lfaU4olHiCn
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

Enable the generic icc sync_state callback to ensure interconnect votes
are actually taken into account, instead of being forced to the maximum
value.

Fixes: b95b668eaaa2 ("interconnect: qcom: icc-rpmh: Add BCMs to commit list in pre_aggregate")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm8350.c b/drivers/interconnect/qcom/sm8350.c
index 108934fc8ebf..4236a43dc256 100644
--- a/drivers/interconnect/qcom/sm8350.c
+++ b/drivers/interconnect/qcom/sm8350.c
@@ -1811,6 +1811,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8350",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);

-- 
2.39.2

