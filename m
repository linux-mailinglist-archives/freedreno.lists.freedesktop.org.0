Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C7279913
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188FD6E21D;
	Sat, 26 Sep 2020 12:52:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957006E213
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:52:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j2so6842681wrx.7
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffJxais4qGP0gvCu5GJ1ov8h/Ob+gH0ZybsxZFb8CJU=;
 b=izIYuruDFNqXltczjPsA76PTw+n862sTor1TddTJvNUgDDa2BvRL9Vzs1uzG5NOhTM
 XoSUS6FGEBarLJWx/a+UBeNjt0X7+XqzUZ6CQrW0tF1uTTrfFHRg93otdCE1Gl0SVzbO
 SKLCRHJujWHhSuPVTpjE/nfqWcrHs+1ijjGxJ4gdBfZIhBty8Lt1wjH9TGS8hq7NIMu5
 xh8+1vVgqorRd8aW40KfrnAsviUQ3DSjh5+R4CR1pBd/oG2d+DyevmFHrX2/2XgmljIH
 b6QEB8NsrIE0VAnMIQniDcWcUGNrAQTY6b9pCC4NjAfSmMAkz2COsWcUHU23C7N0gE8w
 suqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffJxais4qGP0gvCu5GJ1ov8h/Ob+gH0ZybsxZFb8CJU=;
 b=BoW0GOB8yP/7hG1zxeUEgY1d4Kz2Q6bU45MxrlMolHeXtqntFRh+l51Puzw1/TW4G+
 qG8chL2RY1tHht7hzxxrxHR5fnncfEl7POI9VMUbKUkS/UL34FWlzGL+rg+VeRL3XVfQ
 3zTah1yc6ZSr7/A+EN2IOGqXppVcQWsNdK+BGfafjVpUeBKr5iiJ6yuaFHVV9+ncEAOf
 hLL+ZFyV7XmAeuyx9PTEOyyILrvFE4RveQlC0vYLE3jjGcP6SUtv1ok5uIVOlHqCgund
 CXQ0hMimlpocNGmJq8UPHwq2cuK1QxnmHg/Rn4DMQlfDFgtJW1LEyX0QblqWDd8k4g5Z
 WP3w==
X-Gm-Message-State: AOAM531FAXYE3ydVyI/s6g8o44Es2VeeX8pGap7hYnRBStDUXQy5P+Tg
 1EUynpoyVkMtk3jGGiPD0J4=
X-Google-Smtp-Source: ABdhPJzeh/cPOy171Ct8PCqoVlJxp4O7WFQ7ahtAhPDNX1aSK65lu0g3sgP+HxnGbJxVLw9sVIPkPw==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr9997979wrx.164.1601124720185; 
 Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:45 +0200
Message-Id: <20200926125146.12859-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 6/7] drm/msm/a5xx: Disable flat shading
 optimization
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b2670af638a3..bdc852e7d979 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
 
+	/* Disable All flat shading optimization */
+	gpu_rmw(gpu, 0x00000E60, 0, 0x1 << 10);
+
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
