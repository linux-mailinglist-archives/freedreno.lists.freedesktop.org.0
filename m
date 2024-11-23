Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E29D67AC
	for <lists+freedreno@lfdr.de>; Sat, 23 Nov 2024 06:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E69B10E241;
	Sat, 23 Nov 2024 05:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LUBm+j+s";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3BA10E241
 for <freedreno@lists.freedesktop.org>; Sat, 23 Nov 2024 05:45:03 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so2462399e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 21:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732340701; x=1732945501; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
 b=LUBm+j+shD96GQLlKfIw2CAM0H0B/Kkiz6GpZgQz1stwYxd6tCIOGT0neTT9VE4z+w
 YF9smRoYCgjRY3ondDU7G9G35Cu4t1Oj4Q7N402K6zxwLdqOcvtF1AuckdiDohlY2wy6
 m6m1KvmqSRsKiLgERqFTY2N//c+8WjlG6nsg33CdVkEechnTiGGOEMQ7GKrcfuqiP8iP
 H1kaisvLjHa8Ypq1I2PBIArBQNkii1qkqbrdvpTIUdxssvQA28yX8NhRXN5OdDFAXeTf
 +MZYcYvx0rr5H/R+Z9zOyGNoifwQaPDTRzH56LpxhZdqh3wqycjbtQPDYo62VVKynYBB
 3HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732340701; x=1732945501;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
 b=dsMWea3Vm0jc5qjGOyDVZUlsWgJ9T+9Np6Lp3oiXhrBSIIAh14zMTFg+VMKBTVb26W
 sPQ9w82z9eDkAwT9Gius3tEr3mH9knXnrPa4Bju7/wqjArntAieQPfxdtX+12aMePhs+
 77bcl6ETG1K0aYoeTBQ9CXH2scZXOKOtmZEIESJDCsWvO2wBCLqtuUNWTsok5bzDZlll
 0tcvMJWHHTnbYbeakwUypanbqHi6iNnmf4PgofDcv7q8U3jXWwQBUj/k4RnmAnpdFZJq
 zOKNYKVK53wuAeU2jnug0scY1G3Ql6Q0zaYuBAUWk4XVSqhH0GZa7nw5sVV44qgy/w7O
 qtZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHpKLblpwNYVBH9sBCl2W1ZLA2vtxtA6Ee6jZudyHzC6/NO9LvfZBH42nEynwLzdD0JI6yeeh7wvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAZCaSrOPbSMJnbvn7aDBO1JMMQshH74L8zxfVfj/wulBJGhQb
 gXGS5bd/cqgXZBTlW9mqDXi9BuTs9o/SPGS2ea/oZhkMZg+/bZxYcIMhB3S2oWM=
X-Gm-Gg: ASbGncvobIeJibRelXij+blsrULZk9+2yBEPHQp6fXYtfTusEwqzAg4drKm+ncKGxse
 W/Cc+Q64Z5QtQ0M3DdMWTySozqT+ONugXLJIej2gCxaCMxaDM2ztND620idsZLnbFjopKZWYY1M
 dcQvI5ppvVN/5B5GyR+XJuM9kS6SbqL+Krdb2IWXMmr+lA+I2DOlo+U8LwbLJxguvU/Mh9g57Qo
 0ILteFU61DeaExfTGWtNJmSb4/KOUQHzDXwqQR+UIrfBNnQfLMMh+Tu+g==
X-Google-Smtp-Source: AGHT+IE6fTO7btbu83dqsP1xnHmtk6AvgRM7qns88Yv9lZ+YmpujoZwp8x7KhxKEiw6v1OvMyAq2Gw==
X-Received: by 2002:a05:6512:238b:b0:53d:dbb9:f3e8 with SMTP id
 2adb3069b0e04-53ddbb9f54amr669860e87.4.1732340700953; 
 Fri, 22 Nov 2024 21:45:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 21:44:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sat, 23 Nov 2024 07:44:53 +0200
Message-Id: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVrQWcC/3XMyw6CMBCF4Vchs3bMtNDEuvI9CAvsBSYRajqKG
 sK7W9m7/E9yvhUkZA4C52qFHBYWTnMJfajAjf08BGRfGjTphqxWOMmEkxfB5/XlUJExJxvIxNp
 A+dxziPzevbYrPbI8Uv7s/KJ+6z9pUUjYKOVdrMl6Mpcbz31Ox5QH6LZt+wK6vSxdqwAAAA==
X-Change-ID: 20240921-msm-mdss-ubwc-105589e05f35
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wo85Gu5tBP+bwX8G9oF56lJcLl9CC7oulIrznUfB0WU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvZfOsGqP696O7eYCPysgh+v1Zp5nT4q6jp3
 TJjXjxhRfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2QAKCRCLPIo+Aiko
 1TtPB/0RHVW0p8/zsE5/LcsUtA1U+CDchj7dVu2x+xpE5DZqqTkUSJ7hCpgMNltoltWFehV/O9w
 NPQu9g0qgTH+iRJJOsETgPFcz9t9mGGgdmRgv+CR5RZJiZ3ngp1HSgBt/+lh+4sazrTCoAtuq9W
 FvvZ+EeuA2FZUjE5gNwrf2b612BDhoyK0xYU9G08ny9xWu+NJHB2t0zTeb/1l6rs3eypSwDnQxF
 xl/Q1vkfiPGSIZdtIWty2HfGQKRUDlh/VtxowjK1ajoC6JCGMAJ2LtL5v7URvpShxJG12IUreow
 87sm8JQjt0ZUpZCYIYaICGinoIzA/hg+10kiPR5Z8TotquI4
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

Current way of programming of the UBWC-related registers has been
inherited from vendor's drivers. The ubwc_static was supposed to contain
raw data to be programmed to the hardware, but was later repurposed to
define of the bits. As it can be seen by the commit 3e30296b374a
("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
gets out of sync.

Rework existing msm_mdss_setup_ubwc_dec_NN() functions to be closer to
the actual hardware bit definitions. Drop the ubwc_static field.

Unfortunately this also introduces several "unknown" bits, for which we
do not document the actual purpose. Hopefully comparing this data with
the more documented Adreno UBWC feature bits will provide information
about the meaning of those bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped applied patches
- Added defines for UBWC_AMSBC, UBWC_MIN_ACC_LEN and UBWC_BANK_SPREAD
  and .ubwc_bank_spread flag in struct msm_mdss_data (kudos to Abhinav
  for helping to handle this on Qualcomm side)
- Changed msm_mdss_data to use true/false to set macrotile_mode
- Link to v1: https://lore.kernel.org/r/20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode

 drivers/gpu/drm/msm/msm_mdss.c                 | 71 ++++++++++++++++----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++-
 3 files changed, 55 insertions(+), 31 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

