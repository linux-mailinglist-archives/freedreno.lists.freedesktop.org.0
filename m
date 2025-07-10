Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E26B0088E
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D706910E935;
	Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h18WQlFe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B5C10E946
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
 b=h18WQlFe5UUL/UN9iSZPBMR2TMCNDRfczaZPj4jAe9HLabWcLAS4UFl7TMmCMuzpVhoBVN
 cfnK0VtDATeG6z3MefBANIqwZvsY4LjEeOFvccwRJamVE4Ax+9StTNCC4P/GHx6nMEzH4a
 BC7U64JhjBhj7w8Emi5B1xIj7R6N5FA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-yW2Tjd_BMWyhn7zboeOp_w-1; Thu, 10 Jul 2025 12:28:00 -0400
X-MC-Unique: yW2Tjd_BMWyhn7zboeOp_w-1
X-Mimecast-MFC-AGG-ID: yW2Tjd_BMWyhn7zboeOp_w_1752164879
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so227273885a.0
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164879; x=1752769679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
 b=lsTQIOVSzJh6rUE/ohHTMprj5pPDEoxVj1IdpiHiM8OKdOKLVa+/YwMtNGJqLtQ4s5
 WJYx5mbCaWEWQMoHqgCUnBSvu+4iQQ80tgELBE1xQIxEQS/9othkuc376iy6hRH5vBJY
 +z789dAmP1l5JgXaX+i4wDTH2u4NAAFMs98zuuV8y1ZlLz5mSH27zvA/Z5Il2tWQU+9A
 lfkHodyDIV2mx8vFuSKJ3PNWXPOBK4i4kqfDUfolrahRGnO1en2oTdG3xTdE0pQRkYiy
 GdcozWpFmZWNrhmXwza2BXStprLT4+HFgYl+EoiiGEwKmSHDcnDReJ7hg4q+hIQhj5fx
 3WzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0ctX05inri+9cXMNSTsOpFs8DNcaFKeZNAd9cvNb6DZX71oc3ikMp541wnMkSZn33IwssVK5zlgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgDmI4XTGsjsg9bKm5mb1q0xQybGcYvlaO6rT/Mx5rGeX9Wq0C
 SiiSFf8JszqO4fTHVJ0DKxbD2vqAMVv1jpZkdyeHOPgVQUNmrABvSww6XpOZIrCWoMtzEpuxZ4G
 xxmwRlTNEr/QxFteIqBN9P1+TPIGbz6HDEm85PJy4gmAwnrYbv5Pbpef3DtNmz2+Djne+Lw==
X-Gm-Gg: ASbGncvPFYkow5wUgIoyCiitKJXnERLfv4ihhhcrXejA/+GamRWygAQ/xgdApR+gc1B
 NmF6bqZbzzFQybLlLhQP9Z9LzFJmBkDMy1SPcuFH1SYUH5yvCd0JVC5NUmvhPYDOLv4UNHJn0fx
 6b/USBZXGWW9/WoiATNId2W7l/bI7wX+Si229djhRPYstr95yKVDtnCrJVl3qZ9PfuotiIB8t7H
 +UfZfm+K1NPJOy5O215O+GTpLJdS4hdP6a3SQ3Q3VyIPT2x8OErIq2jnglQZF39i2TreS4zWJfI
 WBjky9KJrbn5o9a43AlfpkwxD7lFZCSzqznJZJ8zGZ3GSG/or3tojeu2cZbN
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7dc998bae5cmr548838185a.21.1752164879324; 
 Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhR4yI/meVA7B4yGGlSkWsy9sNAiu5N3YSBwGR+IQy1ADhUxQ0QJAqnJLJknz5+tK3xy+vA==
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id
 af79cd13be357-7dc998bae5cmr548832785a.21.1752164878821; 
 Thu, 10 Jul 2025 09:27:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:31 -0400
Subject: [PATCH 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-5-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1798;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
 b=+3BZqcT2g8BzgtT08Ofg1fLcRnpWlgjhSzHJ0bgUn4yuktzceZYntu7KHdODtXiXiNcU928l7
 zP16Ptox34vCfs3DTh/Se8N38Ou8pARiNhSmor1jXf2v9OU+tuAkQxY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fIm3CL9yo-IrccB_UPUQfaGh4dTtQ9JsMrYAXXI12gQ_1752164879
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..eecc4e2ed51547709f9643c52eb2468f17966de8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,21 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_7nm_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
-		return  pll_7nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
-		return  pll_7nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_7nm->phy->cfg->min_pll_rate)
+		req->rate = pll_7nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_7nm->phy->cfg->max_pll_rate)
+		req->rate = pll_7nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
-	.round_rate = dsi_pll_7nm_clk_round_rate,
+	.determine_rate = dsi_pll_7nm_clk_determine_rate,
 	.set_rate = dsi_pll_7nm_vco_set_rate,
 	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
 	.prepare = dsi_pll_7nm_vco_prepare,

-- 
2.50.0

