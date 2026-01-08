Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B03D06402
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 22:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564C910E381;
	Thu,  8 Jan 2026 21:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ArUW+S0A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DA410E7CD
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
 b=ArUW+S0A01e2gRafi4S8qWwTOL/9dZTVXhzWHLSgAwfTFLi3dKzxj1GT8CewnsKEiCo0lf
 QmwBqHAnB7m+HgbLa0xaQ4FS1Kb3DvrCKnqQzvFbdzj2fFy2RGaA4WEQBGf1v4D9L/+iLm
 A2FrXb0mRQE/jeTDTMr46MXiCjIIWrA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-zFOnKKcQO6SMcjn8CrVdqQ-1; Thu, 08 Jan 2026 16:19:17 -0500
X-MC-Unique: zFOnKKcQO6SMcjn8CrVdqQ-1
X-Mimecast-MFC-AGG-ID: zFOnKKcQO6SMcjn8CrVdqQ_1767907157
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-94120e0acbdso3871897241.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 13:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907157; x=1768511957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
 b=cIrW6d89MrxcmuGcTm9a03Ahu/1gEL1Th0bnGCFfmWJmNUmP6OB4N9ONVmb/GcvUsM
 Z/lLOcpMfUwi9U9xxwaBmdkXGOeZ5LvYZogl7RWVS1hvjlBVlLIBqx94LbyF+4kvkpGu
 gnt2rgsOjP6zu0QoclOJr7pW1pjVzJ5Z55RE5z/L7nupiG+jcF9Qut1DJ7IpLThS5SPW
 w3FEPnIYXaanse7ZhDH6JyZUJRU6G5pkQh0sSvZuCZs+nabDkDr84GgKUOfIiSlyrWqX
 dChWa9b/K3yaLa2UK5BfqzGnbh4t9BE9FBhdqE79hPlnsxDM413UKUmtwn46sYBn43Ws
 2QAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrSaDnuV3jUAyllyBTwNl/DBaRUM5l4Ms+UkzBtjpDRkwsWcoqoq3eS0eRmexTXAjc/JHqw9IDPrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdkMJyf/TuznkuPK2KaDtPJ3B8BvH+I4yJmYCELvK1Fv4mACsF
 WfJlmExoZn2IOkvZD6qMR/4f+oWRyhe51Mzu8nmrkPXqaubwqqjTWXBsWyvzeaqPawzfGkGcQWy
 TAZmiNQ69bXsQRFaqVsz1aE0rUeJHhQBzYAbODvmBnuc9NvpnBd3Rz4Z8aK6WWSbqpqlwmw==
X-Gm-Gg: AY/fxX6PomdN/QaQ3I8mJTBZhd7Effif28UmORdCamry/vMNj1gLSG7AsOXF8PCR+pf
 lhBJLtAlBEIOBsYZd2tvk9fWq6wfGOq/qXTKUwkvRlbQr0dJWq2q/lDVIdMw+5wtIofktMNFvTw
 3b8KrbvdkFDhSbLYkYNrS0YKUw1DuhW1R6FS54Bbiwfe69TIExV/tm9gdhjtLRqQrs0PxtyMYjK
 IinKSlbCWcZVvWycVZRwDUpvyHlsRCaH3eqEeQzABXLYiIBlDKA+B1j4/W/6jFlv5E/w3LKnywX
 pCJ/7hCriRjx4snUci36fwFKiRaZOLeHEhqf41VAr9pa2JxXf7RgI1Z8nSONg9EAFFnJXElQr8N
 Zpob2EmZC1Hr+KDc=
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id
 ada2fe7eead31-5ecb690ac30mr2675971137.38.1767907157168; 
 Thu, 08 Jan 2026 13:19:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0uRMIjA7XLKaSnU3wOhkRdxgxZI3Tqx0E2gNf3CGsOIh420QNoFs2vKVMT8dIcPxOmBSZqA==
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id
 ada2fe7eead31-5ecb690ac30mr2675959137.38.1767907156687; 
 Thu, 08 Jan 2026 13:19:16 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:19:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:42 -0500
Subject: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sZzvWmWZLBAg2O8T5kHMnq76Z89GPT7Dybdt2RJStY0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb1v5vpP9/g2Zw1x0vb3l5Xs8vY4qIY9ZTV6M3/p
 vSpfvMlO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIVyGG/znrI46vWXPXmZ1n
 evhLw6XT1O2//926j2222YecHWXuxbMZ/mm/r2e/wuzs0x9mvcteoup47ENm0fYpEwKEL07zVn7
 mzAEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LixsHBaeYkuGjjMwSy2C5I8MYOYyBX_FgCAW5Glba7A_1767907157
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index fdefcbd9c2848a1c76414a41b811b29e5fed9ddc..a156c7e7cea83286e7ad47aa9818761670c68e89 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -628,12 +628,7 @@ static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
 
 	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL,
-				       postdiv->width,
-				       postdiv->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, NULL, postdiv->width, postdiv->flags);
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

