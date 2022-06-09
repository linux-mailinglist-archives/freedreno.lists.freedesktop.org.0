Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E0544BB6
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E902E11BE7E;
	Thu,  9 Jun 2022 12:24:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81F11BE6C
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so37684846lfg.7
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfEwLmFa+rnyzBz5wSYp6fbvYkhVpWWBGyc2jbt7Ik8=;
 b=sHmblSRIN65HZRXS7KK3EBqEX68dT9yNdXqkjJBLOcYDi3m1fjIJuhQgVU+Tx7Pqsj
 8UcSSZYixHZpw39TB785gaHCVhBvco5Z70ik112YlIG929SRVgc9yL45GexZuC8iYiqS
 jw2lFrJhP4W50beZ9CwaqapprUlePI69JXEJoDIlX668rQCliUJtmX5XG8MPEnxPMF4n
 su2j4mb4ad/DcaXxACJ5WrmaJjrGGDkpoYf5A5qDMGWBFfvxmzbm0aAQ7wLPXd+2+jSQ
 /ZbKH6zfHF9grbX7jnx/I0TpPK8h2q4duPSLIQ9LhO7BlmonQCxa8JYREYN8usgeGpdW
 hu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfEwLmFa+rnyzBz5wSYp6fbvYkhVpWWBGyc2jbt7Ik8=;
 b=sgp//fL0I+SDuPivCsIEs9vh2ritMc6FQyH+gZtKPqiEq9QlNNv/bnlmz5oRjt9NUw
 PSzdk35XS0jGM8AKRDJ1wMI25RN+YZwjut5/K6XW7vLmOt8MLaVyO/Cwk+xpNriQg8IJ
 R9FAUl3fn8QLDnBzNnbn/E7h70OU6G4ZP/kSxgQTe8AzUFHsri+vPl1y6heGm66Irrbv
 tkr3cpR8Z2fOfZg10GEU9FlPboqQdFfeKyyl+510hXrUa9aJJa4r8f8RQHExQrtYbc6i
 nEXiqdVdHiPdTPmBJY3yC4DZc2K6bXjGL63e6XmqVHSPJAghQHcTNzq/eimNfijGFwW7
 tpSA==
X-Gm-Message-State: AOAM530ddcrDu8ZsVtxbhA4Ud3+vEvBOnFZDVP/bwlblTXRlCFWplAco
 npgL4cFN66R2MMAEdtfwIQ1KEA==
X-Google-Smtp-Source: ABdhPJwcuqI/GbvvTWxReKbRyLRjsRwZsuau95EK6p4dFoxSEmp+Q+0VqmZPsfz74TayqYctZ2KHxA==
X-Received: by 2002:a05:6512:220f:b0:479:65e1:c802 with SMTP id
 h15-20020a056512220f00b0047965e1c802mr7685829lfu.250.1654777436272; 
 Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:41 +0300
Message-Id: <20220609122350.3157529-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 05/14] drm/msm/hdmi: drop the hdmi-mux support
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 73070ec1a936..7267167d5ef1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -361,7 +361,7 @@ static const char *hpd_reg_names_none[] = {};
 
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
-static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
+static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static struct hdmi_platform_config hdmi_tx_8960_config = {
-- 
2.35.1

