Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56268C1062
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 15:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3E10E9C3;
	Thu,  9 May 2024 13:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F6bmcvY8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8BD10E9C3
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 13:31:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f2ebbd8a7so910901e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2024 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715261468; x=1715866268; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
 b=F6bmcvY8KJR/cG+uHsbfvknty0TD5KQYIW119Z1jYkFrmD/SAKAI5nY1raMvgyc2K+
 2ll7Jg0o5XvkEuyYL7t8RyX3Bo49SQ/yDJITRWjJ35OPYz6faEieHq+c/vtJolWNnUPM
 nu0aJn0GEcG/U3PQjtyNsNxetsmQNBVyF9Uw/ePxTXucoG9K1qr9NF/Jyek1c3xQ5ko8
 SMTPTI0tUtB2REAEY2XkUb51nPQLA0kTlYaUzRtazE6U9sMEm19JdQS0sBEsSNL5B8tg
 LhszTMTP95qPxig2GBnJognstcTsPjMFg6U1cHLASxxt/JFMNnKgYy6kiLdmXpHHSO+U
 F8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715261468; x=1715866268;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r33dW7cmB/GM8ATE+hQpOZIrBaphuEwRmQOpy16eaJk=;
 b=adMbJIOhTZ7Qe1C6cmGNRGzhV2j18Tfe//ySMejGQwptUywPPh5M3aMvWKizh7mkJQ
 YPxE5avIKmjnLEu61la2i1xYj/Kg7vAZAxLPrfu/cwYK39jZAMj6F1hLP4dxaULt0tjy
 Kgx+tHubvxC4x0trpYGcREwjUpRS4+2F9E+YYBVmeD4+k+9SKa5To5WSVevYMWFvnw82
 dQm3VszK+o5DUDdVlWv1D10M4jCTcLnfcDfcDIYcqYdLnIe0ywa7bunPLRHVtOfBCWv3
 EfiSTZvwFVtkeK7pQxQ1/qqZam0+g0+qp4ayCkpH+qBoMHhr1khFDu3ZSciTMCMkzc9R
 tlug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNvtFAe9VwHr3HNsgmh+Jl1re9e8aoOioGtTR8AS/zHCK64ku8A41IDN9YRIowL9RE70zOvE1jKnbl94JbcUR09gEkQPF8viTb+KUzwTj0
X-Gm-Message-State: AOJu0YyqK1FoX7qv+l8Jb6yLcgn/NxtxjArcAhbCbssR+yEB1pNW6pc7
 BKhq7e095k2jED2zpSo0dJPVI9qG6Nd9pfuwfreDFQ2fw9iuMYalh7BUqxLCRp4=
X-Google-Smtp-Source: AGHT+IGIi4Tl8j+UerHfiw+tKEBIcpBqxthj+u4dQ+d8NON2NF/1TsiNDVaH03l0MKLov5/iuRPKUw==
X-Received: by 2002:a05:6512:b23:b0:51c:f21c:518f with SMTP id
 2adb3069b0e04-5217c27c36dmr4667766e87.12.1715261467693; 
 Thu, 09 May 2024 06:31:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d367fsm294566e87.297.2024.05.09.06.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 06:31:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 May 2024 16:31:05 +0300
Subject: [PATCH] docs: document python version used for compilation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIABjQPGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3YLKkoz8PN2y1CKQUt1EiySz5EQjQyPTtDQloKaCotS0zAqwgdG
 xtbUAHGnRaWAAAAA=
To: Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m2zEtruGkvxujMPhBXY7kQd55f5ocV/KfUBbo1KLpSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPNAa5VIUfz7hTsz50vCSYcPRyiOjpAP0rwDte
 rlsD/kOqriJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjzQGgAKCRCLPIo+Aiko
 1SxAB/oC205Rgfupf6dxpqFBFVJhaoZiJlIjwQWT+zfYMi92ykQccxZj7Qy3bVawLRrUo23vC8Q
 BLhTPBNplGA9OkEp/5goS084ThepWCY6xdBBLSha6PEEPPTtIQi5Q5jC6Tb+KMQ7TduZbwmH8nq
 ogkKYKqzSDEADEybi/tJc+/6gP7vuI97Mv+OyXK0gNThg9AJcnW5K1aZ/v1u1qNWIVw8hyEStpd
 g/10UDekOGJQsO6vpyIcptXKcopqIaxCPqgo20WeD1RbFo9RwVKQGwWzC0nAVhobYfOBCDeTT3X
 kN8f9G9VEohrzHtr+a0GvxzZlSMBOFbMhZTEhxOP8H2Z+bug
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

The drm/msm driver had adopted using Python3 script to generate register
header files instead of shipping pre-generated header files. Document
the minimal Python version supported by the script.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/process/changes.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..8d225a9f65a2 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+Python (optional)      3.5.x            python3 --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-python-version-a8b6ca2125ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

