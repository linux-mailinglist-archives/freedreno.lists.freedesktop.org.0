Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF8BB513C
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 22:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA0A10E84B;
	Thu,  2 Oct 2025 20:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljBL4ZTV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33D210E6BF
 for <freedreno@lists.freedesktop.org>; Wed,  1 Oct 2025 14:00:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so827857f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327256; x=1759932056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
 b=ljBL4ZTVp1X1KsM6EX5Ug198Jqy0ySjJaqSDm6+tFeXdVFBNwAOXZrwK2LmievXxzR
 Gk653EOjFM6jg2Qy9imzdehyKlcKu4AWKk6mjeDTpcSPHEozHzfTZn+OW3PwW13nOTbI
 ead4HW+J0rtIcjSo83jVTdNYQtOUQUScK1Z89vgoKEu1dkCMKMzCXbOj1i3WjV7BGHkO
 GCn/672gByAellWHd2J/jziAwlXPO2Yw9TZNSmfa7Bjrcsj2mo1paKf6hh9orm70sKgg
 b9vyCKSy7Vj8gcKM885LK6AKPp3Y9ZSNGcWmEzn9BQM8tVT4ubBHfLqxqtNp47EkH0+y
 v9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327256; x=1759932056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
 b=jOvLuhLPYc8ganSRHPw2uUQUfxNj0w/biSNtW1E+78d4YO6yy2ThsQGDLjjKewQLMa
 B6NwRrxphXOGveVo4QQk10JNeq1AxBwj4HuUbY8ZUMA3xm0Tl1oss4xXwngEiiO1s3gp
 /xE4CzNrewVoqBerAaQQYfFTMDWr9vdSTZO7LMLPe2o97cHnp1q6vJdgt+qcIi5lQLRw
 3I4A1PQvCbRgTlXwEE66ZkQEJgLxf4RliLDlL/h3Dh9tQ/4hRMM8yW9Q9w43EnXLfOl5
 4M8BKmp5Yo7Hz+9Yaz+f8Gnhr2KJZIR5TUMwGldldneBuljRw/9lX1BRrgd6Du2F4JBI
 8zLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo9nTwyVRrKOo0XhuOOkiluCnDF8cDOELiUj7vYaEoVDyMsXu+2sEeqX06vYxdCrbiMYw8VwS61yY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeEF35Nw/zsgfziLHKPmlScpz1npxQNE5JMS6oklDcPD5nNeW+
 nQikDNdnEqaevxOLXfwNowE6u7GqRhnQDDBWcQ+hsEbse8Ku5/FR1v3g
X-Gm-Gg: ASbGncs2c5ycxblr4dFxKBhK+zEUwdJ1Ay0+F7KsuXxVDNFzbCkXA8LyY4WZ210AJ5N
 FJ9olQbSfwOID/rnU7xzj5Mgd90vlZyqaW1l6B34qrsbuPiEYh1Jc+XNwj9hXv2DlEp3oIZfYu9
 Vsufpe1CxnVwEwefH7X0plWb36/3SJrRIyYxM97w4hegjp4mlMLAx5Z2VtF2IDHh1TQjVKsRMMy
 zvVf7kACtjTS0To2ALSyQZ/81mdXutgp6Lcf0pTbBTUUYPQiV3Dfjd8cJQ3j0L0EaxnUnWf/2r4
 +ZQnpsfPBPdsG7BvjQOGnqJWwX1UIs864ZeGmUPW/ezgFs+LbMi3e/yxVcMN4LkMGxlThsqsgUK
 GNjulBUU23u/pEGgcpdObKCGuiVSDenWWiZzW06P7Ch83qwh2KH6uoc7azDr9NVDceMzFBv7qBp
 P61bld8u8YUpjBwIrHLCqHF2pIA+8mvlzfDheIApjsqJlR1j4DKQyjCODh964go9wu
X-Google-Smtp-Source: AGHT+IEbCi0xm7TZs0YjOtrOHHNATQAm6IprX3ckD0OQpGOtjk01tDJ8J2LVgeXv3ddJgQ52ljhLtg==
X-Received: by 2002:a05:6000:2901:b0:3ea:6680:8fb9 with SMTP id
 ffacd0b85a97d-425577761c8mr3272501f8f.3.1759327255965; 
 Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/panel: Add support for Novatek NT36532 panel
Date: Wed,  1 Oct 2025 21:59:11 +0800
Message-ID: <20251001135914.13754-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 20:04:12 +0000
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

This series adds support for panels using the Novatek NT36532 Display
Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
for 'slice_per_pkt = 2'.

Since the current DPU driver lacks this capability, PATCH 2/3 is picked
up from Jonathan Marek and Jun Nie [1].

[1]: https://lore.kernel.org/all/20250220-dual-dsi-v2-3-6c0038d5a2ef@linaro.org

Jun Nie (1):
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Junjie Cao (2):
  dt-bindings: display: panel: Add Novatek NT36532
  drm/panel: Add Novatek NT36532 panel driver

 .../display/panel/novatek,nt36532.yaml        |  83 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  25 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h                    |   2 +
 7 files changed, 550 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c


base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
-- 
2.48.1

