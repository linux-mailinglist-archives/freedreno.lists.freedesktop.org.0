Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47577FA07
	for <lists+freedreno@lfdr.de>; Thu, 17 Aug 2023 17:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4F510E4BD;
	Thu, 17 Aug 2023 14:59:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DADE10E4D3
 for <freedreno@lists.freedesktop.org>; Thu, 17 Aug 2023 14:59:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bcc0adab4so1007237066b.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Aug 2023 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692284387; x=1692889187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyrnYd+/grcDQWPBP5YRxE3h8w3O63U4ojbQQv8+188=;
 b=i8FbFHOG1mmFj7PIdrs6Zmo5zyhxgDtP2ATKD8llf4JJfnMx7olqSqs+54+VgSSKlo
 J2oO8jVUS+elgWtZxpzcG8A53UMIypAcb7xJfBARwXOwtaRQpBpMcIxq5yIplYJAoKWt
 P1azHtVrokAvSW1fGaO69NqqtMo62ut9prYyWQqEybIM7yGealQUycmM28RpwAgVzYNp
 CBN0dZm2e8nxsNELv9aHp5yEd70V8jVxipzWI+pmn2QqiXUQ20phD1fbXHppYwifwS+o
 Fy8KNZ1Z/8y0DCPcqYTCLc/lBZExIxGTRe6K4gAYuvxmADo17shmuGBJ2vqSJUxhGClO
 2VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284387; x=1692889187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyrnYd+/grcDQWPBP5YRxE3h8w3O63U4ojbQQv8+188=;
 b=Go0eP4CJiaJMUgn0CwOEphkXtbPmn8ZBIkqepZzHMFH9cxy+mrg7+G5Z+jkVR0Y3Ne
 KQE/TLJ63cWxtZqNfz309u7sTOpE1ANPOnMNuXaQ/lJ8kjGTZ4BdC04ZgSMkhX/+zJGt
 z0bQKBdp5qcAgGYBZ2yJFw3jioRerto+5khnv/EjFNdKhxPZubjChKfy1fjRVLCM0Zqy
 F21kxNS0BYGB3uGPC96EyPugxB2E8UrgGqJE85oFq5DtrbJZpIUssar8WkxpnM/pxuZ0
 UPugGA5N4XoHnvRcNu2+jP2rNe3gSHkf11EV0DRDQQ89lckVGkKfAPO5TL8HyldobFAP
 fJKQ==
X-Gm-Message-State: AOJu0YwP7EBpR25HMd/WFx3XWkPeVRa1DsnmFdnDDw0QXsPQfVT8qSJT
 YXgN7c954h7VjHklf9nMwKfKkQ==
X-Google-Smtp-Source: AGHT+IFrDXU9RyQ2b51UNFwD8gODzimUQlViN1buaLRaNRS/xBOehnJnNWmJk7sJ/VfKKwLbM4dG8g==
X-Received: by 2002:a17:906:31cf:b0:99c:5623:a2f1 with SMTP id
 f15-20020a17090631cf00b0099c5623a2f1mr3775578ejf.48.1692284387650; 
 Thu, 17 Aug 2023 07:59:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 07:59:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 17 Aug 2023 17:59:40 +0300
Message-Id: <20230817145940.9887-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/4] arm64: dts: qcom: qrb5165-rb5: enable DP
 altmode
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add displayport altmode declaration to the Type-C controller node to
enable DP altmode negotiation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 3bd0c06e7315..c8cd40a462a3 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1423,6 +1423,13 @@ PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
 
+		altmodes {
+			displayport {
+				svid = <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.39.2

