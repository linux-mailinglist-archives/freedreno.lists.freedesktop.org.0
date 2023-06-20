Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F10736AF1
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84BB10E2C2;
	Tue, 20 Jun 2023 11:30:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A06810E2C2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:30:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f870247d6aso3057941e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260602; x=1689852602;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
 b=bTHzG1h+kD6J4+vhZGTHsDyQ7K9hsvawjTM8WE0Y53ykw8hcvb33uM/nwcsw9F1zeq
 9Qm4mrsxdOXq4zyXtZ13fmn+xqzbMBpL7QcIdWZMFb8mFPO2f8/xfle2z8/Vneebn5js
 aypBK6IFASC/87S/DLQjnkLRr2dkPMxE6P6ppFcR5sXRoZwijyQjqSikNtcoHWtAB7Fr
 lr1fhfjnnkJPyKCylS+BVb+BxD3trYNhV+B9hplhpSMFhwnZvZJP631l4UPfLlogvATX
 eLfeZUgszbL4qoQM1uwF5Yc511j7pNni5TVMP5sWq3C3167ZSvJVa8avuVDIz889LByE
 bdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260602; x=1689852602;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
 b=QicZi0Zt0Bj28zjROzIoievFbEM563gJvKjQ5s0aglmnCXtA+n1GoDZTg08oN33QH0
 kU9MFe4PZLeluo6tIQR36Tr1MyO2P8ASY3mHAt3dKOi2UO3+OACd1uFGbz2XMswneN2U
 X+dYIKoOPj6jCWuNOfa2NckD8vmNUgsvCd6YC3FvlyDr3GjxiFETAlsKdd3QTFhV2MRz
 qvEMebkbwmbA3BV9r3IL2C1cVE+HfYBWy12Qlgx0bd1MxDTcYQITtb/GmkJ2Z6cZZ6Lf
 eEFra2xMmuok/JT7pvlL/QIlfYPwa2gFrJQ6UodE9cFPD54ev9SMwAyaU5XKE6Eo9oj9
 orsQ==
X-Gm-Message-State: AC+VfDw2WqqHLIRLDJwpmgpBKVc/PScjyxA1DNP/rqReitTZff/Cy9aq
 khfK9FTXpXx0fuqJPKUHLulwjynAIrJc9AVqQZs=
X-Google-Smtp-Source: ACHHUZ6QUJ2NUSmwlMllnTnlwhUMH00U8cch0Y7x4JBrv6lDEvgv8KA6emtEHyH6UtWTECxcKatUAQ==
X-Received: by 2002:a19:5055:0:b0:4f6:14d1:596d with SMTP id
 z21-20020a195055000000b004f614d1596dmr6541924lfj.61.1687260602313; 
 Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:29:57 +0200
Message-Id: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWNkWQC/x2N0QrCMAwAf2Xk2UBXRcVfEZG0jTYwu5KoKGP/b
 vDxDo5bwFiFDU7DAspvMZmbw7gZIFdqd0YpzhBD3IZ9DPicu2QsJr1+r9ofyLQ7jodEhSiBZ4m
 MMSm1XD1sr2ly2ZVv8vl/zpd1/QHd37O+dwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=636;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wCUG/R9HXWMnAwuGxYhXrhmjszSC6nEVuCGugxXUvag=;
 b=oLojyqv8R2Yxb/4Bx0OPl53gbOYVtZGEvfDiYfytg8gFL3uXbs/agnHkUqk3yiONeq1e1qWA5
 xXDfhniDSFOBXQOoH7SqEunzIznVpy6eWLBLQDUMiYekoP0h3tuhm+y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 0/2] DSIPHY RPM
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

Some recent SoCs use power rails that we model as GENPDs to power the
DSIPHY. This series attempts to make such configurations suspendable.

Tested on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-dsiphy_rpm-ea4817badaab

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

