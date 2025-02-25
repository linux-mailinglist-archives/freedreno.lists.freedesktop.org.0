Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DDA4362E
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 08:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7481610E592;
	Tue, 25 Feb 2025 07:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p7UG6gv1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AAD10E182
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 07:30:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so8666969a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Feb 2025 23:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740468631; x=1741073431; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
 b=p7UG6gv1SjP0T5PwGANjG92JPBoCV0OB82ed0p+yyAr33gc4B69w+x9JLx00HsSitQ
 NzkGZKCYCOkTQbwf5rYbjG49750paIwfW5+8EOu2AV9ALdKk/g4t02zvpgeLpMsX6Gi6
 FaOakmEI0d8rKTRWHGxhJcXKsgI04VksJ/+ENMyk8X0CsBkSvo/GqTDPdgI6BQv9cC26
 8hkZ0p9NwmZsyLvuguV1M5AnSxQNML/DL4HN1tZcMc+zbvZs0oJKTyYMhqyQIg5yX9Gd
 DncoH3qR0ZXHTf/8q6b3VuqmQGTMSab1g6dltqsN2jvuZJQ/aFKthwMWANKVYU8FE9py
 lOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740468631; x=1741073431;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
 b=oA5L2hPOyTni8AEotrwLHS4KuugRYJ3vTL61W3ZvaDMazs9EYHSp6Rxr1aSDIyojcf
 BsxPVs1FMC/S74nDBbXH36qpNIGj1r/FYqPXeOwY5/OCZrk0klNarv7SbZMzS6yhzX1f
 Hm6uPtC6XZnrOUtyLRR/9UuusFDB5VmRPFcQw3BZALAi23g8QQhPlMXZfmk4eNmUdqp9
 9ueqQv5/8CZA0XDLuCo19UMivjNK3MtyCrCeAqTgzcTfW0vm06sjOqygoz7VVlTQSyTr
 k5+w1LKv4gpT7NM2FTUenIXJRY8E/6Xc9J6pC7Ubowbd+Pb+J7oLuPqFso7fljFLULqX
 MyHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV69oyibgA9GrBTO34XeW22253GrT4Djtkj0qpMVqEoNL0cPMbqW/QLSXbzEcCL/VW64H9V88Y9qfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNc5/smXvaENZL8SrNTkMsNcf1PYAazQQtFoe2gxPhnAHzcSIG
 zjKbVR8VTXJpRHmXdM7aTnFBYsc8q8Opf/xZWCRpuThr2yHP680ItxBFCoWga5E=
X-Gm-Gg: ASbGncuvkBJLVNgtxCjLfQBvDZEYNCbBp/ZJXP6l61FLPI82CkVr4nWbWu5x69vczJA
 JDkOAh9Nyby1aRdpCsPArSK0RXd3aU9pryYFVDZDG+Xjcadc0COKiDgcvTaVUd3jrB8p0MAGlDN
 hZzjk75lDEUnEX0bCuGvfKepTloVFh31RV7dfVGsmE/UYOl9c583LT7TMz97SBqHmKsDZXlpt+e
 +4VDEGoDE1R+QW3f/wayTDMEqItA0lIUuNzj3Vr57NQhJ/y0gcXZzUySigOTYW8VMopexNGse87
 mZ+LlfV2lAzjVTHl5ST2l0xNRFKEmGE=
X-Google-Smtp-Source: AGHT+IF1jD1nIi0UqQ/yrLSB611MTk3aZB/2hvtf9cDDpXVP93eDIhNTWNWnPWPNHZu27Gv83YTAhQ==
X-Received: by 2002:a05:6402:27c8:b0:5e0:8261:ebb2 with SMTP id
 4fb4d7f45d1cf-5e0b70d6598mr16065265a12.12.1740468631260; 
 Mon, 24 Feb 2025 23:30:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e461f3e7f8sm788694a12.69.2025.02.24.23.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:30:30 -0800 (PST)
Date: Tue, 25 Feb 2025 10:30:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

If msm_gem_address_space_create() fails, then return right away.
Otherwise it leads to a Oops when we dereference "aspace" on the next
line.

Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index b877278888e6..35d5397e73b4 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -209,6 +209,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	if (IS_ERR(aspace)) {
 		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+		return aspace;
 	}
 
 	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
-- 
2.47.2

