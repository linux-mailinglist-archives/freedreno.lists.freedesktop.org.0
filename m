Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCB8C347A
	for <lists+freedreno@lfdr.de>; Sun, 12 May 2024 00:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1799110E045;
	Sat, 11 May 2024 22:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zUL5jI1h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02B710E045
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 22:32:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2df848f9325so39282531fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 May 2024 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715466767; x=1716071567; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ayQkPZ/+Ja6xRaXyLxW87mdfZ/SJLfKA5C9uQsxLStw=;
 b=zUL5jI1hBda/iD2u10afFVeCI3nWlqtBTWZo2SXRULVrwfW2vJZTQZ9kSFig8wNnUE
 mLnNLst1S7svdTq38uSKVNn9c/nv7PSxPQHa4UcNqdpjHIdvUpHbW8fW/7hd2jQX3nji
 cGHp06JB9RAEne2HeTc3gRSLPZUpw1RGzRjtBLXA0OiGtNnomqy8Xt6J9jhaR7s+DH+W
 X7sB9Dm4sIeFacR7MFj8r3dsfVEq/IhsIsd6WNrzSWZ5GuYigPLunKC3m/gwRjjeQiv0
 tlZBoeWxg5przpv/kFbXeYGvz9lPytW0AU1Y+eCW9b6NOMNSdpRcYH8/XE5XOJLdHc3e
 IUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715466767; x=1716071567;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ayQkPZ/+Ja6xRaXyLxW87mdfZ/SJLfKA5C9uQsxLStw=;
 b=Hqjcc7ieJYgx9gFv+AAE4dod58OH/wVPozfCas9/Nb4YWH5eR6tKrDrC0TfcIiLKyR
 0lv1rb23DvstQKuRA6rF03eR9TqvIXVoYrTYQZaTC5PjrV1L+bwCffwgeI4wZi/oTZbq
 HKh7UDWGAY3eQrC2LPK03mPaYHDHQdoSG+m8OqPjCcGCUbszT3f2Cj2pSu0zNLMVHO6v
 +ECuLyxShbqJt1qqOiBcS2v01u6ConCmJwXEpbJ2HN59wVf1VvsUg7wdJgtFYUrn89Od
 LvEEA2+zw0s5SxRDVJ0EjjrzsJ5/gZoySK0U3r3Z9WcpxrYQdsulPwRZBYR/vdHnt3EH
 OL1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ+BlsZ2+8yREWmVp7aS4YIuaHFFfASx7fs6XFl9iE+4nwI34/sH+LqgitJ2oIYTzCN6wwns/bT5RiNeAsm/S/9Wd8y7w01C4ttIEXUDl9
X-Gm-Message-State: AOJu0YydAF/Dyd1d9KjvsjIiSPZidbmMusgDiE+D5rJNwdnl6gONOe7G
 lF/E0HBdbknbW8Ts9iEjgukwaD5eOwBIuO6+uaAZp+NQJ7rZq47L6ExMAYJOu3k=
X-Google-Smtp-Source: AGHT+IHIZPF1F7rpdmiB8zVjvs9j63L4ySis6WkHrE1pCnC9pnyXQKMMTw9kUd9VUQgA/K9/tkLJUQ==
X-Received: by 2002:a05:6512:785:b0:51e:11d5:bca3 with SMTP id
 2adb3069b0e04-5221006e61amr3469492e87.18.1715466766866; 
 Sat, 11 May 2024 15:32:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba81fsm1127956e87.100.2024.05.11.15.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 15:32:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:32:45 +0300
Subject: [PATCH v2] docs: document python version used for compilation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAzyP2YC/3WMQQ7CIBBFr9LMWgygqHXlPUwX0wLtJAaaoSE2D
 XeXdu/y/fz3NkiOySV4Nhuwy5Qohgr61MAwYRidIFsZtNRXaWQr5nWZYhDZ8X4V+OhvA2qljfd
 QpZmdp+8RfHeVJ0pL5PXoZ7Wvf1NZCSXwbi1esDW98a8PBeR4jjxCV0r5AfO3uyWtAAAA
To: Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9+jNicSIoeudc+F3EPpKSthDjra2W3jAMeqKdhOWTK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/IN6moNPSkS5RdVGvLI1pvK47IdjjvwevOEi
 H2N8KH5JNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/yDQAKCRCLPIo+Aiko
 1b7/B/90NPkOoZ8qSWRYxnXABQCgT9LTVkXhfbbO7/Pc+dOo3/3TONJGInxKeUn490eaRHwHeuz
 9vE/piFYctiN3nBqMCPgU1wdwSXkpXG7aO9uzxVYZFda4T5iH2sg9LNMPG9vd66Y4MPRE5UShNJ
 jIpW2um9X15VUVS0GLR7oExe3jVHOeBe/vsDVyejvXnNd3Y5oHdKUkjX9DqJzfDulLMqZU1Lm5A
 Kf5du4NmIlp3XZvESVP9Xu0jkrLiVubjYMnd1ZmlmcuriIwkRqRtGpkSMcvPn/76OfkfYf6gqV1
 cCpzDfuZXB8BAxj27gFWTe6ZxmgVGDu7p0QYa2hoioSCMCOB
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
the minimal Python version supported by the script. Per request by Jon
Hunter, the script is required to be compatible with Python 3.5.

Python is documented as an optional dependency, as it is required only
in a limited set of kernel configurations (following the example of
other optional dependencies).

Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Depends: https://lore.kernel.org/dri-devel/20240507230440.3384949-1-quic_abhinavk@quicinc.com/
---
Changes in v2:
- Expanded documentation for the Python usage.
- Link to v1: https://lore.kernel.org/r/20240509-python-version-v1-1-a7dda3a95b5f@linaro.org
---
 Documentation/process/changes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..30f17e3f954f 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+Python (optional)      3.5.x            python3 --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -198,6 +199,13 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+Python
+------
+
+Python is required to generate register headers for the drm/msm driver or to
+build the linker script if the kernel is built using Clang compiler if LTO
+(Link Time Optimisation) is enabled.
+
 System utilities
 ****************
 

---
base-commit: e8bd80985f8ed4c04e36209228163fcf06496763
change-id: 20240509-python-version-a8b6ca2125ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

