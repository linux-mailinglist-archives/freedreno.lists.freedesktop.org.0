Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D1542FC0
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8410FAEB;
	Wed,  8 Jun 2022 12:07:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2410FADB
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i29so16143388lfp.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
 b=LhfKofCuo1hI/kyqKa7GESz/tFf5nTTEsRGD1drqYnsDSKTKl7mh7bjqOMVtcPzePR
 +d8NnY0Em/bybYJK+GfY61r9DoLU1p1HNrb26LJhZb1l4qzE/vnKh11DliTs98bndMU1
 pTsHLKiI5PEMWM67FRQLRzblAmmyzZ7aoHhFt1Lfd8j5V1ZF/t+2Bemio1dtTaYNeIoX
 p6bOhZqVZzeDQ823vnmjyZ4TjXq/nbxO5SulggVBKOmjpPW74XFxZj0H6smDQWLomNRx
 7y+etJlIb0WDVgJ8Zs0BMSERlp3ak1aDh258XRSZOhb3fsshb3khdppIYx3qEEv6fEQF
 +q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
 b=eCHiReN1DaNvPbkLfP3QvKAZxAc6NhOpOnHfop5OTdh0a+/Gsa+R6+nn64FbK9Pifd
 czWznSsQo31F0KrPeyXo8Sp6cKftKmK41Yc0G2Tjdm7fMqucblmTKINHTMFRafxUBhc1
 f/vjTNPgrXWq6ik0chLgFgQzzL5119g0X4t+rCZzaK2ejY+AVRx5aGJYeZEVg+cvNKmi
 URPllULzIaN3DPpIziXszaeyc2OcDZz5v0efaEONCfM8GdQPVLkxWJpOrLgF4DMBxMVY
 IkfVkiiw9E+PdN1KeHCPsFjcA8Oi0goMGvNJIsigDB2RTZeSHTl7yjRqOwzm76XDWXzL
 iyog==
X-Gm-Message-State: AOAM532KMJaakknJNLfEe1+WIlLfCUpXHl3+seCUimm5FUQrI7C60KiL
 ZOv8l+3z5GKtfghH3GOtU5DOcQ==
X-Google-Smtp-Source: ABdhPJz7tK93EXNnMP55322ciEx1xGXgkiQ6vvmmZXDmFnGwjAV/yE1fK6My8eJe0sLtueQUeBFgxg==
X-Received: by 2002:a19:a411:0:b0:478:f29b:e30e with SMTP id
 q17-20020a19a411000000b00478f29be30emr21631651lfc.334.1654690050658; 
 Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  8 Jun 2022 15:07:16 +0300
Message-Id: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux support
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

With the last (and only) in-kernel user of hdmi-mux regulator, drop it
from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..06b44b40ec09 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -358,7 +358,7 @@ static const char *hpd_reg_names_none[] = {};
 
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
-static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
+static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static struct hdmi_platform_config hdmi_tx_8960_config = {
-- 
2.35.1

