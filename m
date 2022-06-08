Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4A542FCA
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A9610FAF9;
	Wed,  8 Jun 2022 12:07:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958210FAEB
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a15so32879631lfb.9
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
 b=zoUeZmH6+YhsKGt/+OtsIOhd03KmWslGLbyTmHplE7q6dwzKeYTnmkZMQCrMqWcDT4
 ENB6eiVIws3hdUaLZdT7rxppqZHlo+EWfHPU84W/gP33F4LjDBgMyuC81kcjBD9S5OCC
 cuwIV0/NLZXekhh0WMbb+j2JCvJSr4LsfPAjkc0ls0fpP3HudjhWmku4oPh3Ohe4LQO1
 2DKDjG2noCZA5pYUZxuwmUzwcDVEyL6gQIoxOHw34jpoR/eCTsBdVRXGbb1J+9CLRYzR
 EtkWtXBnnY2ILHsYCcckQjGFNR3Ak8RymPgXJktw5q0lMU0Usxzou5FdvZPd6wFW6FcA
 l0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
 b=VyILupTnmPYfqaj+PDgug44ZzqHzkYC5YulRtxhmCmMPCqph1LtZKRc4t8e2RIrONw
 I95oJDmqUl4hpit9U6AGbjkZxrvWAKE3M1Tzm6j8PRNKt41DBbyhL0/Q8wBKhuIGaNJU
 To3brngxOLCt4kCVCfbSXmBvK/3FOeOXjr5AUI+JfMOeWrjiblfEdn9tAbMkWULoXtoi
 OYXB4euSoHdQIMcTWoIn1u+8qO/UgvOPBJb2EswgwgyLNgr3kpDhydzH5KvXdyJPLslG
 wbCKrA0wCnrlZ3HH0CNa/m+FiqLw1irzJsjEgIdISBtRKuqxgLC/ExiP7SZTb6a0dZGx
 fG0g==
X-Gm-Message-State: AOAM531hOjAvQwAMv1/Go4JJ5UoYvvJOZuFQ0i2yZBEWBoWM80wVJpzt
 YGw+XHfDKsJOlPJ9KTcwFFfqBTfRfu3Us5ec
X-Google-Smtp-Source: ABdhPJz2NiZWUioo69UFimWOsc7iqwnrDHZDOQ0ftc1GX9KufMOGeb3fHe9xiD6jbW0mKqaIQz5IgA==
X-Received: by 2002:a19:f24e:0:b0:479:1376:793c with SMTP id
 d14-20020a19f24e000000b004791376793cmr19393937lfk.526.1654690052543; 
 Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  8 Jun 2022 15:07:18 +0300
Message-Id: <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 07/12] drm/msm/hdmi: enable
 core-vcc/core-vdda-supply for 8996 platform
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

DB820c makes use of core-vcc-supply and core-vdda-supply, however the
driver code doesn't support these regulators. Enable them for HDMI on
8996 platform.

Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7cb687458a56..67397fff645c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -399,7 +399,7 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 };
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, none),
+		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-- 
2.35.1

