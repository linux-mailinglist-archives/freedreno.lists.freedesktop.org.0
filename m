Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5D369852
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 19:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98C6EC2C;
	Fri, 23 Apr 2021 17:28:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1D46EC29
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 17:28:23 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id z2so13370749qkb.9
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dIM7Z+izOVG/oERmdhb/AMzsUaJVmcES7PVqS331VM=;
 b=apOR0knurXWFkWtUKkhaYdc0wvkv0INvP0vg2nRSRsUKi9dcrFP87lQjZqxyvrgqNI
 YwqkMrKG1/kahvSQV4MMcfd/RECKjK+QlxSPWgTMk55Hc+6o5P1BF5b0HaK6TzkTc2kX
 w0dft9Ljn6gOwIvMF4JyesNuF6FePqO6bpuqI382E4xW3hiZEQ/IQ01OpcER25BuJ86o
 jyr4QBKPZQRpBymWZFZtaCp6kDKtfJnv9jy9s+VHKC5P3jVp/hbeSt7J0NaEbmZHc6GP
 eaCteezieRkwN4rKLTAwMmyYm8+dahqgFTdoP+F3il1VAvmrCWiYh1NAET0y/ltSheTO
 RIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dIM7Z+izOVG/oERmdhb/AMzsUaJVmcES7PVqS331VM=;
 b=OnV/xjFqxYSzCxIPyifC4yy5IUkxnB4gmQe8QQDVVMxwgvcaliNqZNaQGPs2vxWV5w
 xMCgczKEpyDIXNJyjgDPbMyU3JPKYuyQOMEDbkyuHB1R2IT+LdMHLE0fFJFNzFcHvyas
 dJ9nwy6cnq1PcL63CRuiJsbMJax/BsAALtBFivxhlwPl806diDwfTXsmu1WKDjKwD3lP
 VhQQhHFECbh4hFu1MqYPlevc7oh4BQKIrct8QLQ9EG2sjEE6nX/Z1ufrOv64KYZ3Fexw
 12m11qfy3DoSP3P98jTZ0vqE4CA2u8xzBxI7RfPE92hq/W6qiM1q+r0MT4DFV33O83nh
 4KRQ==
X-Gm-Message-State: AOAM531Yo8M54E5liLTWAT49jN7WKw6bSAHOtoIEGo9AXrjuMh3tYZ9c
 rlkyDjqAwDn+SDtDrT98zNwUq0ovVfjIWhast4M=
X-Google-Smtp-Source: ABdhPJxArxkdk3Sbb5pycb0lGdXVtFll8pGKYnMJCsR7OqSOwl+mhD2ZRyqP2CBOfxpc8LqVI+uXpg==
X-Received: by 2002:a37:a34b:: with SMTP id m72mr4953889qke.92.1619198902742; 
 Fri, 23 Apr 2021 10:28:22 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y23sm4782627qkb.47.2021.04.23.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:28:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 13:24:40 -0400
Message-Id: <20210423172450.4885-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423172450.4885-1-jonathan@marek.ca>
References: <20210423172450.4885-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add qcom,
 dsi-phy-cphy-mode option
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document qcom,dsi-phy-cphy-mode option, which can be used to control
whether DSI will operate in D-PHY (default) or C-PHY mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index b9a64d3ff184..7ffc86a9816b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -124,6 +124,7 @@ Required properties:
 Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
   regulator is wanted.
+- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is wanted.
 - qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
 					panels in microseconds. Driver uses this number to adjust
 					the clock rate according to the expected transfer time.
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
