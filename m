Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1389FC256
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 21:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FF710E4A4;
	Tue, 24 Dec 2024 20:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mQ6DQdYS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95610E4A4
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso5407318e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072867; x=1735677667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
 b=mQ6DQdYSL1jgnrHJ0c0H/GDeUZ65sWRBawLl988EbKa4Gvw+K8ptzfeVyCpU66ZNyQ
 n0FGHtlEsWGdsH6RCFhTj2Thrl+FlDLSWkGzj+xgik3KyRrGE1UBdJcr+lEhGj07kDH0
 5KQ8bMOvRrV5COyUT3RT3ic+HggcTo08Oaj0DnKrMlSVhhmJH6prXDOzR7k05oCr87jk
 xJw61cxhJo5RLRv58ebvhZyBfY+lnLhBvq9hBNjQDvm8W8wZKPpEER0qPF5KtgkL0oE+
 glNHxrkzzAMIBet6+G9PzAOAxtPcCeF+DE8OcyFpsUSxQnlYCgwBRyXo2H9dxjXKO3Xq
 rSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072867; x=1735677667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
 b=eXBfDllF/NLyjYsMiaTVdXx3SsgQ27pRs3jNXJj82gGshl51ZkrFHxbSth561mHwVt
 ZnxvdPjGMsN3/NbviuqZI4vxzcli19CFSrPKxtCuex3RJRPl97oqyC73nuvQMaCCqwfz
 f/coH0hqQgyf3xRK3F2imon5VbxAApIKYzL/TvKHDAGAPNBazCBH+q43hIZMpmPEL0kI
 GzUAn0zWiQ5SRZ2OVh0vfCznKxI0KwER5j+SmI628J4yi/NP2iY+95D3qoyS/T7Atbqt
 0Z17wp+bXjODpjIP/mqIOoO7rr0fO4Y5nUO/z9lyU2AoaozdeuoLJ1v73oh0LmtRxrLJ
 pULQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvyZMFspKeKEHwjc9+AzsHU96yaWTiLm5E5BGaz4P0FQpZYrMwb8FPQEHt/UzedvSVsu5/x4vOptc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsJbjVZVBUBiZy4Sk/1b9VFJNtptEqBEHVjseWU4A9TLEJY/gD
 HUNcrnQFzFqSc6dXX1NjKKw89s3CBtP5R6WNMQCpLJwfdOPM6ZxkCMYIcVrkd08=
X-Gm-Gg: ASbGncsGdp3UWnIHSlIn1XY7+gZivYkfR7458T5IA+EFJnp7NDMHTWLFy/BkhExpGRv
 zMwyIZi7thj68BYugjy8vE7HVaKJ6mFGOqmUsIbX2UOKDOwxqAwJEq2Rdz7XEobSkBqB14yRl8H
 YErVcVeRhRYewIt1bL76uxh95bBgfYCiBirM7jO+kX/5VS79LwRFIKv0v5kI+rJgCutK9MQ4sfO
 B4lu3ku0NTGbvrxpngX8DA2KAHatorjqVcNNCyZhXWqpMix+URPkA1/NMNXcTo837YM3ncb
X-Google-Smtp-Source: AGHT+IH5+6vfwjy4BTw9YCLzcbedK1FJ6WQCRricdTAApVBK2Uzvp8laNd8QmgHwa+lXbQ8/PXrF7w==
X-Received: by 2002:a05:6512:ba6:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-54229582051mr5745971e87.46.1735072867393; 
 Tue, 24 Dec 2024 12:41:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
Date: Tue, 24 Dec 2024 22:40:58 +0200
Message-Id: <173507275852.561903.13981702571183938186.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>
References: <20241216083319.1838449-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 16 Dec 2024 09:33:13 +0100, Arnd Bergmann wrote:
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>  1046 |                                             vbif->name);
>       |                                             ~~~~^~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: fix -Wformat-security warnings
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49c2e01be19c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
