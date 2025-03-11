Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E68A5CE71
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207B810E65A;
	Tue, 11 Mar 2025 19:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xvLwenxi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5646310E668
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43ce5cd91e5so3684315e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719740; x=1742324540; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=xvLwenxiqno9m4zyfCe0kN1svvnvp7LrHzDrgSWlisZTlcTBaFWQ1J0pbSqOYTJu2m
 nfHIMyNd2TCdDW3jrGDr1VkG5NN5MzT7MWwHWkqgClenuZolglSP96R6zWBtNh7dK8Hn
 +J5upLp2//AVougHmJunLTq466XVweK24l+aQ5kq69uEhiNdZ0N9czAgjdCzJGFqqLZ2
 cDT7ayEVWTiu8a+hOLEAwOVK9MgtQWg5591nwhDmrNk+g1hH3ydh/pBmvAzphh8WGlnG
 52ogyh3NgcHZzyfZ1Lzj83uJ/WRGDIk3535n+BYPKpr/tuinT1gv1V/8Oppqd6T3jvg+
 603A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719740; x=1742324540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=ZymhVsm1TVJRLc8a4ry7hVWTAdCmsV7PVe6WZaQTE1H1PzxBwOVv3wrfEbqfte0/BR
 mehK+kttdcmHKeI/vNWhBN1nJWULwEar6W2axp1LgZabHMvA0ILyBDpvr7eNpVATBaNe
 DcnvgG9M/aj+lNM9IFuzbgebPtO1E4JiWwtX/iBXEjY2fPNp2+dmZGBwj8HbcsdJnukg
 LhCYzAYcJAOfeQK+DnIBUTA1QcM1gqo2rvEmykNKRsOG71B9Gy9zfclgr55sA6XDKx/2
 ELeGpRl6njJsuve7pF8IgZFxbSsegsFz+dzUm3mJcz5vbxfWuKIv2UbdlExc+NFXIwqn
 Jq/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJLFq2nx6jnrDrh2XxUAtsJld+K1KddIkZRK/6fNYlhEyaFkU2e1VKhAUlpexyH9Gc/GamjHjK2/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBAGp7d1Onny9e8q1d9qPzdWsY5U4cxV9w6+KQMsC7Lv8irsSo
 X2B+Iflb3bxD0HLHduI13Qt0DPir4dDd/CIfNhOgukIbmtzn5ZaFc6PE7kh5rMI=
X-Gm-Gg: ASbGncuvnXKknw/iBhO1bQxtBkHG8fuVBjjkR2ZfrIRWBCXpRuMBi7/jdYFDdAJuSc1
 4gjhoJ1/1YcS+E3LKFnCIGlrqxMo4R9f/Nfi4p/FQsKhWicJPvFJHBtdNtSkEHqscwq2SdqmFqP
 uuHBnQazDGxvR6xVMRMEGFFDTo21sMVhCMYll67QIRg0suAw+OdPycQir8XGQ9Lpae5l0o4t0WO
 +LeF+VErqPNdPSaKV1NDZB9Gqa9OFIFpH2zDAc8YwzMXITvDUjCs9iOTu8lvc6uDTecariJobal
 jO19YO/E/qDmV9zdvS9BLSjImBUAt5tWAHP1R8vDWXFYSk71ZChHGy0KNMs=
X-Google-Smtp-Source: AGHT+IHLtSZoNCwGj6vMtj2XdtM72l1RzSdPaEdfWD7UtlotpUT2vtj04hr1SeJ+G3qYudDSC8CThQ==
X-Received: by 2002:a5d:5888:0:b0:38f:25bc:ac74 with SMTP id
 ffacd0b85a97d-3926beebfe8mr2187185f8f.8.1741719739709; 
 Tue, 11 Mar 2025 12:02:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:51 +0100
Subject: [PATCH v4 01/19] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-1-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g6ZcIsYl2/jMWfZyQs4pXVAtZzsF1td/uQveud5buEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0Iila38uBqZ/e++RoedX8m4tjtUuw4dYHgd89
 01aDXwNyxSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIpQAKCRDBN2bmhouD
 18SAD/9Ja9MlLoxgp84mpxJ3iNsSIk2hI0pvHpp0QQWl2u4PBQhXsbgJrqS8oFYLPUSnjWHn13V
 K6KfM5GPmBff9QqLW1/1lcrJ1a4nud/8fG4gGZW+DWxU6Fz5c9f6o2l6GnZk9Grc4gnUY4qjeju
 LuC/FeSuaASt4et6u5kPmWt/KyZMFnoiQGJfCdj03DMipKwJPYuR7zUTLkKInqTeJFXQaTH6jMV
 uug/IwDvzDS2W0AtxPlv+seBRGwwm7ej6JI6kEnRJf6GCaXeaMZ2BMfgy8vYEmyAqb42TU8kDAu
 NVzXfTSCcijHh7z/Cc1BrT5g9VBoYjYNd+XTFs5q0kbcKoUAM28dH1e3UkPz8K802KfgjiRPTLC
 VzXoMd5+eTz/bhso65kf0B5RapjiPVoMcr8ZpWTznIaqO2F/+bmISqub7iKgsDckk4GDzetDbCH
 jVuLHZfirPyym73QCfA3N1d6HPZ/PSNnilS2dsyQai/bafGJwGGr3rCk8P71bI0J/H6FFR0/4EA
 qXEZaiAMAYB0b/MDbbSlBjCxidR3ScS7oMA3dfzwfFGaBZ3HcTmc/xJWej9ys8ES/1FZH649Vyh
 DU6ujO7B4cp2d0Ec/EOKbRBGbsx6FndlNLgEHAXWveJ0MzpBx/QVso8WBeGQPxj6IK7UvJOUSyq
 yGZtjnJVyqK2yvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

