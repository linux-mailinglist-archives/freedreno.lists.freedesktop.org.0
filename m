Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15380741895
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 21:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E100510E0B8;
	Wed, 28 Jun 2023 19:05:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529F510E0B8
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 19:05:13 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6c3921c8bso2475161fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687979111; x=1690571111;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5YZzdJQyh4eu5fAj6xameoZPW5lmqQSZHtsSrZxy+c=;
 b=bApBKeIV6L+P7bQQSgdCs8KOomZuQ+P1vVzFbdcBYF5YrlqR1gQpUbDKW+svoxZM5u
 ZMI1O2A432MkFzaG9yEcIzwtnDdz7yUanUYRGGth1TcETQ9nw9TCowrr7KBXzjA4LaTT
 5a9wa4Mx67QZRyBtXHn535wSfV3hKRjiKJ8O6R7VMaIhU8OrO+kbE1JHkq26aLgK220A
 SlOWKQVRIMGY/BBPpmz2qqLFTj6aG1IUWc/dmxZA5aT9ZSYr01DHDkK0pZbIM0b67bCb
 G1p8PRTStaNe7WCI/CTPdXo6fR7CNQGEg7Na2JMDre/uMZseZJCfO5KoSO4gZyFtudW2
 uK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687979111; x=1690571111;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5YZzdJQyh4eu5fAj6xameoZPW5lmqQSZHtsSrZxy+c=;
 b=lGTxZq1+s7azGzUU4+A2gMVlWHiKPoQxtfTiq44zoABhRZfiJyDKtyzFenPR4nwhGO
 +YslLADzBVAiDpZC8+FanOuqefljmpxUEisq41lFIovLhhQREnsNywB4pDFnfjt/+wjP
 1oQ6Urn8qezEwhJyFJgoavh96APv8vhjekJKCJtCyQgClPD4AmIjjgqSJdiVarzovL3d
 6ZPez2cmJ4TKOqsPHD96KTBdsJw+P2dAic0c/DP+Pu3o5sPJQ+/aIUDrggNfax7c+yLI
 tAu5eV77mHEDy7US+Rony06/nCs3DsrQ9RSHMqvVqQwRsqaGfisk9WWzooQePC76b4rh
 bwFg==
X-Gm-Message-State: AC+VfDy9Z3t0ApCMjtBmnNpR9U0pagKcUYTN8CTzbeBqj2vPf3BS8/Sh
 nxKlBzfmu0Ln4Va+ZJCGOg0IOg==
X-Google-Smtp-Source: ACHHUZ4bn9WdqZwlwgpaohN+JH/FskgQr6To+oDImxYoZ8FAbp2paEayyppRUM7Xb7j7v5znECW0yA==
X-Received: by 2002:a2e:900a:0:b0:2b4:6195:bb26 with SMTP id
 h10-20020a2e900a000000b002b46195bb26mr22432303ljg.25.1687979110797; 
 Wed, 28 Jun 2023 12:05:10 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a2e9c46000000b002b6a85a7292sm1102616ljj.19.2023.06.28.12.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 12:05:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 21:05:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGOEnGQC/x2NQQqDMBAAvyJ77oJJrNp+RTwk221dkCiJihD8u
 0uPMzBMgcxJOMO7KpD4kCxLVDCPCmjy8ccoH2WwtXV1a3vcllUIfeueaIIjS6++a0wHGgSfGUP
 ykSZN4j7PKtfEXzn/h2G8rhsjRnTzcQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687979108; l=1049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yOF2V2vC/eERQ5I69KrybMFDlBclITTn/+Bht2rKkYY=;
 b=T9f2BftsBHUMn+H55F1KeMb0BOE9TuUoOA3jtNlB1lxYTYSv97uLuQMLHUS9T4OyQkR1hib9J
 t+Eg5u6zA8ICDEQPx9CoIlDczwxnK718qaXUbFdux/m3XE4IGEwzpIS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH] drm/msm/adreno: Assign revn to A635
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Recently, a WARN_ON() was introduced to ensure that revn is filled before
adreno_is_aXYZ is called. This however doesn't work very well when revn is
0 by design (such as for A635). Fill it in as a stopgap solution for
-fixes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..8ea7eae9fc52 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
 		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.revn = 635,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",

---
base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
change-id: 20230628-topic-a635-1b3c2c987417

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

