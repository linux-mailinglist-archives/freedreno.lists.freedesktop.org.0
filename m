Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D129941AFE8
	for <lists+freedreno@lfdr.de>; Tue, 28 Sep 2021 15:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507CC6E8A4;
	Tue, 28 Sep 2021 13:20:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11986E8A4;
 Tue, 28 Sep 2021 13:20:11 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y8so18908894pfa.7;
 Tue, 28 Sep 2021 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skXS9FAAmXWjWTOfJ7iolwq9Ls6y2YQYKSTYxiYgvoU=;
 b=i6WMO8Sh7rRGOyKHKsCDYxJpraDsM/kfqTc2vdZyuidM9YA55oyyKotHO70yVyvMNr
 zfEo8uy9rNi+jiC28DdsNNegAVjlUSFMl5hvRNfh09lKoPLvo38vrtGcCREtCXv8lEz3
 wOL69Fg6t9l25gN29igh5ATaQJC1Q10og2MIg4TexqD8pKqO9Sze06F4H7HADdOVIPWn
 afFtbXYXaQEtYKyPwi7hb+A1r5hjjmNhDvwMgRW6l7v03awBZecb9Pn73vU4k2I5v6Ly
 zuDRQbG0gWzPBtBfMyz2JqjpeqWc9S1mvPW6mv3pnrhMfpqY5B+w4qBxKhaVINQ5SCbL
 TbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skXS9FAAmXWjWTOfJ7iolwq9Ls6y2YQYKSTYxiYgvoU=;
 b=5lu1r/YlXLDegifp+c6QfAgJDERvGXqEaHQl21b7WanD88eaecM2glLzsoMaEG12FR
 q05RnxPYs8MgQCjqIRcdbKa++AccR078aKclx8rbMuONWz+nqzWSbVaetXTQDNCAzJog
 5oJx1wtxJGSP/xTYodFQUScMn5I9iSp/ukUBVL7JL9RSOFgxRoCKhQVyR/i+1qvkunwF
 DYGy2+id9ZOkUYz/SdlPQPTjnJ8S/KreGxmYAxe/4mUaTvq5TqLImhAaqk9b6Vf9/aDk
 Gqcv/oJsa/1WQWrkBnUmYp+hSdeNJnXjRpwQI8QAV0okeJDJEYOqFaTR+Ebe1LQHCxhM
 I9Ew==
X-Gm-Message-State: AOAM530GzrU/07s9SpVGq1vvTCjdHP3FmVrV6Ts/7u8eRhyD61ItZMvV
 rkFXlH8P0hjwrnwvCGSTwrc=
X-Google-Smtp-Source: ABdhPJyAcqBb1eBhinIUc+8FjDCCzm4doSh4iuL5aND31CFGPvloAiVi5tdj6bffjArxki064WG1aA==
X-Received: by 2002:a65:6ab0:: with SMTP id x16mr4585175pgu.181.1632835211234; 
 Tue, 28 Sep 2021 06:20:11 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
 by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:20:10 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sireesh Kodali <sireeshkodali1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
Date: Tue, 28 Sep 2021 18:49:27 +0530
Message-Id: <20210928131929.18567-2-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928131929.18567-1-sireeshkodali1@gmail.com>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi
 phy
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

SoCs based on the MSM8953 platform use the 14nm DSI PHY driver

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 064df50e21a5..81dbee4803c0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-14nm
       - qcom,dsi-phy-14nm-660
+      - qcom,dsi-phy-14nm-8953
 
   reg:
     items:
-- 
2.33.0

