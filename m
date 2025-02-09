Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8686A2DB06
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BFB10E48B;
	Sun,  9 Feb 2025 05:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OsW2xdBj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978C110E48A
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5450622b325so739137e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077644; x=1739682444; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
 b=OsW2xdBjovdxHxONOAd23GzlJkgVW7yesgzz55X6S6SV2+4X/wHbD8Mx7tLxUQ0JCi
 FzuwKQ9LjhZbo3lNcbBBW1mx/avzf/hVNBd4KgmAbb+nqs6hXcEB33fFbInUsSWPWpaQ
 Ba8PZ1EEa+VUPe+MUCf8slRc05/6pQoj0JeR6N5pP97v9k5a3Horll6uV70OOtqURQdU
 i/os9JG9/XwkFP5WbXF1Yn6F57fBkaSpDboNYcmPutPvNUF7JeR/xvmNWVGK1psKLFNB
 w4tkvIpJNBiBp4hWc9+C5qvhR4O3sr2OLxqELijpJdw7w0TKbTM9Ut2PzyzBA7KwgshQ
 smpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077644; x=1739682444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfNMfzUAvdO5axXrtOPa21BH0I19Ed6M3V+EZ2kcNQY=;
 b=pXpAHQhe6aYfxUoepO3Qh1zP7uBAk5x8pw7GStTDW0MN28/jPOJIZNiO6c74nULZ/C
 rU/gOgZWh/2TiegnHXlHx/991Yb9CxKxO9B1Z2apHJ/p3pUZne331v+6kg5Nmls1mNl1
 hQKe9q+yNDmb3qrpZfXBrI6w+ZOhQuBangI2TS0TTo5d2BscSOQNyXmuq3fuTLpsEuEH
 Y+p9IsBGfxHq013TGGaLEG4hFlVQ8sL17cJPOFIQRzimNY8LyVOVvBOnaouwNWJzfqxA
 E3pn0T6y0F+YF4hBRQ48C5DVvTHy/Zd6oxvkouvdspVef2sw7DYlTte3kl6venKJVr2D
 m8qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz9Bb9bTsiDnq+n0h9gdUTNs8EH1j3O/RuejbAZbVgunMhyhMHRoE7ZomHPkennBWUJbcdQnJv8Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBaSrphpgsRqbuMfoTZ+oVvAQRmvNpuM0Q2F9j8hObHtqSzvbz
 iWtVF7IGWPxXIntfyQaYOICfVD8BpmRUgu8jbrMs/v+/PrpvA8RaX+d1TsN+rqs=
X-Gm-Gg: ASbGnctaeC4Jpt5piZ1Iv0GpKDKhmNTikGkpRwUwxfh/HJqY+JkX8ogNuFA2RXl0sqJ
 z6jBmg9ShZ1FpDHCYEQ5rU2qQJhZpDXJ3J9yDUQc7naIlEWoStLqq6LbB6ZzVPbnBZX3buh/ArG
 59jnnhIh3QlDQm66JRQmfA9YmDSyRPX2TBraJulxw1n2kFSzks0V9TyVaPFc2pHGWbW1yR0B1W2
 JjWHDoB9YqZ7ouz7ju3RaRSQj4M7BIol//hrM+dX015h7pmUa1iUfvsB+GYoD6NF4cq5UK4t/WW
 L6ZlE4JI1dLV/SHJnKECRGI=
X-Google-Smtp-Source: AGHT+IEAJIpGx/KtWJ3FoMRxqCJZCMQixEialyC+rYX1C/PQUXahOHBcURaFNniiUGHQYiTxLHEVSg==
X-Received: by 2002:ac2:568e:0:b0:543:e4a3:7c3d with SMTP id
 2adb3069b0e04-54414aa8782mr2874988e87.29.1739077643911; 
 Sat, 08 Feb 2025 21:07:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:05:00 +0200
Subject: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rBkvGR/qHrfxPlnsg0QzXfiNTIC9RTO2ROzJ5dKz7zg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfkPKZGcgzKdMYQrmr8xg29SeVv5ZTbQNhMP
 Xm71FFkyTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1UN1B/9p99p14mAy2cJWH8bo5AHu/xitIDMYADBNYVdsUQXslx1MuCaXPHSz/9EQQ9j45ItPAmv
 EzCEf17MZ//D1/qHLqCjloL9Ltx37KTjBGPz1FUsmmbU8crIut7dokT0vvrXN6tGLdefXI/Hxuc
 awkE7CsVIlujLKcvm1MIvFQt1sbsJ9STP7ppIKasGV7yZiTxpCfT5SglZtHAbrupQBqNjuOhnWd
 3K8IniuWpKDQQBT71UqooHwEvF5Y9+OSbX8IlfDHj0Wp18urN40IFGX3Er+qj4JGg0EX+RWVWF7
 5mfvkADq0u6kX/boHk9kXmppgY4vT3pNzviaOXQ+R8XuVeKu
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

There is no need to specify separate HPD gpio for the HDMI block. Use
built-in HPD in order to detect if the monitor is plugged or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index b3ff8010b14985c55c580e0083a5c8ea23c03962..717bfd74edb75b278eaf5ab37954fcede1f7ffb0 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -138,7 +138,6 @@ &gsbi7_serial {
 
 &hdmi {
 	core-vdda-supply = <&pm8921_hdmi_switch>;
-	hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 

-- 
2.39.5

