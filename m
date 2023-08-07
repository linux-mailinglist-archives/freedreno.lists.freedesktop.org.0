Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0764772C4F
	for <lists+freedreno@lfdr.de>; Mon,  7 Aug 2023 19:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56FB10E336;
	Mon,  7 Aug 2023 17:12:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62F210E326;
 Mon,  7 Aug 2023 17:12:12 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc1c1c68e2so29731225ad.3; 
 Mon, 07 Aug 2023 10:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428332; x=1692033132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=sS/VIkX47fuVcUKRL0cK2M6E4NLixhZ4dvdNS5yQN4wZFBy/NvIcAIDOMZlKsXmnaT
 qkDx6Msrx6ax7/jxstRRx0hXiYyaxZ0P18SReVIfZihM+jpDoIgxeTRi1VJiTGt14zrd
 P9J9ggKq9lMjx/HHtAbuuOWs1lt9BYwyoYqsgPht33IVBW2Eirc3VmswvwSewQFCxKwM
 O3MuO+NqJ8Dfwcsuv7rkzrrYP2GrO4uGOocy+Hlge+VqB4OktDEw1EqafkJF+luWzT19
 nXviOpAdXA/FraF/OBm3t0i5VZn9CAzp6HAetxm4cFUjErFyCxZhyaaeqx+CtLXh+olQ
 vwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428332; x=1692033132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=Vl4SFDywsrtZVGrCtHcZ2vUsvygArmDdDr4aIa0zFqSWvA9blt2UpDO0jUlZtu5XoX
 vVZZApVVSZM4h0NdTkYii6MVKpoqVK+nPqA3vmpewkwKjc9Yqm3hHofA8mXDJ3YbStwP
 /PO4w80Yxb82ZcOi/l9wzS2xCNTKSNDTF8yPoiwTFY1jDy+a0v9lla3SzBa1TzpNfi7v
 FKOmE4CNZPe27OMkN51ttEGNbKjjCEAJ0WHnhuOvMQX21+Aas0SR6hHLqVn9+h2OCNgU
 SiLZpqPPT59AzrZ6nBNxGI3yY64U6bIj/fqM14w7zXgwldzS7CuXla0hIsHQXtH/bXyn
 ADUg==
X-Gm-Message-State: AOJu0YyLboQlqV6W4zQSJlZMq7yrRgjYg80TyKZlM2BMPf2BrqVkC/Gt
 DMqe89839SfmvZV6Lmed+ViTuSAx+zU=
X-Google-Smtp-Source: AGHT+IHNX8/tpl8CGO0R5k+B2yYyWetCEGj10aF8tXzMfdM+leuP+DXeencaiMPqZLDVUD4/bv0C8g==
X-Received: by 2002:a17:903:32d0:b0:1bb:14e7:4fd0 with SMTP id
 i16-20020a17090332d000b001bb14e74fd0mr9285594plr.7.1691428331973; 
 Mon, 07 Aug 2023 10:12:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902b60400b001a95f632340sm7159020pls.46.2023.08.07.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Mon,  7 Aug 2023 10:11:41 -0700
Message-ID: <20230807171148.210181-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 7/9] interconnect: Teach lockdep about
 icc_bw_lock order
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Teach lockdep that icc_bw_lock is needed in code paths that could
deadlock if they trigger reclaim.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/interconnect/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index e15a92a79df1..1afbc4f7c6e7 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1041,13 +1041,21 @@ void icc_sync_state(struct device *dev)
 			}
 		}
 	}
+	mutex_unlock(&icc_bw_lock);
 	mutex_unlock(&icc_lock);
 }
 EXPORT_SYMBOL_GPL(icc_sync_state);
 
 static int __init icc_init(void)
 {
-	struct device_node *root = of_find_node_by_path("/");
+	struct device_node *root;
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&icc_bw_lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+	root = of_find_node_by_path("/");
 
 	providers_count = of_count_icc_providers(root);
 	of_node_put(root);
-- 
2.41.0

