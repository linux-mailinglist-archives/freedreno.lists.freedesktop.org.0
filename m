Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C8643693
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 22:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6485D10E2AC;
	Mon,  5 Dec 2022 21:12:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9970910E2AA
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 21:11:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q7so14995119ljp.9
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 13:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Eq2ZXszLjKr//ikj+7g9JMKWJ4MAQFXRFYQxnRJH2ns=;
 b=uv+ysMBoXT9OnHKv2d2ki4+o8X18uddVwaH+9qoMgLHkXZr1y7R44ea/VhSpZQ7DYz
 1yALAGAZQ5JH369QRzwze66Sq7aIZl2dAMX1BdtW8wkXEZVMk3OyVDaX/80U3zZdTwVD
 jy3jMsLIKlkZZDqu3ZrYQYbspKuuZhB/FNPfjWlC1AHJ+OYWuHe6g/Mi3CXFMe1uHgih
 8h9zv522tJ2uFqhJ9XXrejJenWLGou3A5lbcQkzR5x8WpeuOuG4VXUrUCeGa59qU7M1E
 7QHiZl7dEhUPoJdwztGMxZbu62ot2vb86an7VugcCHooAtH2MDEufICxZbVOnKLEwgcG
 3x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eq2ZXszLjKr//ikj+7g9JMKWJ4MAQFXRFYQxnRJH2ns=;
 b=QtgveU0S6NWugJRjMhYz9kLEwxGh/6+UoT56rK0d57i4a4qO1j7mYz+RO3iljZBgm2
 xhjE1RsA+nQGN3XsVQKsRJF8DlUE00Bd/OqDwq4b+/t9ds3+cOWNI34E2VE3E6gZ+u4g
 YJMCKhtiwroKCNxx61rF1r+o1iRlQdwpDhF4CcC5TrZwswn2P+laTXoxY6yH2T7IN+i9
 GLUiU7usOuWjBlYw4ZA6L6JZXOazCbEyfnLwjM348WgKxClSgjsL0+QZ+jhWkcIEni+Q
 b6flV0oPBIPk6MX9LZ46d90pdqAXn3pB1jWt1fD8zxl43eei23GtVBY6SGsxbqs86tJj
 ZsKw==
X-Gm-Message-State: ANoB5pmH0klE8QrpBTBJhZSn+Sq8pbxEzBGg0a5W/UcU8QSoqmp7xMEg
 PUbcpbWPLz+U+U5EwSZYH/ctvA==
X-Google-Smtp-Source: AA0mqf40g4Eax0o9RTqpNOnSr4NFV/WsN+mtKCY5opKnXRZdgli634oXeQBgQNpNxXsndr+D+MAr3A==
X-Received: by 2002:a2e:bd87:0:b0:277:1cfe:398 with SMTP id
 o7-20020a2ebd87000000b002771cfe0398mr19179355ljq.10.1670274715882; 
 Mon, 05 Dec 2022 13:11:55 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05651c118900b00279d206a43bsm1241901ljo.34.2022.12.05.13.11.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:11:55 -0800 (PST)
Date: Tue, 06 Dec 2022 00:11:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <62FFEABE-0074-4836-84BE-2C88C83F8674@linaro.org>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-10-quic_bjorande@quicinc.com>
 <62FFEABE-0074-4836-84BE-2C88C83F8674@linaro.org>
Message-ID: <72DDE54D-8368-4E2A-82D6-30265118D7D4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v4 09/13] drm/msm/dp: Don't enable HPD
 interrupts for edp
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 6 December 2022 00:07:12 GMT+03:00, Dmitry Baryshkov <dmitry=2Ebaryshko=
v@linaro=2Eorg> wrote:
>
>
>On 5 December 2022 20:44:29 GMT+03:00, Bjorn Andersson <quic_bjorande@qui=
cinc=2Ecom> wrote:
>>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>>
>>Most instances where HPD interrupts are masked and unmasked are guareded
>>by the presence of an EDP panel being connected, but not all=2E Extend
>>this to cover the last few places, as HPD interrupt handling is not used
>>for the EDP case=2E
>
>I don't remember whether I asked that or not=2E Would it be possible to m=
ove hpd irq enablement to bridge's hpd_enable() / hpd_disable() callbacks ?=
 I think this would allow us to drop the is_edp checks=2E

Ignore this=2E I should read the series carefully=2E

>
>>
>>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>>Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>
>>---
>>
>>Changes since v3:
>>- None
>>
>> drivers/gpu/drm/msm/dp/dp_display=2Ec | 15 ++++++++++-----
>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/msm=
/dp/dp_display=2Ec
>>index 17fcf8cd84cd=2E=2Ebb92c33beff8 100644
>>--- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>+++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_pri=
vate *dp, u32 data)
>> 	}
>>=20
>> 	/* enable HDP irq_hpd/replug interrupt */
>>-	dp_catalog_hpd_config_intr(dp->catalog,
>>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
>>+	if (!dp->dp_display=2Eis_edp)
>>+		dp_catalog_hpd_config_intr(dp->catalog,
>>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>>+					   true);
>>=20
>> 	drm_dbg_dp(dp->drm_dev, "After, type=3D%d hpd_state=3D%d\n",
>> 			dp->dp_display=2Econnector_type, state);
>>@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_p=
rivate *dp, u32 data)
>> 			dp->dp_display=2Econnector_type, state);
>>=20
>> 	/* disable irq_hpd/replug interrupts */
>>-	dp_catalog_hpd_config_intr(dp->catalog,
>>-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
>>+	if (!dp->dp_display=2Eis_edp)
>>+		dp_catalog_hpd_config_intr(dp->catalog,
>>+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
>>+					   false);
>>=20
>> 	/* unplugged, no more irq_hpd handle */
>> 	dp_del_event(dp, EV_IRQ_HPD_INT);
>>@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_pr=
ivate *dp, u32 data)
>> 	}
>>=20
>> 	/* disable HPD plug interrupts */
>>-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false=
);
>>+	if (!dp->dp_display=2Eis_edp)
>>+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, fals=
e);
>>=20
>> 	/*
>> 	 * We don't need separate work for disconnect as
>

--=20
With best wishes
Dmitry
